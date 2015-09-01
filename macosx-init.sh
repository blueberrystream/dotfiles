#!/bin/bash

xcode-select --install

./homebrew-init.sh
./dotfiles-init-macosx.sh
./install-diff-highlight.sh
./install-prepend-user-into-gitconfig.sh
