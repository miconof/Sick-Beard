#!/bin/bash

cd "$(dirname $0)" # quotes, to handle spaces in the path
if [ $(id -u) -eq 0 ];
then
   echo "You should run this script as a regular user"
   exit -1
fi

echo "Copying config files..."
sudo cp init.ubuntu /etc/init.d/sickbeard
sudo cp defaults /etc/default/sickbeard
mkdir torrents

echo "Installing periscope..."
sudo apt-get -y install python-setuptools python-beautifulsoup
mkdir -p ~/.config
cd ..
git clone https://github.com/patrickdessalle/periscope
cd periscope && sudo python setup.py install

echo "Start Sickbeard service and add it to the default runlevel..."
sudo /etc/init.d/sickbeard start
sudo update-rc.d sickbeard defaults
