#!/bin/zsh
set -euo pipefail

if [ -z "${GIT_AUTHOR_EMAIL:-}" ] || [ -z "${GIT_AUTHOR_NAME:-}" ]; then
  echo "Error: GIT_AUTHOR_EMAIL and GIT_AUTHOR_NAME must both be set."
  echo "Run: make git GIT_AUTHOR_EMAIL=you@example.com GIT_AUTHOR_NAME='Your Name'"
  exit 1
fi

if [ -e "$HOME/.gitconfig" ]; then
  echo "Removing existing .gitconfig"
  rm -f "$HOME/.gitconfig"
fi

echo "Generating .gitconfig from template..."
envsubst < "$HOME/.dotfiles/lib/git/gitconfig.tmpl" > "$HOME/.gitconfig"

if [ -e "$HOME/.gitignore" ]; then
  echo "Removing existing .gitignore"
  rm -f "$HOME/.gitignore"
fi

echo "Linking .gitignore..."
ln -sf "$HOME/.dotfiles/lib/git/gitignore" "$HOME/.gitignore"
