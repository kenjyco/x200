#!/usr/bin/env bash

# Quit this script if unable to update the package list
echo -e "\nsudo apt-get update"
sudo apt-get update || exit 1

# Autoremove any package that "was automatically installed and is no longer required"
echo -e "\nAutoremove.."
sudo apt autoremove -y

# Install software packages
echo -e "\nsudo apt-get install -y ..."

echo -e "\nAudio tools"
sudo apt-get install -y ffmpeg sox libsox-fmt-mp3 rtmpdump

echo -e "\nFile-system tools"
sudo apt-get install -y exfat-fuse exfat-utils cryptsetup

echo -e "\nCommand-line tools"
sudo apt-get install -y vim git git-flow zsh tmux curl pmount acpi colordiff htop tree ranger moc moc-ffmpeg-plugin sysvbanner lolcat ncdu
sudo apt-get install -y openssh-server imagemagick wodim dvd+rw-tools syslinux syslinux-utils nmap mtools net-tools
sudo apt-get install -y gtypist typespeed cmatrix elinks enscript vlock termsaver bsdgames
sudo apt-get install -y pandoc lynx cmus cmus-plugin-ffmpeg sqlite3
sudo apt-get install -y ack-grep
sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
sudo apt-get install -y xclip xbindkeys wmctrl dkms awesome

echo -e "\nGUI tools"
sudo apt-get install -y rxvt-unicode-256color feh scrot emelfm2 gparted w3m w3m-img gifsicle
sudo apt-get install -y recordmydesktop guvcview vlc audacity inkscape gimp
sudo apt-get install -y fonts-inconsolata
sudo apt-get install -y libreoffice wine-stable
sudo apt-get install -y evince okular retext
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
sudo apt-get install -y default-jre

echo -e "\nDocker stuff"
sudo apt-get install -y software-properties-common apt-transport-https ca-certificates
if [[ -z "$(grep docker /etc/apt/sources.list)" ]]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
    if [[ $? -ne 0 ]]; then
        sudo add-apt-repository "deb https://download.docker.com/linux/ubuntu bionic stable"
    fi
    sudo apt-get update
fi
sudo apt-get install -y docker-ce
sudo usermod -aG docker ${USER}
sudo su -c 'curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
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
