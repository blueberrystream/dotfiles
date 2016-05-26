#!/bin/bash

xcode-select --install

./scripts/homebrew-init.sh
./scripts/dotfiles-init-macosx.sh
./scripts/install-diff-highlight.sh
./scripts/install-git-prepend-user-section.sh
