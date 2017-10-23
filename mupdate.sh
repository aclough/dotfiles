#!/bin/bash
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
cd ~/.vim/jellybeans.vim
git pull
cd ~/.vim/vim-pathogen
git pull
cd ~/.vim/bundle/ack.vim/
git pull
cd ~/.vim/bundle/ctrlp.vim/
git pull
cd ~/.vim/bundle/indentLine/
git pull
cd ~/.vim/bundle/rainbow/
git pull
cd ~/.vim/bundle/vim-airline/
git pull
cd ~/.vim/bundle/vim-buffergator/
git pull
cd ~/.vim/bundle/vim-easymotion/
git pull
cd ~/.vim/bundle/vim-fugitive/
git pull
cd ~/.vim/bundle/syntastic/
git pull
