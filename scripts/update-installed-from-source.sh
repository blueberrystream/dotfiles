#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

ls -l $HOME/local/src | grep ^d | awk '{print $9}' > $script_dir/../local/src/INSTALLED
