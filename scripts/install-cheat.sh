#!/bin/bash

script_dir=$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)
install_dir=$HOME/local/bin

cd "$install_dir" || exit
rm -f cheat*
axel https://github.com/cheat/cheat/releases/download/4.2.2/cheat-darwin-amd64.gz
gzip -d cheat-darwin-amd64.gz
chmod +x cheat-darwin-amd64.gz
ln -s cheat-darwin-amd64.gz cheat
cd - || exit

mkdir -p "$HOME/.config/cheat"
ln -sf "$script_dir/../.config/cheat/conf.yml" "$HOME/.config/cheat/conf.yml"
