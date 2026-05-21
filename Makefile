brewfile := "Personal"
# ifndef brewfile
# 	$(error $(shell tput bold)$(shell tput setaf 1)brewfile is not defined; you must specify the brewfile name to use$(shell tput sgr0))
# endif

default: git shell homebrew ruby

help:
	@echo "Available targets:" \
		"\n  git\t\tConfigures git" \
		"\n  shell\t\tConfigures zsh and oh-my-zsh" \
		"\n  homebrew\tConfigures homebrew and installs applications and libraries" \
		"\n  ruby\t\tConfigures Ruby on Rails environment"

git:
	@echo "Configuring git..."
	@zsh lib/git/install.zsh

shell:
	@echo "Configuring shell..."
	@zsh lib/shell/install.zsh

homebrew:
	@echo "Configuring homebrew..."
	@zsh lib/homebrew/install.zsh

ruby:
	@echo "Configuring Ruby..."
	ln -sf "$(HOME)/.dotfiles/lib/ruby/gemrc" "$(HOME)/.gemrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/railsrc" "$(HOME)/.railsrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/rubocop.yml" "$(HOME)/.rubocop.yml"
	ln -sfh "$(HOME)/.dotfiles/lib/ruby/.rails" "$(HOME)/.rails"
	@zsh lib/ruby/install.zsh

vscode:
	@echo "Configuring VS Code..."
	mv "$(HOME)/Library/Application Support/Code/User/snippets" "$(HOME)/Library/Application Support/Code/User/snippets.old"
	ln -sfh "$(HOME)/.dotfiles/lib/vscode/snippets" "$(HOME)/Library/Application Support/Code/User/snippets"

.PHONY: git shell homebrew ruby vscode
