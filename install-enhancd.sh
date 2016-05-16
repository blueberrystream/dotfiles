#!/bin/bash

install_dir=$HOME/local/etc/enhancd

if [ ! -d $install_dir ]; then
  mkdir -p $install_dir
fi

git clone git@github.com:b4b4r07/enhancd.git $install_dir
