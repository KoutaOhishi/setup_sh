#!/bin/sh

sudo apt-get update

#ドライバの設定
sudo apt-get install nvidia-375

#「システムプログラムの問題が見つかりました」が表示されないように設定する
sudo rm -rf /var/crash/*

#画像編集ソフトのインストール
sudo apt-get install gimp -y
sudo apt-get install pinta -y

#"デスクトップ"を"Desktop"に変更する方法
https://qiita.com/matoken/items/1e43b4f446060f64afa1

#macのキーボードをubuntuでも使えるように設定する
https://www.karelie.nethttps://qiita.com/yas-nyan/items/55e764304c67736ff9ba/customize-keyboard-for-macuser/#toc_-2

