#!/bin/bash

# Script to do all the housekeeping stuff I want to do whenever I install Ubuntu on a new computer.

# Utilities and misc

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
# Focus follows mouse when not in xmonad
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
# Swap caplocks and escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

sudo addgroup aclough dialout

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-add-repository ppa:gekkio/xmonad
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt update
sudo apt install vlc xmonad suckless-tools mosh synaptic tree gparted \
    vim-gtk fish gcc-avr arduino pylint python-pip python3-pip \
    lua5.2 g++ autoconf clang ipython exuberant-ctags  gitg  cmake python2.7-dbg gdb gcc \
    python-dev python-numpy python-scipy python-matplotlib linux-tools-common python-dumbnet\
    python3-nose ubuntu-desktop rofi gnome-session-xmonad neovim ripgrep

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb


curl https://sh.rustup.rs -sSf | sh
cargo install tealdear

# I'll want it later
mkdir ~/.local/bin ~/rhr

# Add ctypesgen for RHR firmware interface
sudo pip install ctypesgen
# For Neovim
pip3 install --user neovim jedi mistune psutil setproctitle

fish -c fish_update_completions

sudo update-alternatives --config x-terminal-emulator

git clone git@bitbucket.org:yuli_rhr/rightpick.git
git clone git@bitbucket.org:yuli_rhr/servermanagement.git

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
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/deploy.sh ~/.local/bin/deploy.sh
ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
ln -s ~/dotfiles/cam.sh ~/.local/bin/cam.sh

fish -c fish_update_completions

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall
