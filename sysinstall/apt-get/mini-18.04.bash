#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Autoremove any package that "was automatically installed and is no longer required"
echo -e "\nAutoremove.."
sudo apt autoremove -y

# Install software packages
echo -e "\nsudo apt-get install -y ..."
echo -e "\nWireless tools"
sudo apt-get install -y wireless-tools wicd-curses wicd-daemon firmware-b43-installer
sudo service wicd start
wicd-curses

echo -e "\nAudio tools"
sudo apt-get install -y alsa-base alsa-utils alsa-firmware-loaders alsa-tools ffmpeg sox libsox-fmt-mp3 rtmpdump
sudo usermod -aG audio,video ${USER}
alsamixer

echo -e "\nFile-system tools"
sudo apt-get install -y exfat-fuse exfat-utils cryptsetup

echo -e "\nCommand-line tools"
sudo apt-get install -y vim git git-flow zsh tmux curl pmount acpi colordiff htop tree ranger moc moc-ffmpeg-plugin sysvbanner lolcat ncdu
sudo apt-get install -y openssh-server imagemagick wodim dvd+rw-tools syslinux syslinux-utils nmap mtools net-tools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver bsdgames
sudo apt-get install -y pandoc lynx cmus cmus-plugin-ffmpeg sqlite3
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

echo -e "\nXorg stuff"
sudo apt-get install -y xserver-xorg-core xserver-xorg-video-intel
sudo apt-get install -y xserver-xorg-input-kbd xserver-xorg-input-libinput
# sudo apt-get install -y xserver-xorg-input-wacom xserver-xorg-input-synaptics
sudo apt-get install -y xinit xclip xbindkeys wmctrl dkms awesome   # slim

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 gparted w3m w3m-img gifsicle
sudo apt-get install -y recordmydesktop guvcview vlc audacity inkscape gimp
sudo apt-get install -y fonts-inconsolata
sudo apt-get install -y libreoffice wine-stable
sudo apt-get install -y evince okular retext
sudo apt-get install -y chromium-browser firefox
sudo apt-get install -y ripperx lame
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
sudo apt-get install -y binutils-multiarch gcc g++ python3-dev python3-venv python3-pip python3-setuptools libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
# Extra requirements for pyenv
sudo apt-get install -y make build-essential zlib1g-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
# Requirements for dbus-python
sudo apt-get install -y pkg-config libdbus-1-dev libdbus-glib-1-dev
sudo chown -R ${USER}:${USER} ~/.dbus ~/.cache/dconf
# Requirements for lxml
sudo apt-get install -y libxml2 libxslt1.1 libxml2-dev libxslt1-dev
# Requirements for dryscrape
sudo apt-get install -y qt5-default libqt5webkit5-dev xvfb
# Install some system-wide packages
sudo pip3 install uwsgi twine

echo -e "\nRedis & MongodB stuff"
sudo apt-get install -y redis-server
sudo pip3 install rdbtools python-lzf
if [[ -z "$(grep mongo -R /etc/apt/sources.list.d)" ]]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
    sudo apt-get update
fi
sudo apt-get install -y mongodb-org

# echo -e "\nJava Runtime stuff"
# sudo apt-get install -y default-jre

echo -e "\nDocker stuff"
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates
if [[ -z "$(grep docker /etc/apt/sources.list)" ]]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    sudo apt-get update
fi
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo su -c 'curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose

echo -e "\nYarn stuff"
if [[ -z "$(grep yarn -R /etc/apt/sources.list.d)" ]]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
fi
sudo apt-get install -y yarn

echo -e "\nSpeedtest stuff"
sudo apt-get install -y gnupg1 dirmngr
if [[ -z "$(grep ookla -R /etc/apt/sources.list.d)" ]]; then
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
    echo "deb https://ookla.bintray.com/debian bionic main" | sudo tee /etc/apt/sources.list.d/speedtest.list
    sudo apt-get update
fi
sudo apt-get install -y speedtest

# # See: http://www.postgresql.org/download/linux/ubuntu/
# echo -e "\nPostgreSQL stuff"
# sudo su -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install -y postgresql-9.4 postgresql-server-dev-9.4 postgresql-plpython-9.4 postgresql-contrib-9.4

echo -e "\nVirtualbox stuff"
if [[ -z "$(grep virtualbox -R /etc/apt/sources.list.d)" ]]; then
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    sudo apt-get update
fi
sudo apt-get install -y virtualbox-6.1
sudo usermod -aG vboxusers ${USER}
wget https://download.virtualbox.org/virtualbox/6.1.2/Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack
sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack
rm Oracle_VM_VirtualBox_Extension_Pack-6.1.2.vbox-extpack
