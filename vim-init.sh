#!/bin/sh

mkdir -p ~/.vim/bundle
git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
git clone git@github.com:Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim

cd ~/.vim/bundle/vimproc.vim
make
