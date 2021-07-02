#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

gem update --system
gem install bundler -v 2.2.19
bundle install

rm -f Gemfile.lock
