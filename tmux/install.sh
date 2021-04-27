#!/bin/bash
#This script is used to install tmux(build from source) and .tmux automatically.
#install dependencies
sudo apt-get update
sudo apt-get install -y libevent-dev ncurses-dev
#install latest released tmux
LAST_VERSION=$(curl -s https://github.com/tmux/tmux/releases/latest | grep -Po 'tag/\K.*?(?=")')
WORKDIR="/tmp/tmux-install"
rm -rf $WORKDIR
mkdir $WORKDIR
cd $WORKDIR
curl -sSL "https://github.com/tmux/tmux/releases/download/${LAST_VERSION}/tmux-${LAST_VERSION}.tar.gz" -o tmux.tar.gz
tar -xzvf tmux.tar.gz
cd tmux-*/
./configure
make && sudo make install
#install .tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
#then copy the content in the .tmux.conf to ~/.tmux.conf.local
#TODO: add auto configure
