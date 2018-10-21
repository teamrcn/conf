.PHONEY: install
install:
	cp -nv .gitconfig ~/
	cp -nv .gitignore ~/
	cp -nv .screenrc ~/
	cp -nv .vimrc ~/
	cp -nv .zshrc ~/

	mkdir -p ~/.config/sublime-text-3/Packages/User/
	cp -nv Preferences.sublime-settings       ~/.config/sublime-text-3/Packages/User/
	cp -nv 'Package Control.sublime-settings' ~/.config/sublime-text-3/Packages/User/
	cp -nv 'Default (Linux).sublime-keymap'  ~/.config/sublime-text-3/Packages/User/

	test -d ~/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
