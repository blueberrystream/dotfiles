#!/bin/bash

pip uninstall neovim
pip install --upgrade pip
pip install --upgrade \
  gitlint \
  ansible \
  ansible-lint \
  vim-vint \
  pynvim \
  flake8 \
  flake8-import-order \
  autopep8 \
  black \
  isort
pyenv rehash
