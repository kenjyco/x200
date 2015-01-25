# Required
[mini]: https://help.ubuntu.com/community/Installation/MinimalCD#A64-bit_PC_.28amd64.2C_x86_64.29
[apt-get]: https://help.ubuntu.com/community/AptGet/Howto

Once you complete the [Ubuntu Mini 14.04][mini] installation (from CD), fetch
the `setup.bash` script and run it.

    %

> This will install specific software packages using the [apt-get][] package
> manager and allow you to configure some things along the way. **Make sure you
> have an internet connection!**

# Optional

#### Remove password requirement for using `sudo`

    % sudo visudo

Change

    %sudo   ALL=(ALL:All) ALL

to

    %sudo   ALL=(ALL:All) NOPASSWD:ALL

#### Disable waiting for network connection at boot
Comment out any network interfaces that are not loopback (lo)

    % sudo vim /etc/network/interfaces

#### Disable laptop from sleeping on lid close

    % sudo vim /etc/systemd/logind.conf

Uncomment and modify the following line

    HandleLidSwitch=ignore

Restart `systemd-logind`

    % sudo restart systemd-logind

#### Disable MOTD for console login and SSH login
Edit the `pam.d/login` file

    % sudo vim /etc/pam.d/login

Comment out

    # session    optional   pam_motd.so  motd=/run/motd.dynamic noupdate
    # session    optional   pam_motd.so

Edit the `pam.d/sshd` file

    % sudo vim /etc/pam.d/sshd

Comment out

    # session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate
    # session    optional     pam_motd.so # [1]

#### Make SSH server only authenticate with SSH Keys

    % sudo vim /etc/ssh/sshd_config

Uncomment and modify the following line

    PasswordAuthentication no

Add an "AllowUsers" line with a comma-delimited list of users allowed to SSH in

    AllowUsers ken

Restart the SSH server

    % sudo service ssh restart
