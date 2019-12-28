---
date: "2015-04-01T23:22:35-07:00"
draft: false
title: "Setting up a Raspberry Pi for Node.js Development"
slug: "setting-up-a-raspberry-pi-for-node-js"
image: "https://upload.wikimedia.org/wikipedia/commons/6/6f/Raspberry_Pi_B%2B_top.jpg"
aliases: [
	"setting-up-a-raspberry-pi-for-node-js"
]
---
I bought a Raspberry Pi Model B+ back in December. I didn't have a monitor to plug it into so it just kind of sat idle for a while.

I recently picked up a new monitor so I've been tinkering with the Raspberry Pi and I wanted to capture all of my setup and configuration.

### Don't bother with "Noobs"
I just went ahead and installed Raspbian rather than boot with Noobs and ultimately end up installing Raspbian anyway. Download it [here](http://www.raspberrypi.org/downloads/).

### Find the SD card
I'm using a Mac to write the image.

Get a list of all the disks:

    diskutil list
Identify the disk representing the SD card and unmount it. In my case it is /dev/disk2:

    diskutil unmountDisk /dev/disk2
    
### Write the image to the SD card

Use the `dd` tool to write the image to the SD card:

    sudo dd bs=1M if=2015-02-16-raspbian-wheezy.img of=/dev/disk2

`dd` doesn't show any output unless there is an error or the process is finished. To see the progress, you can open up another terminal and send SIGUSR1 to the process:
    kill -SIGUSR1 <pid>

or, you can just press `<ctrl>-T` in the same terminal where `dd` is running.

### Boot the Pi!

Once the image has been written to the SD card, eject the card:

    sudo diskutil eject /dev/disk1
    
Put it into the Raspberry Pi and turn it on. When it finishes booting, it will automatically run `raspi-config`. Go through the menus and set things up as you like. Be sure to enable SSHd for secure remote terminal sessions.

### Update existing packages and install some useful software
Be sure to update the installed packages:

    sudo apt-get update && sudo apt-get upgrade

Since I'm running on a Mac, I like to have Appletalk and Bonjour installed:

    sudo apt-get install netatalk

I'm really liking Node.js lately, so I plan on writing code using that. The version in `apt-get` is severely out-of-date, so here's an alternative way to install it:

    wget http://node-arm.herokuapp.com/node_latest_armhf.deb
    sudo dpkg -i node_latest_armhf.deb

Once it is installed, you check which version was installed like so:

    node --version

Another good thing to have is wiringPi which is a C library for access the GPIO pins. It also includes a command line utility, `gpio`, for manipulating the GPIO pins:

    git clone git://git.drogon.net/wiringPi
    pushd wiringPi
    ./build

Once it is installed, test it out:

    gpio -v
    gpio readall

More info [here](http://wiringpi.com/download-and-install/).

That's it for now.
