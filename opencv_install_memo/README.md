# OepnCV Install Memo for ROS

## Uninstall OpenCV　　

```bash
# make uninstall
$ cd /path/to/opencv/build
$ sudo make uninstall

# remove dir
$ locate opencv #opencvと名前のついてるファイルを検索
$ rm -rf ####
$ sudo find / -name "*opencv*" -exec rm -i {} \; #これでも消えるはず
```　　

## Install OpenCV  

```bash
$ sudo apt-get install -y \
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

$ cd ~/

$ git clone https://github.com/opencv/opencv_contrib.git
$ cd opencv_contrib
$ git checkout 3.4.2
$ cd ../

$ wget https://github.com/opencv/opencv/archive/3.4.2.tar.gz
$ tar xvf 3.4.2.tar.gz
$ rm 3.4.2.tar.gz 
$ cp -rf opencv-3.4.2 opencv
$ rm -rf opencv-3.4.2

$ cd opencv
$ mkdir build
$ cd build

$ cmake \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules/ \
	..
	
$ #make -j`nproc`
$ make
$ sudo make install
$ echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
$ sudo ldconfig -v
```

## Fix cv-bridge  

```bash
$ cd /opt/ros/kinetic/share/cv_bridge/cmake/
$ sudo gedit cv_bridgeConfig.cmake
```

cv_bridgeConfig.cmakeを修正  
```cv_bridgeConfig.cmake
if(NOT "include;/opt/ros/kinetic/include/opencv-3.3.1-dev;/opt/ros/kinetic/include/opencv-3.3.1-dev/opencv " STREQUAL " ")
set(cv_bridge_INCLUDE_DIRS "")
set(_include_dirs "include;/opt/ros/kinetic/include/opencv-3.3.1-dev;/opt/ros/kinetic/include/opencv-3.3.1-dev/opencv")
↓
if(NOT "include;/usr/local/include/opencv;/usr/local/include/opencv2 " STREQUAL " ")
set(OpenCV_DIR /usr/local/share/OpenCV)
find_package(OpenCV REQUIRED)
set(cv_bridge_INCLUDE_DIRS "")
set(_include_dirs "include;${OpenCV_INCLUDE_DIRS}")

#####

set(libraries "cv_bridge;/opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_core3.so.3.3.1;/opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgproc3.so.3.3.1;/opt/ros/kinetic/lib/x86_64-linux-gnu/libopencv_imgcodecs3.so.3.3.1")
↓
set(libraries "cv_bridge;${OpenCV_LIBS}")

#####

set(pkg_cfg_extras "cv_bridge-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${cv_bridge_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
↓
#set(pkg_cfg_extras "cv_bridge-extras.cmake")
#foreach(extra ${pkg_cfg_extras})
#  if(NOT IS_ABSOLUTE ${extra})
#    set(extra ${cv_bridge_DIR}/${extra})
#  endif()
#  include(${extra})
#endforeach()

```  

## Fix CMakeLists.txt in ROS package

version 3.4.2を使う場合は以下のようにする.  

```CMakeLists.txt
cmake_minimum_required(VERSION 2.8.3)
project(〇〇)←パッケージ名

add_compile_options(-std=c++11)
set(OpenCV_DIR /usr/local/share/OpenCV/)
find_package(OpenCV REQUIRED)
```

## Pythonの場合

```bash
$ sudo python -m pip install opencv-python==3.4.2.16
$ sudo python -m pip install opencv-contril-python==3.4.2.16

$ python
$ >>> import sys
$ >>> sys.path.remove("/opt/ros/kinetic/lib/python2.7/dist-packages")
$ >>> import cv2
$ >>> cv2.__version__
'3.4.2'
```  
