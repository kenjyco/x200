# Required
[mini]: https://help.ubuntu.com/community/Installation/MinimalCD#A64-bit_PC_.28amd64.2C_x86_64.29
[apt-get]: https://help.ubuntu.com/community/AptGet/Howto
[dotfiles]: https://github.com/kenjyco/dotfiles

Once you complete the [Ubuntu Mini 14.04][mini] installation (from CD), fetch
the `setup.bash` script and run it.

    % wget -q http://tr.im/mini1404
    % bash ./mini1404

> This will install specific software packages using the [apt-get][] package
> manager and allow you to configure some things along the way. **Make sure you
> have an internet connection!**
>
> Also note that http://tr.im/mini1404 is a shortcut to to
> https://raw.githubusercontent.com/kenjyco/x200/master/sysinstall/mini-14.04/setup.bash.

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

#### Set GRUB boot loader to actually timeout

    % sudo vim /etc/default/grub

Comment out the `GRUB_HIDDEN_TIMEOUT*` lines and set `GRUB_TIMEOUT` to a
reasonable value (like 5)

    # GRUB_HIDDEN_TIMEOUT=0
    # GRUB_HIDDEN_TIMEOUT_QUIET=true
    GRUB_TIMEOUT=5

Update grub

    % sudo update-grub

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
