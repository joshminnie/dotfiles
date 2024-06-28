#!/bin/zsh

brew upgrade $(brew outdated --greedy --quiet)
brew upgrade $(brew outdated --cask --greedy --quiet)
