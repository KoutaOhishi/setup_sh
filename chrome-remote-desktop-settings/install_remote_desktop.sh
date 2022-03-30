#!/bin/bash
#https://jitaku.work/it/os/linux/ubuntu/google-chrome-remote-desktop/

touch ~/.chrome-remote-desktop-session 

sudo apt update 

sudo apt install xbase-clients 
sudo dpkg -i ./chrome-remote-desktop_current_amd64.deb 

sudo systemctl stop chrome-remote-desktop.service
sudo cp /opt/google/chrome-remote-desktop/chrome-remote-desktop /opt/google/chrome-remote-desktop/chrome-remote-desktop.org
sudo cp ./chrome-remote-desktop /opt/google/chrome-remote-desktop/
sudo systemctl restart chrome-remote-desktop.service
