sublimedir = "$(HOME)/Library/Application Support/Sublime Text 3/Packages/User"

.PHONEY: install
install:
	cp -nv .gitconfig ~/
	cp -nv .gitignore ~/
	cp -nv .screenrc ~/
	cp -nv .vimrc ~/
	cp -nv .zshrc ~/
	cp -nv .tigrc ~/
	mkdir -p ~/.ssh
	cp -nv ssh.config ~/.ssh/config

	mkdir -p $(sublimedir)
	cp -nv subl/Preferences.sublime-settings       $(sublimedir) 
	cp -nv 'subl/Package Control.sublime-settings' $(sublimedir)
	cp -nv 'subl/Default (Linux).sublime-keymap'   $(sublimedir) 
	cp -nv 'subl/Python.sublime-settings'          $(sublimedir) 

	test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	diff -w .gitconfig ~/.gitconfig || true
	diff -w .gitignore ~/.gitignore || true
	diff -w .screenrc ~/.screenrc || true
	diff -w .vimrc ~/.vimrc || true
	diff -w .zshrc ~/.zshrc || true
	diff -w .tigrc ~/.tigrc || true
