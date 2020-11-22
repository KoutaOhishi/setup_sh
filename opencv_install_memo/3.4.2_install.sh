#!/bin/bash
set -eu

echo "===== Install OpenCV 3.4.2 ====="

echo "Install dependencies..."
sudo apt-get install -y \
	build-essential \
	checkinstall \
	cmake \
	unzip \
	pkg-config \
	yasm \
	git \
	gfortran \
	python3-dev \
	libjpeg8-dev \
	libjasper-dev \
	libpng12-dev \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	libdc1394-22-dev \
	libxine2-dev \
	libv4l-dev \
	libjpeg-dev \
	libpng-dev \
	libtiff-dev \
	libtbb-dev \
	libavcodec-dev \
	libavformat-dev \
	libswscale-dev \
	libv4l-dev \
	libatlas-base-dev \
	libxvidcore-dev \
	libx264-dev \
	libgtk-3-dev
	
echo "git clone opencv & opencv_contrib"

cd ~/

#git clone https://github.com/opencv/opencv_contrib.git
#cd opencv_contrib
#git checkout 3.4.2
#cd ../

#wget https://github.com/opencv/opencv/archive/3.4.2.tar.gz
#tar xvf 3.4.2.tar.gz
#rm 3.4.2.tar.gz 
#cp -rf opencv-3.4.2 opencv
#rm -rf opencv-3.4.2

cd opencv
mkdir build
cd build

cmake \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules/ \
	..
	
#make -j`nproc`
make
sudo make install
#echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
sudo ldconfig -v

echo "===== Finished ====="
