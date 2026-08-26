#!/bin/zsh

if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  unset POSIXLY_CORRECT && sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew already installed"
fi

if [ -L "$HOME/Local.brewfile" ]; then
  echo "Removing existing Local.brewfile symlink"
  rm "$HOME/Local.brewfile"
fi

ln -sf ~/.dotfiles/lib/homebrew/Brewfile ~/Brewfile

if command -v sudo &> /dev/null
then
  echo "Requesting administrator access..."
  if ! sudo -v
  then
    echo "Administrator access is required to run Homebrew installs"
    exit 1
  fi

  # Keep sudo fresh so brew doesn't repeatedly prompt for a password.
  while true
  do
    sudo -n true
    sleep 50
    kill -0 "$$" || exit
  done 2> /dev/null &
  SUDO_KEEPALIVE_PID=$!
  trap 'kill "$SUDO_KEEPALIVE_PID" 2> /dev/null' EXIT
fi

brew update
brew bundle --file ~/Brewfile
brew upgrade $(brew outdated --cask --greedy --quiet)
brew upgrade $(brew outdated --greedy --quiet)
brew cleanup
