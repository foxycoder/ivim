#!/usr/bin/env sh

function warn
{
    echo "$1" >&2
}

function die
{
    warn "$1"
    exit 1
}
echo "Thanks for installing ivim!"

# check requriements
echo "Checking requriements for ivim..."
echo "Checking vim version..."
vim --version | grep 7.3 || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
echo "Checking if git exists..."
which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
echo "Check if ctags exists..."
which ctags || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"

# back up existing .vim stuff
echo "Backing up current vim config..."
for i in $HOME/.vim $HOME.vimrc $HOME.gvimrc; do [ -e $i ] && mv $i $i.backup; done

# install ivim
echo "Cloning ivim..."
git clone http://github.com/kepbod/ivim.git $HOME/ivim
ln -s $HOME/ivim/vimrc $HOME/.vimrc

echo "Installing Vundle..."
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Installing plugins using Vundle... "
vim +BundleInstall! +BundleClean +q

echo "Ivim has been installed. Just enjoy vimming!"