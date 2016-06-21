#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
local_bin=$HOME/local/bin

if [ ! -d $local_bin ]; then
  mkdir -p $local_bin
fi
ln -s $script_dir/../local/bin/git-prepend-user-section $local_bin/
