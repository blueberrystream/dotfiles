#!/bin/bash

repos=(
  "github.com/itchyny/fillin"
  "github.com/davecheney/httpstat"
  "github.com/sonots/lltsv"
  "github.com/mattn/memo"
  "github.com/jmhobbs/terminal-parrot"
)

for repo in "${repos[@]}"; do
  go get -u $repo
done
