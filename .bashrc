
# add home directory to python path to enable 'import illustris_python'
export PYTHONPATH=/home/tnguser/:$PYTHONPATH

# limit automatic multithreading
export OMP_NUM_THREADS=2
export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export NUMBA_NUM_THREADS=1
export JULIA_NUM_THREADS=1
