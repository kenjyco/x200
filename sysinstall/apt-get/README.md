# Required
[mini]: https://help.ubuntu.com/community/Installation/MinimalCD
[apt-get]: https://help.ubuntu.com/community/AptGet/Howto
[dotfiles]: https://github.com/kenjyco/dotfiles

Once you complete the [Ubuntu Mini 16.04][mini] installation (from CD), fetch
the `mini-16.04.bash` script and run it.

    % wget -q https://raw.githubusercontent.com/kenjyco/x200/master/sysinstall/apt-get/mini-16.04.bash
    % bash ./mini-16.04.bash

> This will install specific software packages using the [apt-get][] package
> manager and allow you to configure some things along the way. **Make sure you
> have an internet connection!**

# Optional

#### Clone [dotfiles][], run setup, and set default shell to zsh

    % git clone https://github.com/kenjyco/dotfiles && bash ./dotfiles/setup.bash
    % chsh -s $(which zsh)

#### Remove password requirement for using `sudo`

    % sudo visudo

Change

    %sudo   ALL=(ALL:All) ALL

to

    %sudo   ALL=(ALL:All) NOPASSWD:ALL

#### Disable waiting for network connection at boot

Comment out any network interfaces that are not loopback (lo)

    % sudo vim /etc/network/interfaces

#### Modify systemd settings

> Disable laptop from sleeping on lid close and prevent tmux from getting killed
> on logout.

    % sudo vim /etc/systemd/logind.conf

Uncomment and modify the following lines

    KillUserProcesses=no
    HandleLidSwitch=ignore

Restart `systemd-logind`

    % sudo systemctl restart systemd-logind

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

Add an "AllowUsers" line with a space-delimited list of users allowed to SSH in

    AllowUsers ken git

> Note: Each user in the `AllowUsers` line will need to have at least one public
> SSH key in the user's `~/.ssh/authorized_keys` file.
>
> Key pairs can be generated with **`ssh-keygen -C "short comment"`**

Restart the SSH server

    % sudo service ssh restart

#### Set GRUB boot loader to actually timeout

    % sudo vim /etc/default/grub

Comment out the `GRUB_HIDDEN_TIMEOUT*` lines and set `GRUB_TIMEOUT` to a
reasonable value (like 5)

    # GRUB_HIDDEN_TIMEOUT=0
    # GRUB_HIDDEN_TIMEOUT_QUIET=true
    GRUB_TIMEOUT=5

Update grub

    % sudo update-grub

#### Allow auto-mounting USB devices by label

> See: http://www.axllent.org/docs/view/auto-mounting-usb-storage/
>
> Mounts as root in read-only mode.

#### Setup MongoDB

Create an admin user (to administer other users and privleges)

    % mongo
    ...
    > use admin
    > db.addUser({user: "admin", pwd: "some.password", roles: ["userAdminAnyDatabase"]})
    > exit

Edit the default MongoDB config file

    % sudo vim /etc/mongodb.conf

Uncomment the 'auth' line to turn on authentication

    auth = true

Restart MongoDB

    % sudo service mongodb restart

#### Setup PostgreSQL

[psql 9.4]: http://www.postgresql.org/docs/9.4/static/app-psql.html
[psycopg2]: http://initd.org/psycopg/
[SQLAlchemy]: http://www.sqlalchemy.org/

Start [psql 9.4][]  as the `postgres` system user

    % sudo -u postgres psql

> Note: `psql` is the way to interact with PostgreSQL databases on the command
> line when you're not interacting with it through your programming language
> via an adapter (like [psycopg2][] for Python) or Object Relational Mapper
> (like [SQLAlchemy][]).
