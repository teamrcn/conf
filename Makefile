.PHONEY: install
install:
	cp -nv .gitconfig ~/
	cp -nv .gitignore ~/
	cp -nv .screenrc ~/
	cp -nv .vimrc ~/
	cp -nv .zshrc ~/
	cp -nv .tigrc ~/
	cp -nv config ~/.ssh/config

	mkdir -p ~/.config/sublime-text-3/Packages/User/
	cp -nv subl/Preferences.sublime-settings       ~/.config/sublime-text-3/Packages/User/
	cp -nv 'subl/Package Control.sublime-settings' ~/.config/sublime-text-3/Packages/User/
	cp -nv 'subl/Default (Linux).sublime-keymap'  ~/.config/sublime-text-3/Packages/User/

	test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	diff -w .gitconfig ~/.gitconfig || true
	diff -w .gitignore ~/.gitignore || true
	diff -w .screenrc ~/.screenrc || true
	diff -w .vimrc ~/.vimrc || true
	diff -w .zshrc ~/.zshrc || true
	diff -w .tigrc ~/.tigrc || true
