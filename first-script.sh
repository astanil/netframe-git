#!/bin/bash

#installing dependencies
sudo apt-get install wget gpg

#importing gpg key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

#enabling repo
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

#installing code
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

#checking availability 
if ! command -v code &> /dev/null
then
    echo "VS isn't installed"
    exit
else
    echo "VS is installed"
fi


