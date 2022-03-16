#!/bin/bash
public_ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')
local_ip=$(hostname -I)
date=$(date)
temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')°
echo """| Time     | Local IP | Public IP | Temperature |
| ----------- | ----------- | ----------- | ----------- |
| $date      | $local_ip    | $public_ip  | $temp |""" >/home/pi/RasPi/README.md
cd /home/pi/RasPi/
git pull
git init
git add README.md
git commit -m "Recent update as of $date"
git push origin main