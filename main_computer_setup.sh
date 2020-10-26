cd ~
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-add-repository ppa:gekkio/xmonad
sudo add-apt-repository ppa:x4121/ripgrep
sudo apt update
sudo apt install vlc xmonad suckless-tools mosh synaptic rhr-rightpick-deps tree \
    vim-gtk fish gcc-avr arduino python-pip silversearcher-ag pylint \
    lua5.2 g++ autoconf clang ipython exuberant-ctags  gitg  cmake python2.7-dbg gdb gcc \
    python-dev python-numpy python-scipy python-matplotlib linux-tools-common python-dumbnet\
    python3-nose ubuntu-desktop rofi gnome-session-xmonad neovim ripgrep python-pip python3-pip

# A supplamental script for those things that I'm only going to want on my main
# as opposed to shared work computers
# Get Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# Don't use touchpad if I've got another pointer availabile
gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled-on-external-mouse
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'

sudo addgroup aclough dialout

# Remove the shopping lense
sudo apt-get remove unity-lens-shopping

curl https://sh.rustup.rs -sSf | sh
cargo install tldr

# Add ctypesgen for RHR firmware interface
sudo pip install ctypesgen
# For Neovim
pip3 install --user neovim jedi mistune psutil setproctitle

fish -c fish_update_completions

bounce --inject-ssh-config

sudo update-alternatives --config x-terminal-emulator

git clone git@bitbucket.org:yuli_rhr/rightpick.git
git clone git@bitbucket.org:yuli_rhr/servermanagement.git

unlink ~/.local/bin/pickb.sh
ln -s ~/dotfiles/pickbc.sh ~/.local/bin/pickb.sh

unlink ~/.local/bin/mupdate.sh
ln -s ~/dotfiles/mupdate.sh ~/.local/bin/mupdate.sh

ln -s ~/dotfiles/suspend.sh ~/.local/bin/suspend.sh
ln -s ~/dotfiles/restart.sh ~/.local/bin/restart.sh
ln -s ~/dotfiles/shutdown.sh ~/.local/bin/shutdown.sh
mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
ln -s ~/dotfiles/cam.sh ~/.local/bin/cam.sh

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/dotfiles/nvimrc ~/.config/nvim/init.vim
nvim -c PlugInstall
