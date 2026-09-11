#!/bin/zsh

set -e

rm -rf "$HOME/Library/Application Support/Code/User/snippets"
ln -sfh "$HOME/.dotfiles/lib/vscode/snippets" "$HOME/Library/Application Support/Code/User/snippets"
cp -f "$HOME/.dotfiles/lib/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
cp -f "$HOME/.dotfiles/lib/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
