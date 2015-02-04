#! /usr/bin/env sh

BASEDIR=$(dirname $0)

ln -sf $BASEDIR/.vimrc ~/.vimrc
ln -sf $BASEDIR/.axelrc ~/.axelrc
ln -sf $BASEDIR/.emacs ~/.emacs
ln -sf $BASEDIR/.irbrc ~/.irbrc
ln -sf $BASEDIR/.pryrc ~/.pryrc
ln -sf $BASEDIR/.zshrc ~/.zshrc
ln -sf $BASEDIR/.minttyrc ~/.minttyrc
ln -sf $BASEDIR/.ghci ~/.ghci
if [ ! -d ~/.vim/autoload ]; then
    mkdir -p ~/.vim/autoload
    curl -fLo ~/.vim/autoload/plug.vim \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
