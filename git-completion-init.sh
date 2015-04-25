#!/bin/bash
set -eu

repo_dir=$HOME/Repos/git/github/git
bash_completion_dir=$HOME/local/etc/bash_completion.d
local_bin=$HOME/local/bin

git clone git@github.com:git/git.git $repo_dir

if [ ! -d $bash_completion_dir ]; then
	mkdir -p $bash_completion_dir
fi
ln -s $repo_dir/contrib/completion/git-prompt.sh $bash_completion_dir/
ln -s $repo_dir/contrib/completion/git-completion.bash $bash_completion_dir/

if [ ! -d $local_bin ]; then
	mkdir -p $local_bin
fi
ln -s $repo_dir/contrib/diff-highlight/diff-highlight 
