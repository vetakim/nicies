#!/usr/bin/bash

sh installenv.sh
sh ohmyzsh/tools/install.sh
sh fonts/install.sh

cp .vimrc ~
cp .zshrc ~
cp .Xresources ~
cp agnoster-short-zenburn.zsh-theme ~/.oh-my-zsh/custom/themes

cp -rf .tmux ~
cp .tmux.conf ~
mkdir ~/.vimfpo

cp -rf etc_pack ~/.vimfpo
cp -rf builder ~/.vimfpo

rm -rf fonts
rm -rf ohmyzsh
