#!/bin/bash

install_dir=$HOME/.anyenv

if [ ! -d $install_dir ]; then
  git clone https://github.com/anyenv/anyenv $install_dir
  git clone https://github.com/znz/anyenv-update.git $install_dir/plugins/anyenv-update

  mkdir -p $install_dir/envs

  $install_dir/bin/anyenv install rbenv
  $install_dir/bin/anyenv install nodenv
  $install_dir/bin/anyenv install goenv

  rbenv=$install_dir/envs/rbenv/bin/rbenv
  rbver=$($rbenv install -l | grep -v - | tail -1)
  $rbenv install $rbver
  $rbenv global $rbver
  git clone https://github.com/rbenv/rbenv-each.git "$($rbenv root)"/plugins/rbenv-each

  nodenv=$install_dir/envs/nodenv/bin/nodenv
  nodever=$($nodenv install -l | grep -v - | grep -v night | grep -v rc | tail -1)
  $nodenv install $nodever
  $nodenv global $nodever
  git clone https://github.com/nodenv/nodenv-each.git "$($nodenv root)"/plugins/nodenv-each

  goenv=$install_dir/envs/goenv/bin/goenv
  gover=$($goenv install -l | grep -v beta | grep -v rc | tail -1)
  $goenv install $gover
  $goenv global $gover
else
  anyenv update
fi
