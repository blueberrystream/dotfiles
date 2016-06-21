#!/bin/bash

repo_dir=$HOME/Repos/git/github/git
local_bin=$HOME/local/bin

if [ ! -d $repo_dir ]; then
  git clone git@github.com:git/git.git $repo_dir
fi

if [ ! -d $local_bin ]; then
  mkdir -p $local_bin
fi
ln -s $repo_dir/contrib/diff-highlight/diff-highlight $local_bin/
ls -al $local_bin/
