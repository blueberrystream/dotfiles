#!/bin/sh

rm -f ~/.bash_profile
rm -f ~/.bashrc
if [ `uname` = "Darwin" ]; then
	rm -f ~/.bashrc-alias-gnu
else
	rm -f ~/.bashrc-alias
fi
rm -f ~/.bashrc-function
if [ `uname` = "Linux" ]; then
	rm -f ~/.bashrc-linux
fi
if [ `uname` = "Darwin" ]; then
	rm -f ~/.bashrc-macosx
fi
rm -f ~/.gitconfig
rm -f ~/.gitignore
rm -f ~/.vimrc

ln -s `pwd`/.bash_profile ~/
ln -s `pwd`/.bashrc ~/
if [ `uname` = "Darwin" ]; then
	ln -s `pwd`/.bashrc-alias-gnu ~/
else
	ln -s `pwd`/.bashrc-alias ~/
fi
ln -s `pwd`/.bashrc-function ~/
if [ `uname` = "Linux" ]; then
	ln -s `pwd`/.bashrc-linux ~/
fi
if [ `uname` = "Darwin" ]; then
	ln -s `pwd`/.bashrc-macosx ~/
fi
ln -s `pwd`/.gitconfig ~/
ln -s `pwd`/.gitignore ~/
ln -s `pwd`/.vimrc ~/

# dircolors
curl -O https://raw2.github.com/seebi/dircolors-solarized/master/dircolors.256dark
mv -f dircolors.256dark ~/

# vim
mkdir -p ~/.vim/bundle
git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
git clone git@github.com:Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/.vim/bundle/vimproc.vim
make
mkdir ~/.unite
mkdir ~/.vimswap
