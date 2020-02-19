# make unionfs here
mkdir read
mkdir write
mkdir union

# unmount
sh ./unmount.sh

# mount
mkdir read/lib64  # dep for bash
mount --bind /lib64 ./read/lib64
mkdir read/lib  # dep for bash
mount --bind /lib ./read/lib
mkdir read/bin  # where bash lays
mount --bind /bin ./read/bin
mkdir read/sys  # works without rootfs
mount -t sysfs none ./read/sys
mkdir read/proc  # works without rootfs
mount -t proc none ./read/proc
mkdir read/dev
mount --bind /dev/ ./read/dev
mkdir read/dev/pts
mount --bind /dev/pts ./read/dev/pts
mkdir read/etc
touch ./read/etc/resolv.conf  # for apt with rootfs
mount -o bind /etc/resolv.conf ./read/etc/resolv.conf

# with rootfs
unionfs -o cow write=RW:read=RO:/=RO union -o allow_other,dev

# without rootfs
# unionfs -o cow write=RW:read=RO union -o allow_other,dev

# go to jail
chroot union
