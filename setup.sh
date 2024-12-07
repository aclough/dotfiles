#!/bin/bash
# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

set -e

sudo apt update
sudo apt dist-upgrade

# Utilities and misc
sudo apt install -y vlc fonts-firacode python3-pip \
ripgrep fd-find curl variety calibre clangd libssl-dev gnome-tweaks neofetch \
shellcheck sox black python3-pylsp python3-neovim fzy git pkg-config libssl-dev \
naev tig usb-creator-gtk gparted nvtop nodejs libboost-program-options-dev
# shellcheck:  For neovim checking
# sox:  For the `play` command
# black:  Python formatter
# corectrl:  System control https://gitlab.com/corectrl/corectrl
# python3-pylsp:  Python language server
# python3-neovim:  We might want it
# fzy:  For neovim file/buffer/etc finding
# pkg-config: For Rust packages
# libssl-dev: For Rust packages
# naev: Video game
# tig: git browser
# usb-creator-gtk: Create startup disks
# gparted: Edit partitions
# nvtop: Monitor GPU usage
# nodejs: For Github copilot
# libboost-program-options-dev: For C++ argparse

# Optional tools I want to record here:
# horizon-eda: PCB layout tool

# Get Chrome
mkdir -p ~/.config/google-chrome/Default
ln -s ~/dotfiles/chrome_custom_dicionary.txt ~/.config/google-chrome/Default/Custom\ Dictionary.txt
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm google-chrome-stable_current_amd64.deb

# Get Zoom
#wget https://zoom.us/client/5.14.7.2928/zoom_amd64.deb
#sudo apt install -y ./zoom_amd64.deb
#rm zoom_amd64.deb

# Use dconf dump and gsettings list-recursively to get these
# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
# Use ctrl-alt-l for locking
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Ctrl><Alt>l']"

# Nvim options
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt -y install neovim
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim --headless "+Lazy! update" +qa
nvim --headless "Copilot setup" +qa

# fish
sudo apt install -y fish
# Need conf.d for Rust install to add something to
mkdir -p ~/.config/fish/conf.d
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish

# kitty
sudo apt install -y kitty
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# rofi
sudo apt install -y rofi
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi_config.rasi ~/.config/rofi/config.rasi

# sway
sudo apt install -y sway
mkdir -p ~/.config/sway
ln -s ~/dotfiles/sway_config ~/.config/sway/config

# rclone cloud backup
sudo apt install -y rclone
mkdir -p ~/.config/rclone
# Copy instead of link to prevent private info from getting into git
cp ~/dotfiles/rclone.conf ~/.config/rclone/rclone.conf

# Enable DVDs
sudo apt-get install -y libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup component add rust-src rust-analysis rust-analyzer

cargo install tealdeer battop cargo-update
tldr --update

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh

# Zig
snap install zig --classic --beta

# Font
mkdir ~/.fonts
cd ~/.fonts
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv

# I'll want it later
mkdir -p ~/.local/bin
mkdir -p ~/workspace

# Setup conda
cd ~/workspace
FILENAME=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/$FILENAME
bash $FILENAME -b -p ~/workspace/conda
rm $FILENAME

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/backup.sh ~/.local/bin/backup.sh
ln -s ~/dotfiles/restore_backup.sh ~/.local/bin/restore_backup.sh

# Start variety, should prompt for autostart
mkdir -p ~/Pictures/Wallpapers
variety &

# Grab my sudoku solver
cd ~/workspace
git clone git@github.com:aclough/sudoku.git
