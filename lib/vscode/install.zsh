#!/bin/zsh

set -e

rm -rf "$HOME/Library/Application Support/Code/User/snippets"
ln -sfh "$HOME/.dotfiles/lib/vscode/snippets" "$HOME/Library/Application Support/Code/User/snippets"
