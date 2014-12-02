#!/bin/bash

xcode-select --install

./homebrew-init.sh
./dotfiles-init.sh

mkdir -p $HOME/local/bin
./download-diff-highlight.sh $HOME/local/bin
cp prepend-user-into-gitconfig.sh $HOME/local/bin
