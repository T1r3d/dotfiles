#!/bin/bash
#This script is used to automatically install ZSH, oh-my-zsh and zsh-autosuggestions plugin in order.
#install zsh
sudo apt-get update
sudo apt-get install -y zsh
#TODO: build from source to get the latest zsh
chsh -s /bin/zsh
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
