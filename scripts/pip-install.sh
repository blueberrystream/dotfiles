#!/bin/bash

pip uninstall neovim
pip install --upgrade pip
pip install --upgrade \
  gitlint \
  ansible-lint \
  vim-vint \
  pynvim
pyenv rehash
