brewfile := "Personal"
# ifndef brewfile
# 	$(error $(shell tput bold)$(shell tput setaf 1)brewfile is not defined; you must specify the brewfile name to use$(shell tput sgr0))
# endif

default:
	@echo "This is no default for your own safety."

git:
	ln -sf "$(HOME)/.dotfiles/lib/git/gitconfig" "$(HOME)/.gitconfig"

shell:
	ln -sfh "$(HOME)/.dotfiles/lib/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/lib/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/lib/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@lib/shell/install.sh

homebrew:
	@echo "Using brewfile: $(brewfile).brewfile"
	ln -sf $(HOME)/.dotfiles/lib/homebrew/$(brewfile).brewfile $(HOME)/$(brewfile).brewfile
	@lib/homebrew/install.sh
	brew update
	brew bundle --file $(HOME)/$(brewfile).brewfile
	brew cleanup

.PHONY: git shell homebrew
