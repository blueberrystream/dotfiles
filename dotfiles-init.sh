#!/bin/sh

rm -f ~/.bash_profile
rm -f ~/.bashrc
rm -f ~/.bashrc-alias
rm -f ~/.bashrc-alias-gnu
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

ln -s .bash_profile ~/
ln -s .bashrc ~/
ln -s .bashrc-alias ~/
ln -s .bashrc-alias-gnu ~/
ln -s .bashrc-function ~/
if [ `uname` = "Linux" ]; then
	ln -s .bashrc-linux ~/
fi
if [ `uname` = "Darwin" ]; then
	ln -s .bashrc-macosx ~/
fi
ln -s .gitconfig ~/
ln -s .gitignore ~/
ln -s .vimrc ~/

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
