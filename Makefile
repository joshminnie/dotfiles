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
	@echo "Completed configuring git!"

shell:
	@echo "Configuring shell..."
	@zsh lib/shell/install.zsh
	@echo "Completed configuring shell!"

homebrew:
	@echo "Configuring homebrew..."
	@zsh lib/homebrew/install.zsh
	@echo "Completed configuring homebrew!"

ruby:
	@echo "Configuring Ruby..."
	@zsh lib/ruby/install.zsh
	@echo "Completed configuring Ruby!"

vscode:
	@echo "Configuring VS Code..."
	mv "$(HOME)/Library/Application Support/Code/User/snippets" "$(HOME)/Library/Application Support/Code/User/snippets.old"
	ln -sfh "$(HOME)/.dotfiles/lib/vscode/snippets" "$(HOME)/Library/Application Support/Code/User/snippets"
	@echo "Completed configuring VS Code!"

.PHONY: git shell homebrew ruby vscode
