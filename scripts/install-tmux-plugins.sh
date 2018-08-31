#!/bin/bash

if [ ! -d $HOME/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
else
  cd $HOME/.tmux/plugins/tpm && git pull
fi
