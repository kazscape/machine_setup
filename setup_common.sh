#!/bin/bash

# OSの判定
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# Linuxで必要なモジュールのインストール
if [ $OS == 'Linux' ]; then
  sudo apt-get install build-essential curl file git
fi

# Homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#HomebrewのLinux用の環境変数とProfileの設定
if [ $OS == 'Linux' ]; then
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
fi

# fishのインストール
brew install fish
fish --version

# デフォルトシェルをfishに設定
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

# fishシェルの起動
fish