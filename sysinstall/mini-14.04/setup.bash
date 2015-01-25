#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Install software packages
echo -e "\nsudo apt-get install -y ..."
echo -e "\nWireless tools"
sudo apt-get install -y wireless-tools wicd-curses wicd-daemon firmware-b43-installer
sudo service wicd start
wicd-curses

echo -e "\nAudio tools"
sudo apt-get install -y alsa-base alsa-utils alsa-firmware-loaders alsa-tools libav-tools
user=$(whoami)
sudo usermod -a -G audio,video $user
alsamixer

echo -e "\nCommand-line tools"
sudo apt-get install -y vim git zsh tmux curl pmount acpi colordiff htop tree ranger moc
sudo apt-get install -y openssh-server imagemagick wodim dvd+rw-tools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver

echo -e "\nXorg stuff"
sudo apt-get install -y xserver-xorg-core xserver-xorg-video-intel
sudo apt-get install -y xserver-xorg-input-kbd xserver-xorg-input-wacom
sudo apt-get install -y xinit xclip xbindkeys awesome

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 gparted
sudo apt-get install -y recordmydesktop guvcview vlc audacity inkscape gimp
# sudo apt-get install -y libreoffice wine virtualbox
sudo apt-get install -y evince-gtk chromium-browser firefox pepperflashplugin-nonfree
sudo update-pepperflashplugin-nonfree --install

echo -e "\nScreensaver stuff"
sudo apt-get install -y xscreensaver xscreensaver-data xscreensaver-data-extra
sudo apt-get install -y xscreensaver-gl xscreensaver-gl-extra

echo -e "\nPython stuff"
sudo apt-get install -y binutils-multiarch python-dev python-pip
sudo pip install --upgrade pip
sudo pip install virtualenv
