#!/bin/bash

# Setup git
ln -s `pwd`/.gitconfig $HOME/.gitconfig
ln -s `pwd`/.gitignore_global $HOME/.gitignore_global

# Setup vim
ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/init.vim $HOME/.config/nvim/init.vim
ln -s `pwd`/coc.nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
mkdir -p $HOME/.config/coc/extensions
ln -s `pwd`/coc.nvim/extensions/package.json $HOME/.config/coc/extensions/package.json
ln -s `pwd`/coc.nvim/extensions/yarn.lock $HOME/.config/coc/extensions/yarn.lock

ln -s `pwd`/.tmux.conf $HOME/.tmux.conf

ln -s `pwd`/i3 $HOME/.config/i3/config

ln -s `pwd`/.bashrc-custom $HOME/.bashrc-custom
echo "source $HOME/.bashrc-custom" >> $HOME/.bashrc
