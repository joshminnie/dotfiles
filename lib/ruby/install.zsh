#!/bin/zsh

if ! command -v rvm &> /dev/null
then
  # Install RVM
  echo "Installing RVM..."
  curl -sSL https://get.rvm.io | bash -s stable
else
  echo "RVM already installed, getting latest version..."
  rvm get stable
fi

# Load rvm as a shell function
source ~/.rvm/scripts/rvm
type rvm | head -n 1

# Prep rvm usage
rvm cleanup all
rvm install 3.4.8
rvm --default use 3.4.8
gem install rails
