#!/bin/sh
echo Filename to process. $1
echo Original filename... $2
echo Show TVDB id........ $3
echo Season number....... $4
echo Episode number...... $5
echo Episode air date.... $6
echo ... will now pass the search info to periscope to snatch a subtitle
/usr/local/bin/periscope "$1" -l en --force
