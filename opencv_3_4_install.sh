#!/bin/sh

sudo apt-get install git
sudo apt-get install cmake

cd ~/
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.4.0

cd ~/
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.4.0

cd ~/
cd opencv
mkdir build
cd build
 
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules ..

make -j 2
sudo make install
sudo ldconfig
