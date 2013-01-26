#!/bin/bash

sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 lua5.2 gcc g++ subversion git autoconf libncurses-dev synaptic hal sakura cabal-install

sudo /usr/share/doc/libdvdread4/install-css.sh 

cd ~
mkdir workspace
cd workspace git clone https://github.com/fish-shell/fish-shell.git
cd fish-shell
./configure
make
sudo make install

ln -s ~/dotfiles/.vimrc ~
mkdir .xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
mkdir ~/.config/sakura
ln -s ~/dotfiles/sakura.conf ~/.config/sakura

cd ~
mkdir .vim
cd .vim
git clone https://github.com/tpope/vim-pathogen.git
mkdir autoload
ln -s ~/.vim/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
git clone https://github.com/nanotech/jellybeans.vim.git
mkdir colors
ln -s jellybeans.vim/colors/jellybeans.vim colors
mkdir bundle
cd bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jeetsukumaran/vim-buffergator.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/tpope/vim-fugitive.git
