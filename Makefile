install:
	ln -sf $(PWD)/.vimrc ~/.vimrc
	ln -sf $(PWD)/.axelrc ~/.axelrc
	ln -sf $(PWD)/.emacs ~/.emacs
	ln -sf $(PWD)/.irbrc ~/.irbrc
	if [ ! -d ~/.vim/bundle ] do
		git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	end
