#!/bin/bash

sudo apt --purge remove -y chrome-remote-desktop
sudo apt --purge remove -y google-chrome* 
sudo apt autoremove -y
sudo apt autoclean
rm ~/.chrome-remote-desktop-session 

