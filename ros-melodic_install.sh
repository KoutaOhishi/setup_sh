#!/bin/sh

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key  421C365BD9FF1F717815A3895523BAEEB01FA116

sudo apt update

sudo apt install -y ros-melodic-desktop-full

apt-cache search ros-melodic

sudo rosdep init
rosdep update

sudo echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
sudo echo "alias cm='cd ~/catkin_ws && catkin_make'" >> ~/.bashrc
source ~/.bashrc

sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential ninja-build liburdfdom-tools libceres-dev libprotobuf-dev protobuf-compiler libprotoc-dev

echo "Install Finished"
