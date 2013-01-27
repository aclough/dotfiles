#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc
sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 \
  subversion git synaptic hal terminator mosh 

# Programming tools
sudo apt-get install lua5.2 gcc g++ autoconf libncurses-dev clang cabal-install \
  texlive-latex-base

# Emacs
sudo apt-get install emacs24 emacs-goodies-el emacs24-el pymacs golang-mode \
  yaml-mode ghc-mod auctex

# Enable DVD playback
sudo /usr/share/doc/libdvdread4/install-css.sh 

# Install the fish shell fom the git head
cd ~
mkdir workspace
cd workspace git clone https://github.com/fish-shell/fish-shell.git
cd fish-shell
./configure
make
sudo make install

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/.vimrc ~
mkdir .xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
mkdir ~/.config/terminator
ln -s ~/dotfiles/terminator ~/.config/terminator/config # Used different name to avoid confusion

# Install all my vim addons
cd ~
mkdir .vim
cd .vim
git clone https://github.com/tpope/vim-pathogen.git
mkdir autoload
ln -s ~/.vim/vim-pathogen/autoload/pathogen.vim ~/.vim/autoload
git clone https://github.com/nanotech/jellybeans.vim.git
mkdir colors
ln -s ~/.vim/jellybeans.vim/colors/jellybeans.vim ~/.vim/colors/jellybeans.vim
mkdir bundle
cd bundle
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jeetsukumaran/vim-buffergator.git
git clone https://github.com/Lokaltog/vim-easymotion.git
git clone https://github.com/tpope/vim-fugitive.git
