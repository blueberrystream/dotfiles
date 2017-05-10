#!/bin/bash

mkdir -p $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
  git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
fi

mkdir -p $HOME/.unite
