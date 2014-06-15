#!/bin/bash

# --- gentoo --- #
# sudo emerge-webrsync && sudo emerge -auvDN world

# -- debian -- #

sudo aptitude update
printf "update system?[y/n] "
read answer
if [ "$answer" != "y" ]; then
  echo "exit"
else
  sudo aptitude upgrade
fi


