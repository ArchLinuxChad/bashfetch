#!/bin/bash
mkdir -p /home/$USER/.config/bashfetch
cp config /home/$USER/.config/bashfetch

sudo cp bashfetch /usr/local/bin/
sudo mkdir -p /opt/bashfetch
sudo cp -r scripts /opt/bashfetch
