#!/bin/bash
# sudo emerge-webrsync && sudo emerge -auvDN world
sudo aptitude update
printf "update system?[y/n] "
read answer
if [ "$answer" != "y" ]; then
  echo "exit"
else 
  sudo aptitude upgrade
fi


