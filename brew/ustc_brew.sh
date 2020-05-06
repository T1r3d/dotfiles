#!/bin/bash

# Homebrew
git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git

# Homebrew Core
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

# Homebrew Cask
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# Homebrew-bottles
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
# then source ~/.zshrc

brew update