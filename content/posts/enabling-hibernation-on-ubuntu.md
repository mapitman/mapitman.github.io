---
title: "Enabling Hibernation on Ubuntu"
author: "Mark Pitman"
type: ""
date: 2020-01-19T19:37:16-08:00
subtitle: ""
image: ""
tags: ["linux","hibernate","power"]
---

The default install of Ubuntu (in my case 19.10, but it's been the same for all the releases I've ever installed), doesn't support hibernation. Most laptops I've had support hibernation on Ubuntu. I wish Canonical would make it an option during install.

So, the first thing I did was install Ubuntu and I selected the option to encrypt the entire drive. This has the side-effect of using LVM (Logical Volume Manager) on the disk.

After installing, I booted with the Ubuntu USB drive and opened the _Disks_ application and decrypted the drive. Then I opened a terminal and resized the root and swap partitions. I reduced the root partition by the amount of memory my
laptop has and increased the swap partion by the same amount. 

```sh
lvresize -r --size -8GB /dev/vgubuntu/root
lvresize --size +8GB /dev/vgubuntu/swap_1
```

After booting into my installed version of Ubuntu, I edited `/etc/default/grub` and added `resume=/dev/vgubuntu/swap_1 ` to the line shown below:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=/dev/vgubuntu/swap_1" 
```

Afterward, I ran this command to update grub:

```sh
sudo update-grub
```

The next thing I did was edit `/etc/systemd/sleep.conf`. There are a number of
commented lines, and the values are what is compiled in as defaults. I changed
the following line:

```
HibernateDelaySec=1800
```

That sets the system up to hibernate 30 minutes (1800 seconds) after the system
goes to sleep.

The final file that needed to be changed was `/etc/systemd/logind.conf`

```
HandleLidSwitch=suspend-then-hibernate
HandleLidSwitchExternalPower=suspend-then-hibernate
```

That allows the system to enter hibernation after sleeping for the configured
amount of time. The setting will take effect after a reboot or you can run the
following command. Be aware, you will be immediately logged out when you run it!

```sh
sudo systemctl restart systemd-logind.service
```

After all this, I'm able to shut my laptop, put it in my bag and not worry
about my battery being dead when I don't use it again for a few days!
 
