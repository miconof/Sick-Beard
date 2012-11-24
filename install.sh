#!/bin/bash

cd `dirname $0`

echo "Copying config files..."
cp init.ubuntu /etc/init.d/sickbeard
cp defaults /etc/default/sickbeard
su pi -c 'mkdir torrents'

echo "Installing periscope..."
apt-get -y install python-setuptools python-beautifulsoup
cd .. && su pi -c 'git clone https://github.com/patrickdessalle/periscope'
cd periscope && python setup.py install

echo "Start Sickbeard service and add it to the default runlevel..."
/etc/init.d/sickbeard start
update-rc.d sickbeard defaults
