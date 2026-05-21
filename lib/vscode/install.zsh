#!/bin/zsh

set -e

mv "$HOME/Library/Application Support/Code/User/snippets" "$HOME/Library/Application Support/Code/User/snippets.old"
ln -sfh "$HOME/.dotfiles/lib/vscode/snippets" "$HOME/Library/Application Support/Code/User/snippets"
