cp .extra .path .spacemacs aptgetSync.sh ~/

git ca -m "Synced"
git push origin master

source ../dotfiles/bootstrap.sh
rm ~/.curlrc

source ~/.aptgetSync.sh

