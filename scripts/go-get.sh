#!/bin/bash

repos=(
  "github.com/itchyny/fillin"
  "github.com/davecheney/httpstat"
  "github.com/sonots/lltsv"
  "github.com/mattn/memo"
  "github.com/jmhobbs/terminal-parrot"
  "github.com/pocke/lemonade"
  "github.com/junegunn/fzf"
  "github.com/skanehira/docui"
  "github.com/motemen/ghq"
  "github.com/github/hub"
)

for repo in "${repos[@]}"; do
  go get -u $repo
done

ln -sf $GOPATH/bin/lemonade $HOME/local/bin/xdg-open

# https://github.com/skanehira/docui
cd $GOPATH/src/github.com/skanehira/docui
GO111MODULE=on go install
