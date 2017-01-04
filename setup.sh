#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc

sudo apt install vlc xmonad vim-gtk suckless-tools \
  synaptic mosh sshfs fish gnome-tweak-tool \
  python-gpgme python-pip lua5.2 gcc g++ autoconf clang \
  cabal-install golang ipython exuberant-ctags tree \
  gitg silversearcher-ag pylint linux-tools-common gdb python2.7-dbg \
  python-dumbnet python-dev python-numpy python-scipy python-matplotlib

# Get Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# I'll want it later
mkdir ~/bin ~/rhr

# Enable DVD playback
# sudo /usr/share/doc/libdvdread4/install-css.sh

# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
#sudo apt-add-repository ppa:oibaf/graphics-drivers

# Fix for getting Gnome and XMonad playing nicely together post 14.04
sudo apt-add-repository ppa:gekkio/xmonad
sudo apt-get update
sudo apt-get install gnome-session-xmonad

# Get cabal going
cabal update

# Install yeganesh
cabal install yeganesh

# Add ctypesgen for RHR firmware interface
sudo pip install ctypesgen
sudo pip install snakeviz
sudo pip install sympy

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/bin/restart.sh
ln -s ~/dotfiles/yeganesh_run.sh ~/bin/yeganesh_run.sh

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
git clone --depth=1 https://github.com/kien/ctrlp.vim.git
git clone --depth=1 https://github.com/jeetsukumaran/vim-buffergator.git
git clone --depth=1 https://github.com/Lokaltog/vim-easymotion.git
git clone --depth=1 https://github.com/tpope/vim-fugitive.git
git clone --depth=1 https://github.com/bling/vim-airline.git
git clone --depth=1 https://github.com/Yggdroot/indentLine.git
git clone --depth=1 https://github.com/mileszs/ack.vim.git
git clone --depth=1 https://github.com/luochen1990/rainbow.git

# For swapping escape and cap locks
gnome-tweak-tool
