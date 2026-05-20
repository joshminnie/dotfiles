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
	@test -n "$(GIT_AUTHOR_EMAIL)" || (echo "Error: GIT_AUTHOR_EMAIL is not set. Run: make git GIT_AUTHOR_EMAIL=you@example.com"; exit 1)
	@[ -L "$(HOME)/.gitconfig" ] && rm "$(HOME)/.gitconfig" || true
	envsubst < "$(HOME)/.dotfiles/lib/git/gitconfig.tmpl" > "$(HOME)/.gitconfig"
	ln -sf "$(HOME)/.dotfiles/lib/git/gitignore" "$(HOME)/.gitignore"

shell:
	@echo "Configuring shell..."
	ln -sfh "$(HOME)/.dotfiles/lib/shell/iTerm" "$(HOME)/.iTerm"
	ln -sfh "$(HOME)/.dotfiles/lib/shell/zsh-custom/" "$(HOME)/.zsh-custom"
	ln -sf "$(HOME)/.dotfiles/lib/shell/zshrc.zsh" "$(HOME)/.zshrc"
	@lib/shell/install.zsh

homebrew:
	@echo "Configuring homebrew..."
	@lib/homebrew/install.zsh

ruby:
	@echo "Configuring Ruby..."
	ln -sf "$(HOME)/.dotfiles/lib/ruby/gemrc" "$(HOME)/.gemrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/railsrc" "$(HOME)/.railsrc"
	ln -sf "$(HOME)/.dotfiles/lib/ruby/rubocop.yml" "$(HOME)/.rubocop.yml"
	ln -sfh "$(HOME)/.dotfiles/lib/ruby/.rails" "$(HOME)/.rails"
	@lib/ruby/install.zsh

vscode:
	@echo "Configuring VS Code..."
	mv "$(HOME)/Library/Application Support/Code/User/snippets" "$(HOME)/Library/Application Support/Code/User/snippets.old"
	ln -sfh "$(HOME)/.dotfiles/lib/vscode/snippets" "$(HOME)/Library/Application Support/Code/User/snippets"

.PHONY: git shell homebrew ruby vscode
