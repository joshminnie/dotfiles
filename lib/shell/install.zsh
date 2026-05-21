#!/bin/zsh
set -a

ln -sfh "$HOME/.dotfiles/lib/shell/iTerm" "$HOME/.iTerm"
ln -sfh "$HOME/.dotfiles/lib/shell/zsh-custom/" "$HOME/.zsh-custom"
ln -sf "$HOME/.dotfiles/lib/shell/zshrc.zsh" "$HOME/.zshrc"

if [ -d "~/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed"
fi
