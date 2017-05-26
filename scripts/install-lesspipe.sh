#!/bin/bash

install_dir=$HOME/Repos/git/github/lesspipe
prefix=$HOME/local

if [ ! -d $install_dir ]; then
  git clone -b lesspipe git@github.com:wofr06/lesspipe.git $install_dir
fi

cd $install_dir
make clean
./configure --prefix=$prefix --yes
make PREFIX=$prefix && make install

