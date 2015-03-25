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

