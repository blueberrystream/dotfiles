#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install git

brew install caskroom/cask/brew-cask
brew cask install xquartz

brew install rcmdnk/file/brew-file
brew file set_repo -r blueberrystream/dotfiles
brew file install

brew doctor

ln -s /usr/local/bin/lesspipe.sh $HOME/local/bin/lesspipe.sh
