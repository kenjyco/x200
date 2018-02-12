#!/usr/bin/env bash

[[ $(uname) != 'Darwin' ]] && exit 1

if [[ ! -f /usr/local/bin/brew ]]; then
    echo -e "\nInstalling homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || exit 1
fi

echo -e "\nGetting the list of packages already installed with brew"
_installed=$(brew list -1)
_brew_install_or_upgrade() {
    for x in "$@"; do
        echo "checking $x"
        if [[ -z "$(echo -e "$_installed" | grep "$x")" ]]; then
            brew install $x
        else
            brew upgrade $x 2>/dev/null
        fi
    done
}

echo -e "\nUpdating brew"
brew update
echo -e "\nInstalling some tools with homebrew"
_brew_install_or_upgrade coreutils findutils wget python3 colordiff tree ranger typespeed imagemagick
_brew_install_or_upgrade dbus dbus-glib moc libav sox rtmpdump nmap tmux watch ghostscript enscript pandoc lynx
_brew_install_or_upgrade bash bash-completion reattach-to-user-namespace mongodb@3.2 redis@3.2
echo "checking yarn"
if [[ -z "$(echo -e "$_installed" | grep yarn)" ]]; then
    brew install yarn --without-node
else
    brew upgrade yarn --without-node 2>/dev/null
fi
[[ -z "$(echo -e "$_installed" | grep "itermocil")" ]] && brew install TomAnthony/brews/itermocil

if [[ ! -d /Applications/iTerm.app/ ]]; then
    echo -e "\n$ brew cask install iterm2"
    brew cask install iterm2
fi
if [[ ! -d /Applications/MacDown.app/ ]]; then
    echo -e "\n$ brew cask install macdown"
    brew cask install macdown
fi
if [[ ! -d /Applications/Docker.app/ ]]; then
    echo -e "\n$ brew cask install docker"
    brew cask install docker
fi
if [[ ! -d /Applications/Slack.app/ ]]; then
    echo -e "\n$ brew cask install slack"
    brew cask install slack
fi
if [[ ! -d /Applications/VLC.app/ ]]; then
    echo -e "\n$ brew cask install vlc"
    brew cask install vlc
fi
if [[ ! -d "/Applications/Google Chrome.app/" ]]; then
    echo -e "\n$ brew cask install google-chrome"
    brew cask install google-chrome
fi
if [[ ! -d "/Applications/Robo 3T.app/" ]]; then
    echo -e "\n$ brew cask install robo-3t"
    brew cask install robo-3t
fi

if [[ ! -d /data/db ]]; then
    echo -e "\nCreating /data/db for MongoDB"
    sudo mkdir -pv /data/db
    sudo chown `id -u` /data/db
fi

if [[ -z $(brew services list | grep "dbus.*started") ]]; then
    echo -e "\nStarting Dbus service"
    brew services start dbus
fi

if [[ -z $(brew services list | grep "jack.*started") ]]; then
    echo -e "\nStarting jack (audio) service"
    brew services start jack
fi

if [[ -z $(brew services list | grep "mongodb@3.2.*started") ]]; then
    echo -e "\nStarting MongoDB service"
    brew services start mongodb@3.2
fi

if [[ -z $(brew services list | grep "redis@3.2.*started") ]]; then
    echo -e "\nStarting Redis service"
    brew services start redis@3.2
fi

if [[ -z $(grep "/usr/local/bin/bash" /etc/shells) ]]; then
    echo -e "\nAdding new version of bash to /etc/shells (so it's allowed)"
    sudo sh -c "echo '/usr/local/bin/bash' >> /etc/shells"
fi
