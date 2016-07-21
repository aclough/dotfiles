#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc
sudo apt-get install vlc xmonad vim-gtk suckless-tools libdvdread4 \
  synaptic mosh calibre sshfs bcache-tools fish gnome-tweak-tool \
  python-gpgme python-pip lua5.2 gcc g++ autoconf clang \
  cabal-install golang ipython exuberant-ctags python-rosinstall tree \
  gwp gitg silversearcher-ag nim pylint linux-tools-common

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# Might want python math
# pip install numpy sklearn

# I'll want it later
mkdir ~/bin

# Enable DVD playback
sudo /usr/share/doc/libdvdread4/install-css.sh

# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
#sudo apt-add-repository ppa:oibaf/graphics-drivers

# Fix for getting Gnome and XMonad playing nicely together post 14.04
sudo apt-add-repository ppa:gekkio/xmonad
sudo apt-get update
sudo apt-get install gnome-session-xmonad

# Install rust
sudo apt-add-repository ppa:hansjorg/rust
sudo apt-get update
sudo apt-get install rust-stable cargo-stable

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
git clone --depth=1 https://github.com/zah/nimrod.vim.git
git clone --depth=1 https://github.com/rust-lang/rust.vim.git rust.vim
git clone --depth=1 https://github.com/Yggdroot/indentLine.git
git clone --depth=1 https://github.com/mileszs/ack.vim.git
git clone --depth=1 https://github.com/luochen1990/rainbow.git

# For swapping escape and cap locks
gnome-tweak-tool
