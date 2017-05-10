#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

$script_dir/install-anyenv.sh
$script_dir/install-cda.sh
$script_dir/install-diff-highlight.sh
$script_dir/install-dircolors.sh
$script_dir/install-enhancd.sh
$script_dir/install-git-completion.sh
