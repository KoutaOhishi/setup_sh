#!/bin/sh

echo "Install ROS MELODIC"

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt install -y curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt update
sudo apt install -y ros-melodic-desktop-full


cd
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt install -y python-rosinstall python-catkin-tools python-rosdep

sudo rosdep init
rosdep update

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin build

source devel/setup.bash
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

echo "Install Finished"
