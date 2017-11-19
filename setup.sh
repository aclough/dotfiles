#!/bin/bash

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# To make the fish version I get more up to date
sudo apt-add-repository ppa:fish-shell/release-2
# Fix for getting Gnome and XMonad playing nicely together post 14.04
sudo apt-add-repository ppa:gekkio/xmonad
# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
#sudo apt-add-repository ppa:oibaf/graphics-drivers
# Neovim
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt update

# Utilities and misc
sudo apt install vlc xmonad neovim suckless-tools \
  synaptic mosh calibre fish python-dev python3-dev \
  python-pip python3-pip gcc g++ autoconf clang curl \
  cabal-install golang ipython exuberant-ctags tree \
  gitg silversearcher-ag nim pylint linux-tools-common screen \
  python-numpy python-scipy python-matplotlib gnome-session-xmonad\
  boinc-client-opencl boinc-manager

# Get Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# Enable DVDs
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Python
pip install scikit-learn jedi
pip3 install neovim

# Haskell
cabal update
cabal install yeganesh

# Rust
curl https://sh.rustup.rs -sSf | sh
cargo install racer # For nvim completion
rustup component add rust-src

# I'll want it later
mkdir -p ~/bin

# Take the stuff from this dotfiles folder (that I care about) and symlink it
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

# Nvim options
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall

