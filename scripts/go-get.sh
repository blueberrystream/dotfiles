#!/bin/bash

repos=(
  "github.com/itchyny/fillin"
  "github.com/davecheney/httpstat"
  "github.com/sonots/lltsv"
  "github.com/mattn/memo"
  "github.com/jmhobbs/terminal-parrot"
  "github.com/pocke/lemonade"
  "github.com/junegunn/fzf"
)

for repo in "${repos[@]}"; do
  go get -u $repo
done

ln -sf $GOPATH/bin/lemonade $HOME/local/bin/xdg-open
