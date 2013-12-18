#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc
sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 \
  subversion git synaptic mosh calibre sshfs gnome-do \
  gnome-session-fallback gmrun python-boto fish


# Programming tools
sudo apt-get install lua5.2 gcc g++ autoconf libncurses-dev clang cabal-install \
  texlive-latex-base golang checkinstall ipython

# Emacs
sudo apt-get install emacs24 emacs-goodies-el emacs24-el pymacs golang-mode \
  yaml-mode ghc-mod auctex

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# I'll want it later
mkdir ~/bin

# Enable DVD playback
sudo /usr/share/doc/libdvdread4/install-css.sh 

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/.vimrc ~
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# Install all my vim addons
mkdir ~/.vim
cd ~/.vim
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
