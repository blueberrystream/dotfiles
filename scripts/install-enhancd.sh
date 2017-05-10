#!/bin/bash

install_dir=$HOME/.enhancd/enhancd

if [ ! -d $install_dir ]; then
  mkdir -p $install_dir
  git clone git@github.com:b4b4r07/enhancd.git $install_dir
else
  cd $install_dir
  git checkout master
  git pull
fi
