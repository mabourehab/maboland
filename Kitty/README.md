# Documentation

It is recommended to read through the official documentation to know all the features available and default keybinds:
https://sw.kovidgoyal.net/kitty/

# Appearance

The easiest way to change the font and the theme for kitty is with the following two commands:

```bash
$ kitten choose-fonts
$ kitten themes
```

It will automatically add your choices permanently to `~/.config/kitty/kitty.conf` and `~/config/kitty/current-theme.conf`

# Keybinds

Most Kitty keybinds revolve around the Ctrl + Shift modifiers.

Custom keybinds I have in place:

```
Ctrl + t -> New tab
Ctrl + Shift + t -> Rename tab
Ctrl + Shift + [ -> Previous tab
Ctrl + Shift + ] -> Next tab
Ctrl + Shift + Tab -> Next tab

Ctrl + Shift + s -> Vertical split in current working directory
Ctrl + Shift + h -> Horizontal split in current working directory
Ctrl + Shift + <arrows> -> Move between windows

Ctrl + <arrows> -> Resize windows
Ctrl + Shift + r -> Reset window sizes
```

# Features

The `kitten ssh ` module has been aliased to replace `/usr/bin/ssh `
The "kitten clipboard " module has been aliased to "kc" to allow you to copy command outputs to clipboard easier.
