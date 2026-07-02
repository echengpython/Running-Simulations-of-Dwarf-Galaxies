find /home/tnguser -name "sim_read.py"
head -25 /home/tnguser/learning_and_replications/sim_read.py
head -25 /home/tnguser/learning_and_replications/sim_read.py
ls /home/tnguser/sims.TNG
ls /home/tnguser/sims.TNG/TNG50-1
ls /home/tnguser/sims.TNG/TNG50-1/output
ls /home/tnguser/sims.TNG/TNG50-1/output/groups_135
find /home/tnguser -type d -name "groups_135"
ls /home/tnguser/sims.illustris
ls /home/tnguser/sims.illustris/Illustris-3/output | tail
find /home/tnguser -name "snap_z_age.txt"
cd ~/learning_and_replications
ls
find /home/tnguser -name "snap_z_age.txt"
tnguser@cbae61dafa25:~/learning_and_replications$ find /home/tnguser -name "snap_z_age.txt"
find /home/tnguser -name "snap_z_age.txt"
find . -name "snap_z_age.txt"
grep -R "snap_z_age" -n .
git status
mv sim_read.py scripts/sim_read.py
git add scripts/sim_read.py
git commit -m "Update sim_read with revised version"
git push
git pull origin master --rebase
git push
git stash push -m "WIP before pull"
git pull origin master --rebase
git stash pop
git add .
git commit -m "Update sim_read and notebook changes"
git push
cd ""
git remote add origin https://github.com/echengpython/-running-dwarf-galaxy-simulations.git
git branch -M main
git status
git remote -v
git status
git add .
ps aux | grep git
kill 85
ps aux | grep git
rm -f ~/.git/index.lock
ls
git status
cd learning_and_replications
ls
git status
git remote -v
git rev-parse --show-toplevel
git ls-remote origin
git rev-parse --show-toplevel
git ls-remote origin
git add learning_and_replications/baryon_evolution_replication.ipynb
rm -f /home/tnguser/.git/index.lock
cd ~
git add learning_and_replications/baryon_evolution.ipynb
git add learning_and_replications/baryon_evolution_replication.ipynb
git add learning_and_replications/sim_read.py
git status
git add learning_and_replications/baryon_evolution.ipynb
git add learning_and_replications/baryon_evolution_replication.ipynb
git add learning_and_replications/sim_read.py
git status
git commit -m "Added baryon replication notebook"
git config --global user.email "cheng.2118@buckeyemail.osu.edu"
git config --global user.name "Eling Cheng"
git commit -m "Added baryon replication notebook"
git push -u origin master
cd ~
nano .gitignore
git add .gitignore
git commit -m "Add gitignore to clean repo"
git push
mkdir -p learning_and_replications/notebooks
mkdir -p learning_and_replications/scripts
mv learning_and_replications/*.ipynb learning_and_replications/notebooks/
mv learning_and_replications/*.py learning_and_replications/scripts/
git add .
git commit -m "Restructure repo into notebooks and scripts"
git push
git config --global pull.rebase false
git config --global init.defaultBranch main
ls ~/.ssh
ssh-keygen -t ed25519 -C "cheng.2118@buckeyemail.osu.edu"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/id_ed25519ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cd ~
git remote set-url origin git@github.com:echengpython/-running-dwarf-galaxy-simulations.git
git remote -v
ssh -T git@github.com
git remote -v
cd ~
git status
git add .gitconfig
git status
cd ~
git restore --staged .ssh 2>/dev/null
git restore --staged .gitconfig
git status
echo ".ssh/" >> .gitignore
git add .gitignore
git commit -m "Add gitignore to exclude system and SSH files"
git push
pwd
ls
ls notebooks
cd "/home/tnguser/replications_and analysis"
ls
ls scripts
ls /home/tnguser/sims.TNG/TNG50-1
grep basePath "/home/tnguser/replications_and analysis/scripts/sim_read.py"
mkdir -p ~/Illustris-3/output/groups_135
cd ~/Illustris-3/output/groups_135/
wget -nd -nc -nv -e robots=off -l 1 -r -A hdf5 --content-disposition --header="API-Key: 23532cb8609575ecb3dd36d5f6d4009f" "http://www.tng-project.org/api/Illustris-3/files/groupcat-135/?format=api"
rm -rf /home/tnguser/Illustris-3/output/groups_135
ls /home/tnguser/Illustris-3/output
rm -rf /home/tnguser/Illustris-3
git rebase -i HEAD~3
git status
git restore .
git stash push replications_and_analysis/notebooks/baryon_evolution.ipynb replications_and_analysis/notebooks/baryon_evolution_replication.ipynb replications_and_analysis/notebooks/sim_read.py
git stash push replications_and_analysis/notebooks/baryon_evolution.ipynb replications_and_analysis/notebooks/baryon_evolution_replication.ipynb replications_and_analysis/notebooks/sim_read.py
git stash push replications_and_analysis/notebooks/baryon_evolution.ipynb replications_and_analysis/notebooks/baryon_evolution_replication.ipynb replications_and_analysis/notebooks/sim_read.py
ls
ls replications_and*
git stash push "replications_and analysis/notebooks/baryon_evolution.ipynb" "replications_and analysis/notebooks/baryon_evolution_replication.ipynb" "replications_and analysis/notebooks/sim_read.py"
ls "replications_and analysis/notebooks"
git stash push "replications_and analysis/notebooks/baryon_evolution.ipynb" "replications_and analysis/notebooks/baryon_evolution_replication.ipynb" "replications_and analysis/notebooks/sim_read.py"
git stash push -u "replications_and analysis/notebooks/baryon_evolution.ipynb" "replications_and analysis/notebooks/baryon_evolution_replication.ipynb" "replications_and analysis/notebooks/sim_read.py"
git add learning_and_replications
git commit --amend -m "Removed old learning_and_replications notebooks"
git push --force
git commit -m "Removed old learning_and_replications notebooks"
rm -rf learning_and_replications
git add -A
git commit -m "Removed learning_and_replications folder"
git push --force
ls -l "/home/tnguser/replications_and analysis/notebooks"
