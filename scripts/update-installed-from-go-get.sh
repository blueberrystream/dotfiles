#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

ls -l $GOPATH/bin | awk '{print $9}' > $script_dir/../local/gopath/INSTALLED
