#!/bin/bash

install_dir=$HOME/.anyenv

if [ ! -d $install_dir ]; then
  git clone https://github.com/riywo/anyenv $install_dir
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  exec $SHELL -l
  sed -i -e 's@https://github.com/kaneshin/goenv\.git@https://github.com/syndbg/goenv\.git@' "$(anyenv root)/share/anyenv-install/goenv"
  rbenv install $(rbenv install -l | grep -v - | tail -1)
  ndenv install $(ndenv install -l | grep '^  v' | tail -1)
  goenv install $(goenv install -l | tail -1)
else
  anyenv update
fi
