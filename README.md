# maboland

This is my full Hyprland setup that is heavily inspired from typecraft-dev.

However, it has since grown a lot and has been modified and customized with a plethora of features.

# Included Components

- Hyprland including a lot of Hyprland's ecosystem such as Hyprlock, Hyprshot, Hypridle, Hyprpaper and Hyprpolkitagent.

- Waybar as the status bar customized with widgets for Bluetooth control and information, Network control and information, audio controls, battery & power-mode control & information, date, time and calendar information, notification integration with Swaync.

- Kitty Terminal as the default terminal.

- Swaync as the main notification center with a minimal control-center layout for power, brightness, volume and media-player control.

- Yazi as the main file explorer with a few plugins to enhance the experience.

- Neovim as the default file editor with a full config that includes Lazyvim as the default plugin manager, auto-saving, auto-formatting, LSPs and more.

- Starship for a customized prompt.

- Fuzzel as the main application launcher.

# Installation

There is an included installer bash script that fully installs the whole setup in a couple of minutes.
The installer can be found under `Binaries/.local/bin/installer`.

The first time you run it, you will need to use the full path, but after the first run it will be in your $PATH, so you can call it directly.

The script expects 1 argument, which is the path that has the dotfiles you downloaded. This is usually the directory you cloned the repository to. Here is an example:

```bash
$ git clone https://github.com/mabourehab/maboland ~/
$ ~/maboland/Binaries/.local/bin/installer ~/maboland
```

There are a few prerequisites to get the installer to work:

- For now the installer works only for Fedora 40 & up. It may work with anything that uses dnf as its package manager, but availability of the packages cannot be guaranteed.
- The installer for now sets up the environment for Bash, if you use something else like zsh, then you may have missing functionality. Therefore, the installer expects a .bashrc file in your home directory and also a .bashrc.d/ directory. If .bashrc.d is not available, then you will need to create it and add its sourcing to your bashrc file.
- There will be installations for several packages, so you will be prompted for your sudo password throughout the installer to continue the installation.
- The first time you run the installer, you will get a disclaimer of what it does. Please read it carefully and then run it again to begin the actual installation.

# Updates

It is not necessary to run the installer anytime you pull a new version of the dotfiles. However, it is highly recommended to do so.

Some packages will be updated just from running the installer, but for everything else then a regular update with dnf will be enough.

# Customization

A README file will be available in most directories of the various components in the dotfiles to help you customize to your liking and also let you know what are the settings currently in place.

More explanation will be in the README for each component, but here is a quick overview:

- Hyprland theme can be changed in `~/.config/hypr/hyprland.conf`
- Lockscreen theme can be changed in `~/.config/hypr/hyprlock.conf`
- Wallpaper can be changed in `~/.config/hypr/hyprpaper.conf`
- Kitty theme can be changed in `~/.config/kitty/kitty.conf`
- GTK themes and cursors can be changed with the "GTK Settings" application and by editing `~/.config/gtk-3.0/settings.ini`
- Yazi theme can be changed in `.config/yazi/theme.toml`
- Starship customization can be done by editing `~/.config/starship.toml`
- Neovim colorscheme can be changed in `~/.config/neovim/init.lua`
- Fuzzel theme can be changed in `~/.config/fuzzel/fuzzel.ini`
- Waybar can be customized with the `~/.config/waybar/style.css` file
- Swaync can be customized with the `~/.config/swaync/style.css` file
