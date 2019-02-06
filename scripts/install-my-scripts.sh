#!/bin/bash

scripts=(
  "doc-sh"
  "fig-sh"
)

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
local_bin=$HOME/local/bin

mkdir -p $local_bin
for script in "${scripts[@]}"; do
  ln -s $script_dir/../local/bin/$script $local_bin/
done
