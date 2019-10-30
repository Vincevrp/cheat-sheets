---
title: 'Arch Linux Installation'
abstract: "Reference guide for my Arch Linux installation. The goal of this document is to have a quick reference for when reinstalling or troubleshooting my installation."
---

# Dell XPS 9550 Installation

## Initial

```
loadkeys be-latin1

# Check if you're booted in UEFI mode
ls /sys/firmware/efi/efivars

# Connect to wifi and test connection
wifimenu
ping archlinux.org

# Set the time
timedatectl set-ntp true
timedatectl set-timezone "Europe/Brussels"
```

## Partitioning

```
cfdisk /dev/nvme0n1
mkfs.fat /dev/nvme0n1p1
cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup open --type luks /dev/nvme0n1p2 rootpart
ls /dev/mapper
mkfs.ext4 /dev/mapper/rootpart
```

## Mounting

```
mount /dev/mapper/rootpart /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
pacstrap /mnt base base-devel linux linux-firmware vim git zsh dialog wpa_supplicant
```

## Genfstab and chroot

```
genfstab -Up /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

## System configuration

```
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
hwclock --systohc --utc
vim /etc/locale.gen # Uncomment locale in this file
locale-gen
echo "KEYMAP=be-latin1" >> /etc/vconsole.conf
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
echo "xps" > /etc/hostname
```

## Initramfs

Edit hooks in `/etc/mkinitcpio.conf` to:

```
MODULES(ahci sd_mod ext4)
BINARIES=(fsck fsck.ext4)
HOOKS=(base systemd keyboard sd-vconsole sd-encrypt)
mkinitcpio -p linux
```

## Bootloader

```
bootctl --path=/boot/ install
```

In `/boot/loader/loader.conf:`

```
default arch
timeout 3
```

In `/boot/loader/entries/arch.conf:`

```
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img
options luks.name=___UUID_HERE___=cryptroot root=/dev/mapper/cryptroot nvme_core.default_ps_max_latency_us=5500 quiet rw
```

The nvme parameter is related to the following issue: `https://wiki.archlinux.org/index.php/Solid_State_Drive/NVMe#Samsung_drive_errors_on_Linux_4.10`

## Post-installation

```
useradd -m -G wheel vince
```

Add the following to `/etc/sudoers`:

```
%wheel  ALL=(ALL) ALL
```

Install [yay](https://github.com/Jguer/yay)

```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Enable colors in Pacman

```
sed 's/#Color/Color/g' /etc/pacman.conf > /etc/pacman.conf
```

Dotfiles

```
yay -S vim-plug
git clone --bare <git-repo-url> $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```
