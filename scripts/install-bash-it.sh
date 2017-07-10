#!/bin/bash

install_dir=$HOME/.bash_it

if [ ! -d $install_dir ]; then
  git clone https://github.com/Bash-it/bash-it.git $install_dir
  $install_dir/install.sh --silent --no-modify-config

  source $BASH_IT/bash_it.sh
  bash-it disable alias all
  bash-it disable completion all
  bash-it disable plugin all
  bash-it enable completion \
    bash-it bundler capistrano composer defaults docker-compose docker \
    gem git go grunt gulp npm rake ssh system tmux
  bash-it enable plugin base
else
  source $BASH_IT/bash_it.sh
  bash-it update
fi
