#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

ls -l $(ndenv prefix)/bin | awk '{print $9}' > $script_dir/../local/NPM_GLOBAL_INSTALLED
