#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Install software packages
echo -e "\nsudo apt-get install -y ..."

echo -e "\nAudio tools"
sudo apt-get install -y libav-tools sox libsox-fmt-mp3 rtmpdump

echo -e "\nFile-system tools"
sudo apt-get install -y exfat-fuse exfat-utils cryptsetup

echo -e "\nCommand-line tools"
sudo apt-get install -y vim git zsh tmux curl pmount acpi colordiff htop tree ranger moc moc-ffmpeg-plugin sysvbanner lolcat
sudo apt-get install -y openssh-server imagemagick wodim dvd+rw-tools syslinux syslinux-utils nmap realpath mtools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver bsdgames
sudo apt-get install -y pandoc lynx cmus cmus-plugin-ffmpeg sqlite3
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
sudo apt-get install -y xclip xbindkeys wmctrl dkms awesome

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 gparted w3m w3m-img
sudo apt-get install -y recordmydesktop guvcview vlc audacity inkscape gimp
sudo apt-get install -y fonts-inconsolata
sudo apt-get install -y libreoffice wine
sudo apt-get install -y evince-gtk okular retext
sudo apt-get install -y chromium-browser
# sudo apt-get install -y pepperflashplugin-nonfree icedtea-8-plugin
# sudo update-pepperflashplugin-nonfree --install

echo -e "\nNetwork time stuff"
sudo apt-get install -y ntp
# Force time sync right now
sudo service ntp stop && sudo ntpd -gq && sudo service ntp start

echo -e "\nScreensaver stuff"
sudo apt-get install -y xscreensaver xscreensaver-data xscreensaver-data-extra
sudo apt-get install -y xscreensaver-gl xscreensaver-gl-extra

echo -e "\nPython stuff"
sudo apt-get install -y binutils-multiarch gcc g++ python3-dev python3-venv python3-pip python3-setuptools libssl-dev
# Requirements for dbus-python
sudo apt-get install -y pkg-config libdbus-1-dev libdbus-glib-1-dev
# Requirements for lxml
sudo apt-get install -y libxml2 libxslt1.1 libxml2-dev libxslt1-dev zlib1g-dev
# Requirements for dryscrape
sudo apt-get install -y qt5-default libqt5webkit5-dev xvfb build-essential
# Install some system-wide packages
sudo pip3 install asciinema uwsgi twine

echo -e "\nRedis & MongodB stuff"
sudo apt-get install -y redis-server
git clone https://github.com/sripathikrishnan/redis-rdb-tools /tmp/rdbtools
cd /tmp/rdbtools && sudo python3 setup.py install
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# echo -e "\nJava Runtime stuff"
sudo apt-get install -y default-jre

echo -e "\nDocker stuff"
sudo apt-get install -y software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo su -c 'curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\nYarn stuff"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install -y yarn

# # See: http://www.postgresql.org/download/linux/ubuntu/
# echo -e "\nPostgreSQL stuff"
# sudo su -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install -y postgresql-9.4 postgresql-server-dev-9.4 postgresql-plpython-9.4 postgresql-contrib-9.4

# http://stackoverflow.com/questions/25940944
# echo -e "\nTmux 1.9"
# sudo apt-get install -y python-software-properties software-properties-common
# sudo add-apt-repository -y ppa:pi-rho/dev
# sudo apt-get update
# sudo apt-get install -y tmux=1.9a-1~ppa1~t

# echo -e "\nVirtualbox stuff"
# sudo apt-get install -y libqt4-opengl
# cd /tmp
# wget "http://download.virtualbox.org/virtualbox/4.3.26/virtualbox-4.3_4.3.26-98988~Ubuntu~raring_amd64.deb"
# sudo dpkg -i virtualbox-4.3_4.3.26-98988\~Ubuntu\~raring_amd64.deb
