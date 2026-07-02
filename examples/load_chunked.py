import illustris_python as il
import h5py
import numpy as np

# helper functions for chunked load of a set of indices from a snapshot
def pSplitRange(indrange, numProcs, curProc):
    """ Divide work. Input: a 2-tuple of [start,end] indices. Return: a new range subset.
    If inclusive==True, then assume the range subset will be used e.g. as input to snapshotSubseet(),
    which unlike numpy convention is inclusive in the indices."""
    assert len(indrange) == 2 and indrange[1] > indrange[0]

    if numProcs == 1:
        if curProc != 0:
            raise Exception("Only a single processor but requested curProc>0.")
        return indrange

    # split array into numProcs segments, and return the curProc'th segment
    splitSize = int(np.floor( (indrange[1]-indrange[0]) / numProcs ))
    start = indrange[0] + curProc*splitSize
    end   = indrange[0] + (curProc+1)*splitSize

    # for last split, make sure it takes any leftovers
    if curProc == numProcs-1:
        end = indrange[1]

    return [start,end]
    
def snapshotSubsetLoadIndicesChunked(basepath, snapnum, partType, field, inds, nChunks=20):
    """ If we only want to load a set of inds, and this is a small fraction of the
    total snapshot, then we do not ever need to do a global load or allocation, thus
    reducing the peak memory usage during load by a factor of nChunks or
    sP.numPart[partType]/inds.size, whichever is smaller. Note: currently only for
    a single field, could be generalized to multiple fields. """
    ptNum = il.util.partTypeNum(partType)

    with h5py.File(il.snapshot.snapPath(basepath,snapnum), 'r') as f:
        header = dict(f['Header'].attrs.items())
    numPartTot = il.snapshot.getNumPart(header)[ptNum]

    subset = il.snapshot.getSnapOffsets(basepath, snapnum, 0, "Subhalo")

    ind_frac = inds.size / numPartTot * 100
    print('Loading [%s, %s], indices cover %.3f%% of snapshot total.' % (partType,field,ind_frac))

    # get shape and dtype by loading one element
    subset['lenType'][ptNum] = 1
    sample = il.snapshot.loadSubset(basepath, snapnum, partType, fields=[field], subset=subset, sq=False)
    
    fieldName = list(sample.keys())[-1]
    assert fieldName != 'count' # check order guarantee

    sample = sample[fieldName]

    shape = [inds.size] if sample.ndim == 1 else [inds.size,sample.shape[1]] # [N] or e.g. [N,3]

    # allocate
    data = np.zeros(shape, dtype=sample.dtype)

    # sort requested indices, to ease intersection with each indRange_loc
    sort_inds = np.argsort(inds)
    sorted_inds = inds[sort_inds]

    # chunk load
    for i in range(nChunks):
        print(' %d%%' % (float(i)/nChunks*100), end='', flush=True)

        indRange_loc = pSplitRange([0,numPartTot-1], nChunks, i)

        if indRange_loc[0] > sorted_inds.max() or indRange_loc[1] < sorted_inds.min():
            continue

        # which of the input indices are covered by this local indRange?
        ind0 = np.searchsorted(sorted_inds, indRange_loc[0], side='left')
        ind1 = np.searchsorted(sorted_inds, indRange_loc[1], side='right')

        if ind0 == ind1:
            continue

        # load subset
        #data_loc = sP.snapshotSubsetP(partType, field, indRange=indRange_loc)
        subset['offsetType'][ptNum] = indRange_loc[0]
        subset['lenType'][ptNum] = indRange_loc[1] - indRange_loc[0]
        data_loc = il.snapshot.loadSubset(basepath, snapnum, partType, fields=[field], subset=subset, sq=True)

        # sort_inds[ind0:ind1] gives us which inds are in this data_loc
        # the entires in data_loc are sorted_inds[ind0:ind1]-indRange_loc[0]
        stamp_inds = sort_inds[ind0:ind1]
        take_inds = sorted_inds[ind0:ind1] - indRange_loc[0]

        data[stamp_inds] = data_loc[take_inds]

    return data
