#! /bin/bash

#"デスクトップ"を"Desktop"に変更する方法
#https://qiita.com/matoken/items/1e43b4f446060f64afa1

LANG=C xdg-user-dirs-update --force

echo "please reboot"
