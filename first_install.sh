#!/bin/sh

sudo apt-get update

#ドライバの設定
sudo apt-get install nvidia-375

#「システムプログラムの問題が見つかりました」が表示されないように設定する
sudo rm -rf /var/crash/*

#画像編集ソフトのインストール
sudo apt-get install gimp -y
sudo apt-get install pinta -y
