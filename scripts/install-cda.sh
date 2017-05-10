#!/bin/bash

install_dir=$HOME/.cda/cda

if [ ! -d $install_dir ]; then
  git clone git@github.com:itmst71/cda.git $install_dir
  ln -s $HOME/Repos/git/github/dotfiles/.cda/config $HOME/.cda/
else
  cd $install_dir
  git checkout master
  git pull
fi
