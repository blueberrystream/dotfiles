#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

gem update --system
gem install bundler -v 2.2.19
bundle install
gem specific_install -l https://github.com/pariser/ruby.git -b ruby3  -d rubocop-airbnb

rm -f Gemfile.lock
