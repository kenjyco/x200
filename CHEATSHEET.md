Cheat Sheet
===========
Remember, when issuing a command at the prompt, press the `Enter` key after
typing the command!

#### Starting the GUI
[1]: http://en.wikipedia.org/wiki/Graphical_user_interface
[2]: http://en.wikipedia.org/wiki/Rxvt-unicode
[3]: https://github.com/kenjyco/dotfiles/blob/master/x/xinitrc#L1

- Turn the computer on
    - press the tiny round button (with a white dot in middle of it) at the top of the keyboard
- Type your **username** at the login prompt and hit `Enter`
- Type your **password** on the next line and hit `Enter`
- Issue the `startx` command at the shell prompt to start the [GUI][1]

> Note: When the GUI is started, a tabbed [urxvt][2] terminal window is
> automatically launched for your convenience, in workspace 1. See the
> [~/.xinitrc][3] file.

#### Starting a web browser
[4]: http://en.wikipedia.org/wiki/Chromium_(web_browser)
[5]: http://en.wikipedia.org/wiki/Firefox
[6]: https://github.com/kenjyco/x200/blob/master/sysinstall/mini-14.04/setup.bash#L34
[7]: https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom
[8]: https://addons.mozilla.org/En-us/firefox/addon/adblock-plus/

- **Chromium**
    - Issue the `chromium-browser` command at the shell prompt
- **Firefox**
    - Issue the `firefox` command at the shell prompt

> Note: The web browsers [Chromium][4] and [Firefox][5] were installed when your
> X200 was setup. See the [setup.bash][6] script.
>
> Also, if this is your first time starting either web browser, you will
> probably want to install the **AdBlock** extension/plugin ([for Chromium][7],
> [for Firefox][8]).

#### Mounting a USB stick
[9]: http://en.wikipedia.org/wiki/USB_flash_drive
[10]: https://github.com/kenjyco/dotfiles/blob/master/shell/common.d/lsblk.sh#L1
[11]: http://manpages.courier-mta.org/htmlman8/lsblk.8.html
[12]: http://linux.die.net/man/1/pmount
[13]: http://www.linfo.org/mount_point.html
[14]: http://www.linfo.org/cd.html

- Insert a [USB stick][9] into a USB port on the laptop
- Use the `partitions` shortuct to list the storage devices (which calls the
  [lsblk][11] command)

    ```
    % partitions
    - sda1   1.9G part [SWAP]
    - sdb1   1.9G part 
    - sda2  35.4G part /
    ```
- Use the [pmount][12] command to mount your device (which in this example is
  `/dev/sdb1`) to a particular [mountpoint][13] (to `/media/silver`)

    ```
    % pmount /dev/sdb1 silver
    ```
- Use the `partitions` shortcut to verify that your USB stick was mounted to the
  place you specified

    ```
    % partitions
    - sda1   1.9G part [SWAP]
    - sdb1   1.9G part /media/silver
    - sda2  35.4G part /
    ```
- Use the [cd][14] command to move to the directory where your USB stick is
  mounted

    ```
    % cd /media/silver
    ```

> Note: The `pmount` command mounts a filesystem to a named directory in
> `/media`. You need to mount the filesystem in order to access the files on the
> filesystem.
>
> Also the device name (usually starting with `sdX`) is the name of the device
> in `/dev`. You need to specify the full path the the device when mounting it,
> which is why we used `/dev/sdb1` in the example.

#### Unmounting a USB stick
[15]: http://manpages.ubuntu.com/manpages/lucid/man1/pumount.1.html

- Use the `cd` command to move to your `$HOME` directory

    ```
    % cd
    ```
- Use the [pumount][15] command to unmount your USB stick

    ```
    % pumount silver
    ```
- Use the `partitions` shortcut to verify that your USB stick is no longer
  mounted

    ```
    % partitions
    - sda1   1.9G part [SWAP]
    - sdb1   1.9G part 
    - sda2  35.4G part /
    ```
- Remove the USB stick from the laptop

> Note: You cannot unmount a filesystem if you are in the directory where it is
> mounted, or if you are using a file that is on that filesystem. (You will see
> an message that says "device is busy"). That is why we move to our `$HOME`
> directory before unmounting.

#### Navigating the filesystem
(TODO)
