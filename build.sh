#!/bin/bash
sudo echo "Installing mesa-utils"
sudo apt install mesa-utils -y
echo "Downloading driver"
version="$(glxinfo | grep "OpenGL version string" | rev | cut -d" " -f1 | rev)"
wget http://us.download.nvidia.com/XFree86/Linux-x86_64/"$version"/NVIDIA-Linux-x86_64-"$version".run
mv NVIDIA-Linux-x86_64-"$version".run NVIDIA-DRIVER.run
sudo docker build -t $1 .
