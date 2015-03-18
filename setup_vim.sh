#!/bin/bash

VIM_DIRECTORY=$HOME/.vim
PATHOGEN=$VIM_DIRECTORY/autoload/pathogen.vim

# Installing Dependencies
sudo yum groupinstall 'Development Tools'
sudo yum install ruby
sudo yum install perl-devel python-devel ruby-devel
sudo yum install perl-ExtUtils-Embed ncurses ncurses-devel
 
echo "Downloading Vim"

cd /tmp/ && wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2 && tar -xvf vim-7.4.tar.bz2
cd /tmp/vim74

echo "Configuring VIM"

./configure --prefix=/usr --with-features=huge --enable-perlinterp --enable-rubyinterp --enable-pythoninterp

sudo make && sudo make install

echo "Removing vim folder and tar ball"

sudo rm -rf /tmp/vim74 && sudo rm vim-7.4.tar.bz2

if [ ! -d "$VIM_DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    mkdir ~/.vim
    mkdir ~/.vim/{autoload,bundle}
fi

cd ~/.vim/
git init

#if [ -f "$HOME/.vimrc" ]; then
#  echo "Backing up your .vimrc"
#  mv $HOME/.vimrc $HOME/.vimrc.back
#  echo "Getting latest awesome vim configuration from Milind"
#  cd $VIM_DIRECTORY && wget --no-check-certificate https://raw.githubusercontent.com/milin/vimconfig/master/.vimrc
#  cd $HOME && ln -s $VIM_DIRECTORY/.vimrc
#fi
#
#if [ ! -f "$HOME/.vimrc" ]; then
#  cd $HOME && wget --no-check-certificate https://raw.githubusercontent.com/milin/vimconfig/master/.vimrc
#fi
