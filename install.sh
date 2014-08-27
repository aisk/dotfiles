#! /usr/bin/env sh

BASEDIR=$(dirname $0)

ln -sf $BASEDIR/.vimrc ~/.vimrc
ln -sf $BASEDIR/.axelrc ~/.axelrc
ln -sf $BASEDIR/.emacs ~/.emacs
ln -sf $BASEDIR/.irbrc ~/.irbrc
ln -sf $BASEDIR/.pryrc ~/.pryrc
ln -sf $BASEDIR/.zshrc ~/.zshrc
ln -sf $BASEDIR/.minttyrc ~/.minttyrc
if [ ! -d ~/.vim/bundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
