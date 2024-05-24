#!/bin/zsh

if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed"
fi

brew update
brew bundle --file ~/Brewfile
brew bundle --file ~/Local.brewfile
brew cleanup
