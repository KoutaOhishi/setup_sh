#!/bin/bash

#https://jitaku.work/it/os/linux/ubuntu/google-chrome-remote-desktop/

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub 
sudo apt-key add -
sudo apt update
sudo apt install -y google-chrome-stable

touch ~/.chrome-remote-desktop-session 
