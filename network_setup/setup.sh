#!/bin/bash

sudo dpkg -i linux-firmware_1.157.20_all.deb

sudo apt install --reinstall bcmwl-kernel-source
sudo modprobe wl

echo "'sudo reboot'"
