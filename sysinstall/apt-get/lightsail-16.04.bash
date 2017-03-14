#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Install software packages
echo -e "\nsudo apt-get install -y ..."
echo -e "\nCommand-line tools"
# Some essential things that are included in the base lightsail image for Ubuntu 16.04
#  - vim, git, tmux, curl, openssh-server
sudo apt-get install -y zsh colordiff htop tree ranger sysvbanner lolcat
sudo apt-get install -y imagemagick syslinux syslinux-utils nmap realpath mtools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver bsdgames httpie
sudo apt-get install -y pandoc lynx
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 w3m w3m-img
sudo apt-get install -y fonts-inconsolata xclip

echo -e "\nNetwork time stuff"
sudo apt-get install -y ntp
# Force time sync right now
sudo service ntp stop && sudo ntpd -gq && sudo service ntp start

echo -e "\nPython stuff"
sudo apt-get install -y binutils-multiarch gcc g++ python3-dev python3-venv python3-pip python3-setuptools
# Requirements for lxml
sudo apt-get install -y libxml2 libxslt1.1 libxml2-dev libxslt1-dev zlib1g-dev
# Install some system-wide packages
sudo pip3 install asciinema uwsgi

echo -e "\nRedis & MongodB stuff"
sudo apt-get install -y redis-server
git clone https://github.com/sripathikrishnan/redis-rdb-tools /tmp/rdbtools
cd /tmp/rdbtools && sudo python3 setup.py install
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# echo -e "\nJava Runtime stuff"
# sudo apt-get install -y default-jre
