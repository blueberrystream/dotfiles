#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

gem update --system
gem update bundler || gem install bundler
cd $script_dir/../
bundle update || bundle install
