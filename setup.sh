#!/bin/bash
<<<<<<< HEAD

set -e

# Script to do all the housekeeping stuff I want to do whenever I install Endeavour on a new computer.
# This is in case the later steps fail because of out of date keyrings
#sudo pacman -S archlinux-keyring

sudo pacman -Syu
sudo paccache -r

# Utilities and misc
sudo pacman -S fish neovim vlc python-pip rofi kitty ripgrep curl variety \
    calibre clang neofetch shellcheck sox fzy python-lsp-server python-pynvim \
    base-devel zig xclip wl-clipboard gparted transmission-gtk \
    python-pipx rclone naev tig fd nemo nvtop
# shellcheck:  For neovim checking
# sox:  For the `play` command
# black:  Python formatter
# corectrl:  System control https://gitlab.com/corectrl/corectrl
# python3-pylsp:  Python language server
# python3-neovim:  We might want it
# fzy:  For neovim file/buffer/etc finding
# xclip: For neovim clipboard
# wl-clipboard: For neovim wayland clipboard
# pkg-config: For Rust packages
# libssl-dev: For Rust packages
# pipx: install non-distro python packages
# rclone for new cloud backup
# naev: Video game
# tig: git browser
# fd: better find
# gparted: Edit partitions
# nemo: For xmonad
# nvtop: monitor GPU usage

yay -S google-chrome
mkdir -p ~/.config/google-chrome/Default
ln -sf ~/dotfiles/chrome_custom_dicionary.txt ~/.config/google-chrome/Default/Custom\ Dictionary.txt

# New settings changes for the Cinnamon or Gnome desktop
# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
# Super drags windows
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.libgnomekbd.keyboard options "['caps\tcaps:escape']"
# Newly launched windows don't grab focus
gsettings set org.gnome.desktop.wm.preferences focus-new-windows 'strict'
# Use ctrl-alt-l for locking
gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Ctrl><Alt>l']"

# Nvim options
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim --headless "+Lazy! update" +qa
nvim --headless "Copilot setup" +qa

# fish
# Need conf.d for Rust install to add something to
mkdir -p ~/.config/fish/conf.d
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish

# kitty
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf

# rofi
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi_config.rasi ~/.config/rofi/config.rasi

# rclone cloud backup
mkdir -p ~/.config/rclone
# Copy instead of link to prevent private info from getting into git
cp ~/dotfiles/rclone.conf ~/.config/rclone/rclone.conf

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

rustup component add rust-src rust-analysis rust-analyzer

cargo install tealdeer battop cargo-update
tldr --update


# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh


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
