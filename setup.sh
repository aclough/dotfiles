#!/bin/bash

set -euo pipefail

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead
sudo apt update
sudo apt install vlc xmonad suckless-tools mosh synaptic tree gparted \
    vim-gtk fish gcc-avr arduino pylint python3-pip lua5.2 g++ \
    autoconf clang exuberant-ctags  gitg  cmake python2.7-dbg gdb gcc \
    python-dev python-numpy linux-tools-common \
    python3-nose rofi gnome-session-xmonad neovim ripgrep maven \
    shellcheck variety minicom  stlink-tools

rm ~/.config/google-chrome/Default/Custom\ Dictionary.txt
ln -s ~/dotfiles/chrome_custom_dicionary.txt ~/.config/google-chrome/Default/Custom\ Dictionary.txt


curl https://sh.rustup.rs -sSf | sh
cargo install tealdeer

# I'll want it later
mkdir -p ~/.local/bin ~/rhr ~/workspace

# Add ctypesgen for RHR firmware interface
sudo pip install ctypesgen
# For Neovim
pip3 install --user neovim mistune psutil setproctitle
pip3 install --user pygame # For gripper visualization

sudo update-alternatives --config x-terminal-emulator

# For ssh filesystem mounting
mkdir mount

cd ~/rhr
git clone git@bitbucket.org:yuli_rhr/rightpick.git pick
git clone git@bitbucket.org:yuli_rhr/servermanagement.git
git clone https://github.com/swagger-api/swagger-codegen

mkdir symlinks
ln -sf ~/rhr/pick/software/drivers/arms/python/ symlinks/arms
ln -sf ~/rhr/pick/software/utils/python/util symlinks/util
ln -sf ~/rhr/pick/software/drivers/barcodelib/python/ symlinks/barcodelib
ln -sf ~/rhr/pick/software/utils/python/enumerations/ symlinks/enumerations
ln -sf ~/rhr/pick/software/monitoring/python/ symlinks/monitoring
ln -sf ~/rhr/pick/software/tools/python/ symlinks/tools
ln -sf ~/rhr/pick/software/planner/python/ symlinks/planner
ln -sf ~/rhr/pick/software/api/python/mission symlinks/missionn -sf

cd swagger-codegen
git checkout v3.0.10
mvn clean package

# Take the stuff from this dotfiles folder (that I care about) and symlink it
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
mkdir -p ~/.config/fish
ln -s ~/dotfiles/config.fish ~/.config/fish
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/pickb.sh ~/.local/bin/pickb.sh
ln -s ~/dotfiles/pickt.sh ~/.local/bin/pickt.sh
ln -s ~/dotfiles/pickbc_plus.sh ~/.local/bin/pickc.sh
ln -s ~/dotfiles/tunnel.sh ~/.local/bin/tunnel.sh
ln -s ~/dotfiles/live-viewer.sh ~/.local/bin/live-viewer.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/regen-api.sh ~/.local/bin/regen-api.sh
ln -s ~/dotfiles/deploy.sh ~/.local/bin/deploy.sh
ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
mkdir -p ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
ln -s ~/dotfiles/xmonad.desktop ~/.config/autostart
ln -s ~/dotfiles/cam.sh ~/.local/bin/cam.sh
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi_config ~/.config/rofi/config

fish -c fish_update_completions

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall

# Start variety, should prompt for autostart
variety &
