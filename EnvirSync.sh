cp .extra .path .sh ~/

git ca -m "Synced"
git push origin master

source ../dotfiles/bootstrap.sh

cd ~/
