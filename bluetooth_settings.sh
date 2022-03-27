#! /bin/bash

 curl -O https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_fw
curl -O https://raw.githubusercontent.com/Realtek-OpenSource/android_hardware_realtek/rtk1395/bt/rtkbt/Firmware/BT/rtl8761b_config

sudo cp rtl8761b_fw /lib/firmware/rtl_bt/rtl8761b_fw.bin
sudo cp rtl8761b_config /lib/firmware/rtl_bt/rtl8761b_config.bin

echo "sudo reboot"
