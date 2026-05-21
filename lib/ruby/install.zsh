#!/bin/zsh

set -e

ln -sf "$HOME/.dotfiles/lib/ruby/gemrc" "$HOME/.gemrc"
ln -sf "$HOME/.dotfiles/lib/ruby/railsrc" "$HOME/.railsrc"
ln -sf "$HOME/.dotfiles/lib/ruby/rubocop.yml" "$HOME/.rubocop.yml"
ln -sfh "$HOME/.dotfiles/lib/ruby/.rails" "$HOME/.rails"

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

if ! command -v brew &> /dev/null
then
  echo "Homebrew is required to install Ruby dependencies"
  exit 1
fi

brew install pkg-config openssl@3
OPENSSL_PREFIX="$(brew --prefix openssl@3)"

# Use Homebrew-provided OpenSSL and skip RVM autolibs to avoid openssl@1.1 installs.
export LDFLAGS="-L$OPENSSL_PREFIX/lib"
export CPPFLAGS="-I$OPENSSL_PREFIX/include"
export PKG_CONFIG_PATH="$OPENSSL_PREFIX/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
rvm autolibs disable

RUBY_VERSION="3.4.8"
TARGET_RUBY="ruby-$RUBY_VERSION"

echo "Target Ruby version: $RUBY_VERSION"
if rvm list strings | grep -q "ruby-$RUBY_VERSION"; then
  echo "Ruby $RUBY_VERSION already installed"
else
  echo "Installing Ruby $RUBY_VERSION with OpenSSL support..."
  rvm cleanup all
  rvm install "$RUBY_VERSION" --with-openssl-dir="$OPENSSL_PREFIX"
  rvm --default use "$RUBY_VERSION"
  echo "RVM and Ruby $RUBY_VERSION installed successfully!"
fi

# Remove all installed MRI Ruby versions except the target version.
INSTALLED_RUBIES=("${(@f)$(rvm list strings | grep '^ruby-')}")
for INSTALLED_RUBY in "${INSTALLED_RUBIES[@]}"
do
  if [[ "$INSTALLED_RUBY" != "$TARGET_RUBY" ]]; then
    echo "Removing Ruby version: $INSTALLED_RUBY"
    rvm remove "$INSTALLED_RUBY"
  fi
done

echo "Using Ruby version: $(ruby -v)"
echo "Installing Rails gem..."
gem install rails
echo "Updating RubyGems system software..."
gem update --system
