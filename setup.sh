#!/bin/bash

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Neovim unstable
sudo add-apt-repository ppa:neovim-ppa/unstable

# Revert nautilus to previous default search
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead

sudo apt update
sudo apt dist-upgrade

# Utilities and misc
sudo apt install -y fish vlc neovim fonts-firacode python3-pip rofi kitty \
ripgrep fd-find curl variety calibre clangd libssl-dev gnome-tweaks neofetch \
shellcheck sox black python3-pylsp python3-neovim fzy git pkg-config libssl-dev \
naev rclone tig usg-creator-gtk
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
# rclone for new cloud backup
# tig: git browser
# usb-creator-gtk: Create startup disks

# Optional tools I want to record here:
# horizon-eda: PCB layout tool

set +e
sudo apt install -y python3-pydrive
sudo apt install -y python3-pydrive2
# python3-pydriveX: For deja-dup, depending on OS version
set -e


# Get Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
mkdir -p ~/.config/google-chrome/Default
ln -s ~/dotfiles/chrome_custom_dicionary.txt ~/.config/google-chrome/Default/Custom\ Dictionary.txt
rm google-chrome-stable_current_amd64.deb

# Get Zoom
wget https://zoom.us/client/5.14.7.2928/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb
rm zoom_amd64.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
gsettings set org.cinnamon.desktop.peripherals.touchpad send-events 'disabled'
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
gsettings set org.cinnamon.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.cinnamon.desktop.input-sources xkb-options "['caps:escape']"

# Enable DVDs
sudo apt-get install libdvd-pkg
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
curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/FiraCode.zip
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
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir -p ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/backup.sh ~/.local/bin/backup.sh
ln -s ~/dotfiles/restore_backup.sh ~/.local/bin/restore_backup.sh
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi_config.rasi ~/.config/rofi/config.rasi
mkdir -p ~/.config/rclone
# Copy instead of link to prevent private info from getting into git
cp ~/dotfiles/rclone.conf ~/.config/rclone/rclone.conf

# Nvim options
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim --headless "+Lazy! update" +qa

# Start variety, should prompt for autostart
variety &
