BLACK := $(shell tput setaf 0)
RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
BLUE := $(shell tput setaf 4)
MAGENTA := $(shell tput setaf 5)
CYAN := $(shell tput setaf 6)
WHITE := $(shell tput setaf 7)

BRIGHT_BLACK := $(shell tput setaf 8)
BRIGHT_RED := $(shell tput setaf 9)
BRIGHT_GREEN := $(shell tput setaf 10)
BRIGHT_YELLOW := $(shell tput setaf 11)
BRIGHT_BLUE := $(shell tput setaf 12)
BRIGHT_MAGENTA := $(shell tput setaf 13)
BRIGHT_CYAN := $(shell tput setaf 14)
BRIGHT_WHITE := $(shell tput setaf 15)

RESET := $(shell tput sgr0)

default: all

all: git shell homebrew ruby vscode

help:
	@echo "$(BLUE)Available targets:" \
		"\n  git\t\tConfigures git" \
		"\n  shell\t\tConfigures zsh and oh-my-zsh" \
		"\n  homebrew\tConfigures homebrew and installs applications and libraries" \
		"\n  ruby\t\tConfigures Ruby on Rails environment$(RESET)"

git:
	@echo "$(BLUE)Configuring git...$(RESET)"
	@zsh lib/git/install.zsh
	@echo "$(GREEN)Completed configuring git!$(RESET)"

shell:
	@echo "$(BLUE)Configuring shell...$(RESET)"
	@zsh lib/shell/install.zsh
	@echo "$(GREEN)Completed configuring shell!$(RESET)"

homebrew:
	@echo "$(BLUE)Configuring homebrew...$(RESET)"
	@zsh lib/homebrew/install.zsh
	@echo "$(GREEN)Completed configuring homebrew!$(RESET)"

ruby:
	@echo "$(BLUE)Configuring Ruby...$(RESET)"
	@zsh lib/ruby/install.zsh
	@echo "$(GREEN)Completed configuring Ruby!$(RESET)"

vscode:
	@echo "$(BLUE)Configuring VS Code...$(RESET)"
	@zsh lib/vscode/install.zsh
	@echo "$(GREEN)Completed configuring VS Code!$(RESET)"

.PHONY: all git shell homebrew ruby vscode
