#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc

sudo apt install vim-gtk fish cmake gcc-avr arduino python-gpgme python-pip \
  lua5.2 gcc g++ autoconf clang ipython exuberant-ctags tree gitg \
  silversearcher-ag pylint linux-tools-common gdb python2.7-dbg python-dumbnet \
  python-dev python-numpy python-scipy python-matplotlib

# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

sudo pip install snakeviz

# I'll want it later
mkdir ~/.local/bin ~/rhr

# Get the code
cd ~/rhr
git clone https://andrewclough@bitbucket.org/yuli_rhr/rightpick.git pick
git clone https://andrewclough@bitbucket.org/yuli_rhr/rightpickfirmware.git firmware


# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/pickb.sh ~/.local/bin/pickb.sh
ln -s ~/dotfiles/pickt.sh ~/.local/bin/pickt.sh

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
