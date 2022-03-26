#! /bin/bash

echo "Download deb file"
wget http://zoom.us/client/latest/zoom_amd64.deb

echo "Install dependencies"
sudo apt install -y libgl1-mesa-glx libegl1-mesa libxcb-xtest0

echo "Install zoom"
sudo dpkg -i zoom_amd64.deb

echo "Finish to install zoom"
