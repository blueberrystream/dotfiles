#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
uname=`uname`

if [[ $uname == 'Linux' ]]; then
  $script_dir/install-git-completion.sh
  $script_dir/install-lesspipe.sh
fi
$script_dir/install-anyenv.sh
$script_dir/install-bash-it.sh
$script_dir/install-cda.sh
$script_dir/install-dircolors.sh
$script_dir/install-enhancd.sh
$script_dir/install-git-completion.sh

$script_dir/go-get.sh
$script_dir/npm-install.sh
$script_dir/gem-install.sh

echo "Please run `exec $SHELL -l`"
