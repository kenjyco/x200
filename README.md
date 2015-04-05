Scripting for Regular People
=======================

#### Introduction

You don't need to be a programmer or a techie to use a command-driven computer
system, but you should be comfortable using a keyboard to type letters, numbers,
and some special symbols.

#### Keyboard Shortcuts 

We will be making heavy use of "keyboard shortcuts", for efficiency and
convenience.

Most of the keyboard shortcuts involve pressing two keys at once, but some
involve pressing three keys at once.

Here are some actual keyboard combo sequences:

- `Ctrl` +
    - `Ctrl` + `c`
    - `Ctrl` + `d`
    - `Ctrl` + `b`
    - `Ctrl` + `w`
    - `Ctrl` + `u`
    - `Ctrl` + `Alt` +
        - `Ctrl` + `Alt` + `F2`
        - `Ctrl` + `Alt` + `F7`
        - `Ctrl` + `Alt` + `Del`
- `Alt` + `d`
- `Super` +
    - `Super` + `1`
    - `Super` + `Tab`
    - `Super` + `k`
    - `Super` + `r`
    - `Super` + `Enter`
    - `Super` + `m`
    - `Super` + `n`
    - `Super` + `Shift` + `2`
- `Fn` +
    - `Fn` + `F12`
- `Shift` +
    - `Shift` + `Insert`

> Note: `Super` is the key between`Ctrl` and `Alt`. Its also referred to in some
> contexts as the `Mod4` key.

#### Vim navigation 

When you learned how to touch type, the first lesson was probably about the
"home row" keys. Your left fingers rest on `a`, `s`, `d`, `f` and your right
fingers rest on `j`, `k`, `l`, `:/;`.

With the text editor `vim`,  there is an "insert mode" (where the keys you type
become characters in your file) and a "command mode" (where the keys you type
are commands).

Vim takes advantage of the fact that your fingers rest on the home row by
letting you use the `h`, `j`, `k`, `l` keys for moving around in a file (when in
command mode).

- `h` move cursor left
- `j` move cursor down
- `k` move cursor up
- `l` move cursor right

This is a very efficient way to move around. Many people that use vim regularly
will set "vim key bindings" in other programs (whenever it is an option),
including the shell prompt of the terminal.

> Note: For now, we will only be using vim bindings to navigate our command
> history. We will get into using the actual vim editor later.

#### Shell prompt

[zsh]: http://zsh.sourceforge.net/Doc/Release/zsh.html
[bash]: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html

The shell prompt is where you type commands to the system. There are several
different shells available, but we will primarily be using [zsh][] and
[bash][].

When you finish typing a command, press the `Enter` key to execute it.

Often, you will need to modify your previous command. Luckily, the command
history is saved and can be navigated/edited with our vim bindings. When you
press the `Esc` key (top-left area of keyboard), you switch to the vim command
mode.

- press `k` to scroll up to previous commands
- once you are on the command you want to edit, you can
    - use `h` to move the cursor left on the line 
    - use `l` to move the cursor right on the line
- once the cursor is where you want it, you can
    - use `i` to start adding text before the cursor
    - use `a` to start adding text after the cursor

> Note: This may seem a bit strange right now, but there are MANY more thing we
> can do while using Vim's command mode. We will get to that stuff later.

#### The Window Manager

For this computer system, we will be using a keyboard-friendly tiling window
manager called [awesome](https://awesome.naquadah.org/wiki/My_first_awesome).

To start the window manager issue the `startx` command.

You will notice that there are no "desktop icons" to double-click on.

The expectation is that you will be typing commands at the shell prompt in your
terminal window to do most things. This includes launching GUI programs like
your web browser (`chromium-browser` or `firefox`), photo editor (`gimp`), audio
editor (`audacity`), and other things.

To open a new `urxvt` terminal window, use `Super` + `Enter`.

> Note: Many of the shortcuts for awesome involve the `Super` key.

#### X200

A customized Lenovo X200 laptop will be used for this "course." It is a quality
business laptop from 2008 that is very easy to obtain via eBay for a low price.
The best deals can be found for laptops sold in bulk ("lots" of 3-5 or more)
that do not come with hard drives or batteries.  Your instructor/mentor/tutor
should supply you with a laptop that is all set to use.

> Note: The installation of hardware and operating system will not be covered
> here, but the process is relatively straightforward. See
> [kenjyco/x200](https://github.com/kenjyco/x200/tree/master/sysinstall/mini-14.04)
> and [kenjyco/dotfiles](https://github.com/kenjyco/dotfiles) if you are setting
> up your own X200(s) from scratch.

#### The X200 Keyboard

![x200-keyboard](keyboard.jpg)

You will notice that some keys on the keyboard have multiple symbols/characters
on them. 

For keys that have two symbols (one on top of the other), you need to press one
of the `Shift` keys at the same time to trigger the key press for the symbol on
top. The bottom symbol is the default, so no need to press `Shift`.

For keys that have blue symbols, you need to press the blue `Fn` key (lower left
area of the keyboard) at the same time to trigger that key's action. For
example, it is common to use `Fn` + `F12` to quickly "hibernate" the laptop (so
the battery does not drain).
