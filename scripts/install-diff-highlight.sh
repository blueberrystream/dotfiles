#!/bin/bash

repo_dir=$HOME/Repos/git/github/git
local_bin=$HOME/local/bin

if [ ! -d $repo_dir ]; then
  git clone git@github.com:git/git.git $repo_dir
else
  cd $repo_dir
  git checkout master
  git pull
fi

mkdir -p $local_bin
ln -s $repo_dir/contrib/diff-highlight/diff-highlight $local_bin/
