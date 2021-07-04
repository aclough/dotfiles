#!/bin/bash

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Driver stuff
# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# sudo add-apt-repository ppa:kisak/kisak-mesa
# For AMD power management
# Sadly 20.04 only for now
# sudo add-apt-repository ppa:slimbook/slimbook
# sudo apt install slimbookamdcontroller

# Desktop
# Sway
# sudo add-apt-repository ppa:s.noack/ppa
# Revert nautilus to previous default search
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead

# Neovim unstable
sudo add-apt-repository ppa:neovim-ppa/unstable

# Utilities and misc
sudo apt install fish mosh vlc neovim fonts-firacode python3-pip rofi kitty
ripgrep curl variety calibre clangd

# Get Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

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
sudo snap install nim-lang --classic
sudo snap alias nim-lang.nim nim
sudo snap alias nim-lang.nimle nimble

# Zig
snap install zig --classic --beta

# I'll want it later
mkdir -p ~/bin

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir -p ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/bin/restart.sh
ln -s ~/dotfiles/mupdate.sh ~/bin/mupdate.sh
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/rofi
echo "rofi.theme: /usr/share/rofi/themes/android_notification.rasi" > ~/.config/rofi/config

fish -c fish_update_completions

# Nvim options
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall

# Start variety, should prompt for autostart
variety &
