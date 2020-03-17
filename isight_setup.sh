#!/bin/bash

cd
git clone https://github.com/patjak/bcwc_pcie.git
cd bcwc_pcie/firmware
git clone https://github.com/patjak/facetimehd-firmware
cd facetimehd-firmware
sudo make
sudo make install
cd ../..
sudo make
sudo make install
sudo depmod
sudo modprobe -r bdc_pci
sudo modprobe facetimehd
echo "finish"