#!/bin/bash

repo_dir=$HOME/Repos/git/github/git
bash_completion_dir=$HOME/local/etc/bash_completion.d

if [ ! -d $repo_dir ]; then
  git clone git@github.com:git/git.git $repo_dir
  mkdir -p $bash_completion_dir
  ln -s $repo_dir/contrib/completion/git-prompt.sh $bash_completion_dir/
  ln -s $repo_dir/contrib/completion/git-completion.bash $bash_completion_dir/
else
  cd $repo_dir
  git checkout master
  git pull
fi
