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

# fishのアンインストール
brew uninstall fish

# デフォルトシェルをbashに設定
chsh -s /bin/bash
sudo sed -i -e '/fish/d' /etc/shells

# LinuxでHomebrew用に設定したプロファイルと環境変数の設定を削除
if [ $OS == 'Linux' ]; then
  test -r ~/.bash_profile && sed -i -e '/brew shellenv/d' ~/.bash_profile
  test -r ~/.profile && sed -i -e '/brew shellenv/d' ~/.profile
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv | sed -e 's/export/export -n/g')
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv | sed -e 's/export/export -n/g')
fi

# homebrewのアンインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

# 必要なモジュールのアンインストール
if [ $OS == 'Linux' ]; then
    sudo apt-get remove build-essential curl file git
fi
