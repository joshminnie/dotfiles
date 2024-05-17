brewfile := "Personal"
# ifndef brewfile
# 	$(error $(shell tput bold)$(shell tput setaf 1)brewfile is not defined; you must specify the brewfile name to use$(shell tput sgr0))
# endif

default:
	@echo "This is no default for your own safety."

git:
	@echo "Configuring git..."
	ln -sf "$(HOME)/.dotfiles/lib/git/gitconfig" "$(HOME)/.gitconfig"
	ln -sf "$(HOME)/.dotfiles/lib/git/gitignore" "$(HOME)/.gitignore"

shell:
	@echo "Configuring shell..."
	ln -sfh "$(HOME)/.dotfiles/lib/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/lib/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/lib/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@lib/shell/install.sh

homebrew:
	@echo "Configuring homebrew..."
	@echo "Using brewfile: $(brewfile).brewfile"
	ln -sf $(HOME)/.dotfiles/lib/homebrew/$(brewfile).brewfile $(HOME)/Brewfile
	@lib/homebrew/install.sh
	brew update
	brew bundle --file $(HOME)/Brewfile
	brew cleanup

ruby:
	@echo "Configuring Ruby..."
	ln -sf "$(HOME)/.dotfiles/lib/git/gemrc" "$(HOME)/.gemrc"
	ln -sf "$(HOME)/.dotfiles/lib/git/railsrc" "$(HOME)/.railsrc"
	ln -sf "$(HOME)/.dotfiles/lib/git/rubocop.yml" "$(HOME)/.rubocop.yml"
	@lib/ruby/install.sh

.PHONY: git shell homebrew ruby
