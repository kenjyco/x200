Beginner's Guide
================

Remember, when issuing a command at the prompt, press the `Enter` key after
typing the command!

#### Logging in and starting the GUI (window manager)
[0]: http://awesome.naquadah.org/doc/manpages/awesome.1.html
[1]: http://en.wikipedia.org/wiki/Graphical_user_interface
[2]: http://en.wikipedia.org/wiki/Rxvt-unicode
[3]: https://github.com/kenjyco/dotfiles/blob/master/x/xinitrc#L1

- Turn the computer on
    - press the tiny round button (with a white dot in middle of it) at the top of the keyboard
- Type your **username** at the login prompt and hit `Enter`
- Type your **password** on the next line and hit `Enter`
- Issue the `startx` command at the shell prompt to start the [GUI][1]

> Note: The [awesome window manager][0], which gets launched when you `startx`
> (see [~/.xinitrc][3]) has many keyboard shortcuts. The key between the `Ctrl`
> and `Alt` keys on the bottom row is known as the **`Super`** key (or `Mod4`
> in the docs).
>
> The `Super` key is often used in awesome's keyboard combos.

![special-keys](super.png)

#### Opening new urxvt tabs and windows
[18]: https://github.com/kenjyco/dotfiles/blob/master/shell/common.d/urxvt.sh
[19]: https://github.com/kenjyco/dotfiles/blob/master/x/Xdefaults#L2

- Press `Super` + `Enter` to open a new (small) urxvt window
    - Use the `cd <dirname>` command or `cdd <dirname>` alias to move to the
      directory you want to work in
    - Use any of the urxvt aliases defined in [~/.shell/common.d/urxvt.sh][18]
      to open a new urxvt window of the desired size (`tall-wide`, `tall`,
      `skinny`, or `long`)
- When in an active urxvt terminal window
    - Press `Shift` + `Down` to create a new tab
    - Press `Shift` + `Right` or `Shift` + `Left` to move between open tabs

> The default size for a new urxvt window can be set in the [~/.Xdefaults][19]
> file.
>
> When the `urxvt` command is called from a directory other than your `$HOME`
> directory, each new tab we open for that window will start in that directory.
> This is very useful when working on a project (where everything is contained
> in a specific directory).

#### Connecting to wifi

- Issue the `wicd-curses` command at the shell prompt
- Press `Shift` + `r` to refresh the list of wireless networks (if you don't see
  your network)
- Use the down arrow to move to your wireless network, then press the right
  arrow to configure it
    - Use the down arrow to move to the checkbox for "Automatically connect to
      this network" and hit the `Space` key to check the box (if you want to)
    - Use the down arrow to move to the "Key" field and enter the password for
      your wireless network, then hit `F10` to save
- Press `Enter` to connect to your network
- Press `q` to quit, once connected to the network

#### Starting a web browser
[4]: http://en.wikipedia.org/wiki/Chromium_(web_browser)
[5]: http://en.wikipedia.org/wiki/Firefox
[6]: https://github.com/kenjyco/x200/blob/master/sysinstall/mini-14.04/setup.bash#L38
[7]: https://chrome.google.com/webstore/detail/adblock/gighmmpiobklfepjocnamgkkbiglidom
[8]: https://addons.mozilla.org/En-us/firefox/addon/adblock-plus/

- **Chromium**
    - Issue the `chromium-browser` command at the shell prompt
- **Firefox**
    - Issue the `firefox` command at the shell prompt

GUI programs like these **can also be started** from the **run prompt**, which
appears at the top of your screen when you use `Super` + `r`.

> Note: The web browsers [Chromium][4] and [Firefox][5] were installed when your
> X200 was setup. See the [setup.bash][6] script.
>
> Also, if this is your first time starting either web browser, you will
> probably want to install the **AdBlock** extension/plugin ([for Chromium][7],
> [for Firefox][8]).

#### Switching between windows in a workspace

- Use `Super` + `Tab` toggle between the current window and the most recently
  active window
- Use `Super` + `k` or `Super` + `j` to rotate between all open windows

#### Mounting a USB stick
[9]: http://en.wikipedia.org/wiki/USB_flash_drive
[10]: https://github.com/kenjyco/dotfiles/blob/master/shell/common.d/lsblk.sh#L1
[11]: http://manpages.courier-mta.org/htmlman8/lsblk.8.html
[12]: http://linux.die.net/man/1/pmount
[13]: http://www.linfo.org/mount_point.html

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
- Use the `cd` command to move to the directory where your USB stick is mounted

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

#### Adjusting the volume
[23]: http://en.wikipedia.org/wiki/Alsamixer

- Use the [alsamixer][23] command to open the audio mixer
    - Use the right and left arrow keys to move to "Master" or "PCM"
    - Use the up and down arrow keys to adjust the levels
    - Use the `m` key to toggle between "mute" and "unmute"
    - Use `Esc` to quit

#### Using the console audio player
[24]: http://moc.daper.net/about

- Use the [mocp][24] command to start the console audio player (use the `-m`
  option to specify a start directory)

    ```
    % mocp -m .
    ```

    or

    ```
    % mocp -m /music
    ```
- Use the up and down arrow keys to the audio file you want to play and press
  `Enter` to start playing the file
    - If the selection is a directory, the `Enter` key will take you inside the
      directory
- Use the `Space` key to toggle "pause" and "play"
- Use `n` to start playing the next audio file
- Use `a` to add an audio file to the playlist (or all files if the current
  selection is a directory)
- Use `Tab` to toggle between the filesystem (on the left) and the playlist (on
  the right)
    - In the playlist, use `d` to remove items from the playlist
- Use `q` to close the console player (continuing to play audio in the
  background)
- Use `Shift` + `q` to completely quit the console player

#### Viewing photos
[25]: http://feh.finalrewind.org/
[26]: https://github.com/kenjyco/dotfiles/blob/master/shell/common.d/feh.sh

- Use the [feh][25] command to view an image or a directory of images

    ```
    % feh some_image.jpg
    ```

    or

    ```
    % feh some_image_01.jpg some_image_02.png
    ```

    or

    ```
    % feh some_image_dir/
    ```
- Use the right and left arrow keys to move between images (if you opened
  multiple)
- Press `q` to quit

> Also see the aliases `fehf` and `fehfd` in [~/.shell/common.d/feh.sh][26].

#### Watching videos
[27]: https://wiki.videolan.org/Documentation:Command_line/

- Use the [vlc][27] command to play video files
    - `f` to toggle fullscreen
    - `Space` to toggle play/pause
    - `Ctrl` + `Up` and `Ctrl` + `Down` to adjust volume
    - `[` to slow playback
    - `]` to speed up playback
    - `=` to playback at normal speed
    - `Ctrl` + `Right` and `Ctrl` + `Left`  to skip ahead or behind 1 minute
    - `Alt` + `Right` and `Alt` + `Left`  to skip ahead or behind 10 seconds
    - `Shift` + `Right` and `Shift` + `Left`  to skip ahead or behind 3 seconds
    - `Ctrl` + `l` (lowercase L) to toggle playlist
    - `Ctrl` + `q` to quit

#### Using ranger file manager
[28]: http://ranger.nongnu.org/
[29]: https://github.com/kenjyco/dotfiles/blob/master/ranger/rc.conf

- Use the [ranger][28] command to quickly navigate your directory hierarchy
  using Vim keybindings

> See [~/.config/ranger/rc.conf][29] for settings.

#### Wildcard patterns
[30]: http://www.linfo.org/wildcard.html

- Use [wildcard patterns][30] to pass in all files/directories that match the
  pattern to a command
