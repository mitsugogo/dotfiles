#!/bin/bash

DOT_FILES=(.zprofile .zshrc .zshenv .ctags .gitconfig .gitignore .inputrc .vimrc .tmux.conf .tigrc .dir_colors .ideavim)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

