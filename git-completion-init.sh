#!/bin/bash
set -eu

repo_dir=$HOME/Repos/git/github/git
bash_completion_dir=$HOME/local/etc/bash_completion.d

git clone git@github.com:git/git.git $repo_dir

ln -s $repo_dir/contrib/completion/git-prompt.sh $bash_completion_dir/
ln -s $repo_dir/contrib/completion/git-completion.bash $bash_completion_dir/
