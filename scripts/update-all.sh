#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
uname=`uname`

$script_dir/install-anyenv.sh
$script_dir/install-cda.sh
$script_dir/install-diff-highlight.sh
$script_dir/install-dircolors.sh
$script_dir/install-enhancd.sh
$script_dir/install-bash-it.sh
if [[ $uname == 'Linux' ]]; then
  $script_dir/install-git-completion.sh
  $script_dir/install-lesspipe.sh
fi
$script_dir/go-get.sh
