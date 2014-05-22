#!/bin/bash

VIM_DIRECTORY=$HOME/.vim
PATHOGEN=$VIM_DIRECTORY/autoload/pathogen.vim


if [ ! -d "$VIM_DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
    mkdir ~/.vim
    mkdir ~/.vim/{autoload,bundle}
fi

cd ~/.vim/
git init

if [ ! -f "$PATHOGEN" ]; then
  cd ~/.vim/autoload && wget --no-check-certificate https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

git submodule add git@github.com:tpope/vim-fugitive.git bundle/fugitive
git submodule add git@github.com:garbas/vim-snipmate.git bundle/snipmate
git submodule add https://github.com/tpope/vim-surround.git bundle/surround
git submodule add https://github.com/tpope/vim-git.git bundle/git
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add git@github.com:fholgado/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/wincent/Command-T.git bundle/command-t
git submodule add https://github.com/mitechie/pyflakes-pathogen.git
git submodule add https://github.com/mileszs/ack.vim.git bundle/ack
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo
git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/alfredodeza/pytest.vim.git bundle/py.test
git submodule add https://github.com/reinh/vim-makegreen bundle/makegreen
git submodule add https://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add git@github.com:klen/rope-vim.git bundle/ropevim
git submodule add git@github.com:klen/python-mode.git bundle/python-mode

git submodule init
git submodule updat
git submodule foreach git submodule init
git submodule foreach git submodule update


if [ -f "$HOME/.vimrc" ]; then
  echo "Backing up your .vimrc"
  mv $HOME/.vimrc $HOME/.vimrc.back
  echo "Getting latest awesome vim configuration from Milind"
  cd $VIM_DIRECTORY && wget --no-check-certificate https://raw.githubusercontent.com/milin/vimconfig/master/.vimrc
  cd $HOME && ln -s $VIM_DIRECTORY/.vimrc
fi

if [ ! -f "$HOME/.vimrc" ]; then
  cd $HOME && wget --no-check-certificate https://raw.githubusercontent.com/milin/vimconfig/master/.vimrc
fi
