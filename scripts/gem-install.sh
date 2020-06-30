#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
gems=(bundler tmuxinator git-issue pry byebug pry-byebug pry-stack_explorer slim_lint sqlint neovim rubocop rubocop-rails rubocop-performance rubocop-rspec)

gem update --system
for gem in ${gems[@]}; do
  if gem which $gem > /dev/null 2>&1; then
    gem update $gem
  else
    gem install $gem
  fi
done
