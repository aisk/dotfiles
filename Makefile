install:
	ln -sf $(PWD)/.vimrc ~/.vimrc
	ln -sf $(PWD)/.axelrc ~/.axelrc
	ln -sf $(PWD)/.emacs ~/.emacs
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
