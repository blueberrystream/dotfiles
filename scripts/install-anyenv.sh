#!/bin/bash

install_dir=$HOME/.anyenv

if [ ! -d $install_dir ]; then
  git clone https://github.com/riywo/anyenv $install_dir
  git clone https://github.com/znz/anyenv-update.git $install_dir/plugins/anyenv-update
  sed -i -e 's@https://github.com/kaneshin/goenv\.git@https://github.com/syndbg/goenv\.git@' "$install_dir/share/anyenv-install/goenv"

  mkdir -p $install_dir/envs

  $install_dir/bin/anyenv install rbenv
  $install_dir/bin/anyenv install ndenv
  $install_dir/bin/anyenv install goenv

  rbenv=$install_dir/envs/rbenv/bin/rbenv
  rbver=$($bin install -l | grep -v - | tail -1)
  $rbenv install $rbver
  $rbenv global $rbver

  ndenv=$install_dir/envs/ndenv/bin/ndenv
  ndver=$($bin install -l | grep '^  v' | tail -1)
  $ndenv install $ndver
  $ndenv global $ndver

  goenv=$install_dir/envs/goenv/bin/goenv
  gover=$($bin install -l | tail -1)
  $goenv install $gover
  $goenv global $gover
else
  anyenv update
fi
