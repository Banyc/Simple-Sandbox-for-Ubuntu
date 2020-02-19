# Simple Sandbox on Ubuntu

Using Unionfs + chroot.

`/` of the system as the read-only layer

`write` as the read-write layer

It seems to work with `apt`.

No security guarantee

## Usage

First create a working folder and put the files into the folder

> Run `sudo apt install unionfs-fuse` if command `unionfs` is not found

### Deploy

Run `sudo sh make_jail.sh`

### Exit the jail

run `exit`

### Un-mount the file system

run `sudo sh unmount.sh`
