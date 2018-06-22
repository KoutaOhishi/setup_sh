#!/bin/sh

sudo apt-get update


sudo apt-get install nvidia-375

#「システムプログラムの問題が見つかりました」が表示されないように設定する
sudo rm -rf /var/crash/*
