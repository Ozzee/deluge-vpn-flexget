#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="python2-pip"

# install pre-reqs
pacman -Sy --noconfirm
pacman -S --needed $pacman_packages --noconfirm

pip2 install flexget

# set permissions
chown -R nobody:users /home/nobody /usr/bin/flexget
chmod -R 775 /home/nobody /usr/bin/flexget

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
