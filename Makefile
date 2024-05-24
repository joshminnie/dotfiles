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
	ln -sf "$(HOME)/.dotfiles/lib/git/gitconfig" "$(HOME)/.gitconfig"
	ln -sf "$(HOME)/.dotfiles/lib/git/gitignore" "$(HOME)/.gitignore"

shell:
	@echo "Configuring shell..."
	ln -sfh "$(HOME)/.dotfiles/lib/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/lib/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/lib/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@lib/shell/install.zsh

homebrew:
	@echo "Configuring homebrew..."
	ln -sf $(HOME)/.dotfiles/lib/homebrew/Brewfile $(HOME)/Brewfile
	ln -sf $(HOME)/.dotfiles/lib/homebrew/Local.brewfile $(HOME)/Local.brewfile
	@lib/homebrew/install.zsh

ruby:
	@echo "Configuring Ruby..."
	ln -sf "$(HOME)/.dotfiles/lib/ruby/gemrc" "$(HOME)/.gemrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/railsrc" "$(HOME)/.railsrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/rubocop.yml" "$(HOME)/.rubocop.yml"
	ln -sfh "$(HOME)/.dotfiles/lib/ruby/.rails" "$(HOME)/.rails"
	@lib/ruby/install.zsh

.PHONY: git shell homebrew ruby
