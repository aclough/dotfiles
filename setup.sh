#!/bin/bash

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Neovim unstable
sudo add-apt-repository ppa:neovim-ppa/unstable

# Utilities and misc
sudo apt install fish vlc neovim fonts-firacode python3-pip rofi kitty \
ripgrep curl variety calibre clangd libssl-dev gnome-tweaks neofetch \
lutris \ # Game launcher
shellcheck \ # For neovim checking
sox \ # For the `play` command
black \ # Python formatter
corectl \ # System control https://gitlab.com/corectrl/corectrl
python3-pylsp \ # Python language server
python3-neovim \ # We might want it
fzy \ # For neovim file/buffer/etc finding
python3-pydrive2 # For deja-dup


# Get Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
mkdir -p ~/.config/google-chrome/Default
rm ~/.config/google-chrome/Default/Custom\ Dictionary.txt
ln -s ~/dotfiles/chrome_custom_dicionary.txt ~/.config/google-chrome/Default/Custom\ Dictionary.txt

# Get Zoom
wget https://zoom.us/client/5.14.7.2928/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Revert nautilus to previous default search
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead

# Enable DVDs
sudo apt-get install libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# Zig
snap install zig --classic --beta

# Font
mkdir ~/.fonts
cd ~/.fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv

# I'll want it later
mkdir -p ~/.local/bin

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir -p ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi_config.rasi ~/.config/rofi/config.rasi

fish -c fish_update_completions

# Nvim options
ln -s ~/dotfiles/nvim ~/.config/nvim

# Start variety, should prompt for autostart
variety &
