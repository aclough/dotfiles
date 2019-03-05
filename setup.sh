#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc

# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# I'll want it later
mkdir ~/.local/bin ~/rhr

# Get the code
git clone https://andrewclough@bitbucket.org/yuli_rhr/rightpick.git ~/rhr/pick


# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/pickb.sh ~/.local/bin/pickb.sh
ln -s ~/dotfiles/pickt.sh ~/.local/bin/pickt.sh
ln -s ~/dotfiles/pickbc.sh ~/.local/bin/pickbc.sh
ln -s ~/dotfiles/pickbc_plus.sh ~/.local/bin/pickbc_plus.sh
ln -s ~/dotfiles/remote_mupdate.sh ~/.local/bin/mupdate.sh

ln -s ~/dotfiles/theanorc ~/.theanorc

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
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
