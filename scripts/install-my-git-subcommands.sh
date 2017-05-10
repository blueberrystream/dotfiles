#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
local_bin=$HOME/local/bin

mkdir -p $local_bin
ln -s $script_dir/../local/bin/git-put-config-user-section $local_bin/
