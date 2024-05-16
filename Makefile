default:
	@echo "This is no default for your own safety."

shell:
	ln -sfh "$(HOME)/.dotfiles/src/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/src/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/src/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@src/shell/install.sh

homebrew-deluxe:
	ln -sf $(HOME)/.dotfiles/src/homebrew/Deluxe.brewfile $(HOME)/Deluxe.brewfile
	@src/homebrew/install.sh
	brew update
	brew bundle --file $(HOME)/Deluxe.brewfile
	brew cleanup
