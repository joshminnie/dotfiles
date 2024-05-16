default:
	@echo "This is no default for your own safety."

shell:
	ln -sFf $(HOME)/.dotfiles/src/shell/zsh-custom $(HOME)/.zsh-custom
	ln -sFf $(HOME)/.dotfiles/src/shell/zshrc.zsh $(HOME)/.zshrc
	@src/shell/bootstrap.sh

homebrew:
	ln -sFf $(HOME)/.dotfiles/src/homebrew/Brewfile $(HOME)/Brewfile
	@src/homebrew/bootstrap.sh
