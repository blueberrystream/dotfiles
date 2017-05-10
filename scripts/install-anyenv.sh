#!/bin/bash

install_dir=$HOME/.anyenv

if [ ! -d $install_dir ]; then
  git clone https://github.com/riywo/anyenv $install_dir
  exec $SHELL -l
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
else
  anyenv update
fi
