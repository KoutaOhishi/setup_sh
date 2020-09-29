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

#sudo apt-get install git
#sudo apt-get install curl xzcat cpio
#git clone https://github.com/patjak/facetimehd-firmware.git
#cd facetimehd-firmware
#make
#sudo make install
#cd ..
#sudo apt-get install kmod libssl-dev checkinstall
#git clone https://github.com/patjak/bcwc_pcie.git
#cd bcwc_pcie
#make
#sudo make install
#sudo depmod
#sudo modprobe -r bdc_pci
#sudo modprobe facetimehd
#sudo nano /etc/modules
#**add line "facetimehd", write out (ctl+o) & close**
