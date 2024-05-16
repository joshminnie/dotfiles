default:
	@echo "This is no default for your own safety."

homebrew:
	ln -sFf $(HOME)/.dotfiles/src/homebrew/Brewfile $(HOME)/Brewfile
	@src/homebrew/bootstrap.sh
