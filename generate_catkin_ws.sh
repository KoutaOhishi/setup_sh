#!/bin/sh

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace

cd ~/catkin_ws/
catkin_make

echo "catkin_ws is generated!"
