#!/usr/bin/env bash

if [[ ! -f /usr/local/bin/brew ]]; then
    echo -e "\nInstalling homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || exit 1
fi

echo -e "\nInstalling some tools with homebrew"
brew update
brew cask install macdown xquartz
brew install coreutils findutils wget python3 colordiff tree ranger typespeed imagemagick
brew install dbus dbus-glib moc libav sox rtmpdump nmap tmux wmctrl enscript
brew install bash bash-completion reattach-to-user-namespace
brew install TomAnthony/brews/itermocil
brew tap homebrew/versions
brew install mongodb@3.2 redis@3.2

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
