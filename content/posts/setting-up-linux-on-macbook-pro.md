+++
date = "2015-09-08T22:35:08-07:00"
draft = false
title = "Setting Up Linux on a MacBook Pro"
image="./images/logobig.jpg"
+++

_*Updated Sep 15, 2015_  
  
I have been using OS X for about a year and a half now. When I bought my MacBook, I was switching from Windows because I wasn't really happy with Windows 8 and I have always used some sort of Linux or BSD off and on in the past. I figured if I really missed it, I could always switch back to Windows or at least dual boot. I had Windows installed through BootCamp and also running in Parallels, but I found I was not using it much. In fact, I was not really using any apps that were specific to OS X either so I decided I'd try running Linux full time. I've been a .NET developer for quite a while, so leaving Windows behind was always difficult. I've broken out of just doing .NET development lately and doing some Javascript (Node), Golang and Python programming which makes me feel more at ease that I'll be able to write some code on Linux.

Let's get started!

## Linux Mint 17.2
I chose [Linux Mint](http://linuxmint.com) 17.2 with the Cinnamon Desktop after using numerous Ubuntu releases and derivatives. I've used lots of other distros, but I've become most comfortable with Ubuntu over the last few years. I like Mint because the desktop environment is lightweight.

## Make some space
I decided to keep OS X and run it along side Linux. I used the OS X Disk Utility to resize the OS X partition. I had to [turn off local backups](http://www.howtogeek.com/212207/how-to-free-up-space-used-by-time-machines-local-backups-on-your-mac/) in order to make enough space first though:
```
sudo tmutil disablelocal
```

## Install
There is a [good howto](http://community.linuxmint.com/tutorial/view/1643) on the Linux Mint Community site for installing on a Mac. Follow it to the end, then come back here for some more configuration.

## Updating the kernel to enable suspend
Linux Mint 17.2 ships with a 3.13 kernel, which does not support some power management features on the Mac. You can see what kernel versions are available on the [Ubuntu "Vivid" Packages page](http://packages.ubuntu.com/vivid/kernel/). At the time of this writing, the best option for upgrading is 3.19. Enter the following in a shell:
```
sudo apt-get install linux-image-3.19.0-28-generic
sudo apt-get install linux-headers-3.19.0-28-generic
sudo apt-get install linux-image-extra-3.19.0-28-generic
```

The kernel won't be active until you reboot.

## Trackpad Configuration
I used some tips from this [page about installing Ubuntu 14.04 on a MacBook Pro](https://medium.com/@PhilPlckthun/ubuntu-14-10-running-on-my-macbook-18991a697ae0) for the next few sections.

Install the mtrack driver for the MacBook and remove the Synaptics driver.
```
sudo apt-get install xserver-xorg-input-mtrack
sudo apt-get autoremove xserver-xorg-input-synaptics
sudo rm /usr/share/X11/xorg.conf.d/50-synaptics.conf
```

Create or edit the xorg.conf file using your favorite text editor (mine is vi)
```
sudo vi /etc/X11/xorg.conf
```
Paste this into the file:
```
Section "InputClass"
 MatchIsTouchpad "on"
 Identifier "Touchpads"
 Driver "mtrack"
 Option "IgnoreThumb" "true"
 Option "IgnorePalm" "true"
 Option "DisableOnPalm" "true"
 Option "BottomEdge" "30"
 Option "TapDragEnable" "false"
 Option "Sensitivity" "0.85"
 Option "ButtonEnable" "true"
 Option "ButtonIntegrated" "true"
 Option "ClickFinger1" "3"
 Option "ClickFinger2" "2"
 Option "ClickFinger3" "1"
 Option "TapButton1" "0"
 Option "TapButton2" "0"
 Option "TapButton3" "0"
 Option "TapButton4" "0"
EndSection
```
## Enable fan control and ambient light sensor
linux Mint doesn't support the MacBook's ambient light sensor or regulating the fan. Edit the modules file:
```
sudo vi /etc/modules
```

Add these lines:
```
coretemp
applesmc
```

Install Lightum and Fan Control Daemon:
```
sudo apt-get install git build-essential libsystemd-login-dev
sudo mkdir /usr/local/src
sudo chmod 755 /usr/local/src
sudo chown $USER:$USER /usr/local/src

cd /usr/local/src
git clone https://github.com/dgraziotin/Fan-Control-Daemon.git
cd Fan-Control-Daemon
make
sudo make install
sudo cp mbpfan.upstart /etc/init/mbpfan.conf
sudo start mbpfan

cd ..
sudo apt-get install libxss-dev libdbus-glib-1-dev
git clone https://github.com/poliva/lightum.git
cd lightum
make
sudo make install
lightum
```

Edit the lightum.conf file:
```
vi ~/.config/lightum/lightum.conf
```
The file has some default settings, here's how I have mine setup:
```
manualmode=0
ignoreuser=0
ignoresession=0
workmode=3
maxbrightness=255
minbrightness=0
polltime=1000
idleoff=5
queryscreensaver=1
maxbacklight=15
minbacklight=1
screenidle=30
fulldim=0
```

## TRIM Your SSD
SSDs need a little extra configuration. When files are deleted on a spinning disk, the directory entry is marked as deleted and the space is overwritten later when a new file is saved. SSDs work a little differently. When a file is deleted it gets marked as deleted just like on a spinning disk. However, when the system tries to write to that area, it has to be cleared first before it can be written to. This takes extra time and slows things down. Setting up trim will clear out those recently deleted areas.

First let's set things up to trim on boot:
```
sudo vi /etc/rc.local
```
Add `fstrim /` to the file like below:
```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

fstrim /
exit 0
```

I also setup my system to run it every hour since I don't reboot my laptop very often.
```
sudo vi /etc/cron.hourly/fstrim


#!/bin/sh
# call fstrim-all to trim all mounted file systems which support it
set -e

# This only runs on Intel and Samsung SSDs by default, as some SSDs with faulty
# firmware may encounter data loss problems when running fstrim under high I/O
# load (e. g.  https://launchpad.net/bugs/1259829). You can append the
# --no-model-check option here to disable the vendor check and run fstrim on
# all SSD drives.
exec fstrim-all
```
## Reverse the Function Keys
By default, the function keys are set to do their special functions like brightness, speaker volume, etc. I'd rather they were setup to perform the regular `F1-F12` function without having to press the `fn` key. This can be achieved by running the following command:

```
$ echo "2" | sudo tee /sys/module/hid_apple/parameters/fnmode
```

To make it the default on reboots, you'll need to add it to `/etc/rc.local`
```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

fstrim /

echo "2" > /sys/module/hid_apple/parameters/fnmode

exit 0
```


## All Done
That's it for now. I will update this as I find more tweaks. Take a look at my post on [setting up your environment](../setting-up-linux-environment) for some more customizations.
