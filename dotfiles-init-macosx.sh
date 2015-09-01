#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

rm -f $HOME/.bash_profile
rm -f $HOME/.bashrc
rm -rf $HOME/.bashrc.d
rm -f $HOME/.gitconfig
rm -f $HOME/.gitconfig-sourcetree
rm -f $HOME/.gitignore
rm -f $HOME/.vimrc
rm -rf $HOME/.vimrc.d
rm -f $HOME/.tmux.conf
rm -rf $HOME/.tmux.conf.d

ln -s $script_dir/.bash_profile $HOME/
ln -s $script_dir/.bashrc $HOME/
ln -s $script_dir/.bashrc.d $HOME/
ln -s $script_dir/.gitconfig $HOME/
ln -s $script_dir/.gitconfig-sourcetree $HOME/
ln -s $script_dir/_gitignore $HOME/.gitignore
ln -s $script_dir/.vimrc $HOME/
ln -s $script_dir/.vimrc.d $HOME/
ln -s $script_dir/.tmux.conf $HOME
ln -s $script_dir/.tmux.conf.d $HOME/

touch $HOME/.bashrc.d/local
touch $HOME/.vimrc.d/local.vimrc
touch $HOME/.tmux.conf.d/local

# dircolors
github_dir=$HOME/Repos/git/github
if [ ! -d $github_dir/dircolors-solarized ]; then
  rm -f $HOME/dircolors.256dark
  git clone https://github.com/seebi/dircolors-solarized.git $github_dir/dircolors-solarized
  ln -s $HOME/Repos/git/github/dircolors-solarized/dircolors.256dark $HOME/
fi

# vim
mkdir -p $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
	git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
fi
mkdir -p $HOME/.unite

# tmux
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
