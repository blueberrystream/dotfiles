#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
uname=`uname`

function echo_and_run() {
  echo "=================================================="
  echo $1
  echo "=================================================="
  . $script_dir/$1
}

if [[ $uname == 'Linux' ]]; then
  echo_and_run install-git-completion.sh
  echo_and_run install-lesspipe.sh
fi
echo_and_run install-anyenv.sh
echo_and_run install-bash-it.sh
echo_and_run install-cda.sh
echo_and_run install-dircolors.sh
echo_and_run install-enhancd.sh
echo_and_run install-git-completion.sh
echo_and_run install-tmux-plugins.sh

echo_and_run go-get.sh
echo_and_run npm-install.sh
echo_and_run gem-install.sh
echo_and_run pip-install.sh

echo "Please run 'exec \$SHELL -l'"
