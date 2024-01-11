#!/bin/bash

DOTFILES_DIR="${HOME}/dotfiles/nvim"
NVIM_HOME="${HOME}/.config/nvim"
mkdir -p ${NVIM_HOME}

ln -s ${DOTFILES_DIR}/init.lua ${NVIM_HOME}
ln -s ${DOTFILES_DIR}/lua ${NVIM_HOME}/

