#!/bin/zsh

if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed"
fi

if [ -L "$HOME/Local.brewfile" ]; then
  echo "Removing existing Local.brewfile symlink"
  rm "$HOME/Local.brewfile"
fi

ln -sf ~/.dotfiles/lib/homebrew/Brewfile ~/Brewfile

brew update
brew bundle --file ~/Brewfile
brew upgrade $(brew outdated --cask --greedy --quiet)
brew upgrade $(brew outdated --greedy --quiet)
brew cleanup
