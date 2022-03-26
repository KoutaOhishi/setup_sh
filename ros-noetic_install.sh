#! /bin/bash -eu

echo "######################"
echo "# Install ROS Noetic #"
echo "######################"

echo "Setting fot source.list"
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

echo "Key settting"
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

echo "Install"
sudo apt update
sudo apt install -y ros-noetic-desktop-full

echo "Setup environment"
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

echo "Initialize rosdep"
sudo rosdep init
rosdep update

echo "Create workspace"
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
source /opt/ros/noetic/setup.bash
catkin_make

sudo echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
sudo echo "alias cm='cd ~/catkin_ws && catkin_make'" >> ~/.bashrc
source ~/.bashrc

echo "Finish"
