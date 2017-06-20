#!/bin/bash

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
uname=`uname`

if [[ $uname == 'Darwin' ]]; then
  xcode-select --install
  $script_dir/scripts/homebrew-init.sh
fi

rm -f $HOME/.bash_profile
rm -f $HOME/.bashrc
rm -rf $HOME/.bashrc.d
rm -f $HOME/.gitconfig
rm -f $HOME/.git-commit.template
[[ $uname == 'Darwin' ]] && rm -f $HOME/.gitconfig-sourcetree
rm -f $HOME/.gitignore
rm -f $HOME/.vimrc
rm -rf $HOME/.vimrc.d
rm -f $HOME/.tigrc
rm -f $HOME/.tmux.conf
rm -rf $HOME/.tmux.conf.d

ln -s $script_dir/.bash_profile $HOME/
ln -s $script_dir/.bashrc $HOME/
ln -s $script_dir/.bashrc.d $HOME/
ln -s $script_dir/.gitconfig $HOME/
ln -s $script_dir/.git-commit.template $HOME/
[[ $uname == 'Darwin' ]] && ln -s $script_dir/.gitconfig-sourcetree $HOME/
ln -s $script_dir/.vimrc $HOME/
ln -s $script_dir/.vimrc.d $HOME/
ln -s $script_dir/.tigrc $HOME/
ln -s $script_dir/.tmux.conf $HOME/
ln -s $script_dir/.tmux.conf.d $HOME/

touch $HOME/.bashrc.d/local
touch $HOME/.vimrc.d/local.vimrc
touch $HOME/.tmux.conf.d/local

$script_dir/scripts/update-all.sh
