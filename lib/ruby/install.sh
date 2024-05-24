#!/bin/sh

if ! command -v rvm &> /dev/null
then
  # Install RVM
  echo "Installing RVM..."
  curl -sSL https://get.rvm.io | bash -s stable
else
  echo "RVM already installed, getting latest version..."
  rvm get stable
fi

rvm cleanup all
rvm install 3.3.1 --with-openssl-dir=$(brew --prefix openssl@1.1)
rvm --default use 3.3.1
gem install rails
