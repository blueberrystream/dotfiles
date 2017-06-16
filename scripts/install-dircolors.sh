#!/bin/bash

install_dir=$HOME/Repos/git/github/dircolors-solarized

if [ ! -d $install_dir ]; then
  rm -f $HOME/dircolors.256dark
  git clone https://github.com/seebi/dircolors-solarized.git $install_dir
  ln -s $install_dir/dircolors.256dark $HOME/
else
  cd $install_dir
  git checkout master
  git pull
fi
