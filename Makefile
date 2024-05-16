default:
	@echo "This is no default for your own safety."

git:
	ln -sf "$(HOME)/.dotfiles/src/git/gitconfig" "$(HOME)/.gitconfig"

shell:
	ln -sfh "$(HOME)/.dotfiles/src/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/src/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/src/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@src/shell/install.sh

homebrew:
	ifndef file
		$(error $(shell tput bold)$(shell tput setaf 1)file is not defined; you must specify the file name to use$(shell tput sgr0))
	endif
	ln -sf $(HOME)/.dotfiles/src/homebrew/$(file).brewfile $(HOME)/$(file).brewfile
	@src/homebrew/install.sh
	brew update
	brew bundle --file $(HOME)/$(file).brewfile
	brew cleanup
