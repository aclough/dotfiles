#!/bin/bash

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Fix for getting Gnome and XMonad playing nicely together post 14.04
sudo apt-add-repository ppa:gekkio/xmonad
# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
#sudo add-apt-repository ppa:paulo-miguel-dias/pkppa
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# Sway
# sudo add-apt-repository ppa:s.noack/ppa
# Revert nautilus to previous default search
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead

# Neovim unstable
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update

# Utilities and misc
sudo apt install fish mosh vlc neovim fonts-firacode xmonad \
python3-pip gnome-session-xmonad rofi kitty pylint \
gitg linux-tools-common fzf ripgrep curl variety calibre \
pyflakes clangd
  
snap install monolith # A way of saving webpages

# Get Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7 gconf-service libgconf-2-4
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse

# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# Enable DVDs
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Python
pip3 install neovim
pip3 install python-language-server


# Rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src rls rust-analysis

cargo install racer # For nvim completion

sudo apt install libssl-dev
cargo install tealdeer # for tldr pages
tldr --update

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
PATH=/home/aclough/.nimble/bin:$PATH
nimble install inim
nimble install nimpy
nimble install nimlsp

# Zig
snap install zig --classic --beta

# I'll want it later
mkdir -p ~/bin

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
xmonad --recompile
mkdir ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/bin/restart.sh
ln -s ~/dotfiles/mupdate.sh ~/bin/mupdate.sh
mkdir ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

mkdir ~/.config/rofi
echo "rofi.theme: /usr/share/rofi/themes/android_notification.rasi" > ~/.config/rofi/config

fish -c fish_update_completions

# Nvim options
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall

