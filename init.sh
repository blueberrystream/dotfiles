#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
uname=`uname`

ln -s $script_dir/.bash_profile $HOME/
ln -s $script_dir/.bashrc $HOME/
ln -s $script_dir/.bashrc.d $HOME/
ln -s $script_dir/.editorconfig $HOME/
ln -s $script_dir/.gitconfig $HOME/
ln -s $script_dir/.git-commit.template $HOME/
ln -s $script_dir/.tigrc $HOME/
ln -s $script_dir/.tmux.conf $HOME/
ln -s $script_dir/.tmux.conf.d $HOME/
ln -s $script_dir/.ptignore $HOME/

touch $HOME/.bashrc.d/local
touch $HOME/.vimrc.d/local.vimrc
touch $HOME/.tmux.conf.d/local

echo "Please run `exec $SHELL -l`"
