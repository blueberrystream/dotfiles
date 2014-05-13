#!/bin/sh
uname=$uname
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

rm -f ~/.bash_profile
rm -f ~/.bashrc
if [ "$uname" = "Darwin" ]; then
	rm -f ~/.bashrc-alias-gnu
else
	rm -f ~/.bashrc-alias
fi
rm -f ~/.bashrc-function
if [ "$uname" = "Linux" ]; then
	rm -f ~/.bashrc-linux
fi
if [ "$uname" = "Darwin" ]; then
	rm -f ~/.bashrc-macosx
fi
rm -f ~/.gitconfig
if [ "$uname" = "Darwin" ]; then
	rm -f ~/.gitconfig-sourcetree
fi
rm -f ~/.gitignore
rm -f ~/.vimrc
rm -f ~/.tmux.conf
rm -f ~/update-dotfiles.sh

ln -s $script_dir/.bash_profile ~/
ln -s $script_dir/.bashrc ~/
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.bashrc-alias-gnu ~/
else
	ln -s $script_dir/.bashrc-alias ~/
fi
ln -s $script_dir/.bashrc-function ~/
if [ "$uname" = "Linux" ]; then
	ln -s $script_dir/.bashrc-linux ~/
fi
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.bashrc-macosx ~/
fi
ln -s $script_dir/.gitconfig ~/
if [ "$uname" = "Darwin" ]; then
	ln -s $script_dir/.gitconfig-sourcetree ~/
fi
ln -s $script_dir/.gitignore ~/
ln -s $script_dir/.vimrc ~/
ln -s $script_dir/.tmux.conf ~/
ln -s $script_dir/update-dotfiles.sh ~/

# dircolors
curl -O https://raw2.github.com/seebi/dircolors-solarized/master/dircolors.256dark
mv -f dircolors.256dark ~/

# vim
mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
	git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
fi
mkdir -p ~/.unite
mkdir -p ~/.vimswap
