#!/bin/bash

# Homebrew
git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

# Homebrew Core
git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git

# Homebrew Cask
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git

# Homebrew-bottles
# comment HOMEBREW_BOTTLE_DOMAIN in ~/.zshrc then source ~/.zshrc

brew update