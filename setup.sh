#!/bin/bash

sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 lua5.2 gcc g++ subversion git autoconf libncurses-dev synaptic

sudo /usr/share/doc/libdvdread4/install-css.sh 

cd ~
mkdir workspace
cd workspace
git clone https://github.com/fish-shell/fish-shell.git
cd fish-shell
./configure
make
sudo make install

ls -s ~/dotfiles/.vimrc ~/.vimrc
mkdir .xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
