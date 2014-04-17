#! /usr/bin/env sh

ln -sf $PWD/.vimrc ~/.vimrc
ln -sf $PWD/.axelrc ~/.axelrc
ln -sf $PWD/.emacs ~/.emacs
ln -sf $PWD/.irbrc ~/.irbrc
ln -sf $PWD/.pryrc ~/.pryrc
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
