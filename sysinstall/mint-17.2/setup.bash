#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Install software packages
echo -e "\nsudo apt-get install -y ..."

echo -e "\nAudio tools"
sudo apt-get install -y libav-tools sox

echo -e "\nCommand-line tools"
sudo apt-get install -y vim git zsh tmux curl pmount acpi colordiff htop tree ranger moc sysvbanner
sudo apt-get install -y openssh-server imagemagick wodim dvd+rw-tools syslinux nmap realpath mtools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver bsdgames
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
sudo apt-get install -y xclip xbindkeys wmctrl

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 gparted
sudo apt-get install -y recordmydesktop guvcview vlc audacity inkscape gimp
sudo apt-get install -y fonts-inconsolata
sudo apt-get install -y libreoffice wine
sudo apt-get install -y evince-gtk okular
sudo apt-get install -y chromium-browser icedtea-7-plugin

echo -e "\nScreensaver stuff"
sudo apt-get install -y xscreensaver xscreensaver-data xscreensaver-data-extra
sudo apt-get install -y xscreensaver-gl xscreensaver-gl-extra

echo -e "\nPython stuff"
sudo apt-get install -y binutils-multiarch python-dev python-pip
sudo pip install --upgrade pip
sudo pip install virtualenv
# Requirements for lxml
sudo apt-get install -y libxml2 libxslt1.1 libxml2-dev libxslt1-dev zlib1g-dev

echo -e "\nNoSQL stuff"
sudo apt-get install -y redis-server mongodb
