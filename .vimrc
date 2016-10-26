set shell=bash

source ~/.vimrc.d/bundle.vimrc
source ~/.vimrc.d/base.vimrc
source ~/.vimrc.d/binding.vimrc

" local setting
if filereadable(expand('~/.vimrc.d/local.vimrc'))
  source ~/.vimrc.d/local.vimrc
endif
