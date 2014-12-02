#!/bin/bash
uname=`uname`
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

rm -f $HOME/.bash_profile
rm -f $HOME/.bashrc
if [ "$uname" = "Darwin" ]; then
	rm -f $HOME/.bashrc-alias-gnu
else
	rm -f $HOME/.bashrc-alias
fi
rm -f $HOME/.bashrc-function
if [ "$uname" = "Linux" ]; then
	rm -f $HOME/.bashrc-linux
fi
if [ "$uname" = "Darwin" ]; then
	rm -f $HOME/.bashrc-macosx
fi
rm -f $HOME/.gitconfig
if [ "$uname" = "Darwin" ]; then
	rm -f $HOME/.gitconfig-sourcetree
fi
rm -f $HOME/.gitignore
rm -f $HOME/.vimrc
rm -f $HOME/.vimrc-go
rm -f $HOME/.tmux.conf
rm -f $HOME/update-dotfiles.sh

ln -s $script_dir/.bash_profile $HOME/
ln -s $script_dir/.bashrc $HOME/
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.bashrc-alias-gnu $HOME/
fi
ln -s $script_dir/.bashrc-alias $HOME/
ln -s $script_dir/.bashrc-function $HOME/
if [ "$uname" = "Linux" ]; then
	ln -s $script_dir/.bashrc-linux $HOME/
fi
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.bashrc-macosx $HOME/
fi
ln -s $script_dir/.gitconfig $HOME/
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.gitconfig-sourcetree $HOME/
fi
ln -s $script_dir/.gitignore $HOME/
ln -s $script_dir/.vimrc $HOME/
ln -s $script_dir/.vimrc-go $HOME/
ln -s $script_dir/.tmux.conf $HOME/
ln -s $script_dir/update-dotfiles.sh $HOME/

# dircolors
rm -f $HOME/dircolors.256dark
git clone https://github.com/seebi/dircolors-solarized.git $HOME/Repos/git/github/dircolors-solarized
ln -s $HOME/Repos/git/github/dircolors-solarized/dircolors.256dark $HOME/

# vim
mkdir -p $HOME/.vim/bundle
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]; then
	git clone https://github.com/Shougo/neobundle.vim.git $HOME/.vim/bundle/neobundle.vim
fi
mkdir -p $HOME/.unite
mkdir -p $HOME/.vimswap
