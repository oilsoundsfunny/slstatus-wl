# slstatus-wl - suckless status (for wayland)
A slight fork of the [slstatus](https://tools.suckless.org/slstatus/) tool that
strips out any dependency on X11 headers and libs. Combining this with dwl
helps you push towards a suckless + X11-free system.

The default behavior of slstatus-wl matches slstatus with the `-s` flag, and
the original default behavior that used the X Server is gone without
replacement. The default and only transport method is stdio, `-s` is a no-op to
make this a drop-in replacement.

**NOTE**: Due to the fundamental differences between the X and Wayland models,
the `keyboard-indicators` and `keymap` modules have been entirely omitted for
simplicity's sake. These modules relied on how easy it was to access global
input state through the X server. Wayland does not have these facilities.
Equivalent modules would require either a compositor-aware solution, or
privileged access to reading input at the kernel level.

Other than the changes above, the source code is identical to the latest
version of slstatus.

To use slstatus-wl with [dwl](https://codeberg.org/dwl/dwl) + the dwl [bar
patch](https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/bar), you
can pipe it in:
```bash
slstatus | dwl
```
A more complete example would look like:
```bash
dbus-run-session sh -c 'slstatus -s | exec dwl -s "$HOME/.config/dwl-init.sh"'
```

The following is adapted from the original README.

---

slstatus is a small tool for providing system status information to other
programs. It is designed to be as efficient as possible by only issuing the
minimum of system calls required.


Features
--------
- Battery percentage/state/time left
- Cat (read file)
- CPU usage
- CPU frequency
- Custom shell commands
- Date and time
- Disk status (free storage, percentage, total storage and used storage)
- Available entropy
- Username/GID/UID
- Hostname
- IP address (IPv4 and IPv6), interface status
- Kernel version
- Load average
- Network speeds (RX and TX)
- Number of files in a directory (hint: Maildir)
- Memory status (free memory, percentage, total memory and used memory)
- Swap status (free swap, percentage, total swap and used swap)
- Temperature
- Uptime
- Volume percentage
- WiFi signal percentage and ESSID


Requirements
------------
Currently slstatus works on FreeBSD, Linux and OpenBSD.

- For volume percentage on Linux the kernel module `snd-mixer-oss` must be
  loaded.
- For volume percentage on FreeBSD, `sndio` must be installed.


Installation
------------
Edit config.mk to match your local setup (slstatus is installed into the
/usr/local namespace by default).

Afterwards enter the following command to build and install slstatus (if
necessary as root):

    make clean install


Running slstatus
----------------
See the man page for details.


Configuration
-------------
slstatus can be customized by creating a custom config.h and (re)compiling the
source code. This keeps it fast, secure and simple.
