#!/bin/bash

cd `dirname $0`

cp init.ubuntu /etc/init.d/sickbeard
cp defaults /etc/default/sickbeard
/etc/init.d/sickbeard start
update-rc.d sickbeard defaults
