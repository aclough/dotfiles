cd ~
sudo apt install vlc xmonad suckless-tools mosh synaptic cabal-install rhr-rightpick-deps tree \
    vim-gtk fish gcc-avr arduino python-pip silversearcher-ag pylint \
    lua5.2 g++ autoconf clang ipython exuberant-ctags  gitg  cmake python2.7-dbg gdb gcc \
    python-dev python-numpy python-scipy python-matplotlib linux-tools-common python-dumbnet\
    python3-nose ubuntu-desktop

# A supplamental script for those things that I'm only going to want on my main
# as opposed to shared work computers
# Get Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

sudo addgroup aclough dialout

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

# Fix for getting Gnome and XMonad playing nicely together post 14.04
sudo apt-add-repository ppa:gekkio/xmonad
sudo apt-get update
sudo apt-get install gnome-session-xmonad

# Get cabal going
cabal update

# Install yeganesh
cabal install yeganesh

# Add ctypesgen for RHR firmware interface
sudo pip install ctypesgen
sudo pip install sympy
# For Neovim
pip3 install --user neovim jedi mistune psutil setproctitle

# Get more code
git clone https://andrewclough@bitbucket.org/yuli_rhr/rightpickfirmware.git ~/rhr/firmware

unlink ~/.local/bin/pickb.sh
ln -s ~/dotfiles/pickbc.sh ~/.local/bin/pickb.sh

unlink ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh

ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
ln -s ~/dotfiles/yeganesh_run.sh ~/.local/bin/yeganesh_run.sh
ln -s ~/dotfiles/cam.sh ~/.local/bin/cam.sh
