---
title: "No Wifi Access After Resume From Sleep"
date: 2019-12-27T15:07:21-06:00
draft: false
---


i've recently been having problems with my WiFi connection after my
laptop comes out of sleep mode. After resuming, the NetworkManager
looks like the connection is OK, but nothing on the network is
accessible. I did a little searching and found out there are some
known problems with some WiFi drivers not dealing with the resume
properly. If you unload the kernel module before suspending and load it
again after resuming, everything works fine.

I used `lspci` to find out the name of the WiFi adapter:

Intel Corporation Centrino Advanced-N 6205 (Taylor Peak - rev 96)

Then I used `lsmod | grep wifi` to figure out which module controls
the WiFi adapter. It ended up being `iwldvm` for my Lenovo Thnkpad Carbon X1 Gen 1.

You can see all the related modules below:

```
mark@localhost:~$ lsmod | grep iwldvm
iwldvm                274432  0
iwlwifi               323584  1 iwldvm
mac80211              974848  1 iwldvm
cfg80211              835584  3 iwldvm,iwlwifi,mac80211

```
To automate the unload/load of the kernel module, create a file named
`/lib/systemd/system-sleep/iwldvm.sh`

Add the following to the file:

```
#!/bin/sh

# /lib/systemd/system-sleep/iwldvm.sh

# Unloads and loads wifi driver before and after sleep.
# This prevents the problem where the network is not
# available after resume.

case $1 in
    pre)
        modprobe -r iwldvm
        ;;
    post)
        modprobe iwldvm
        ;;
esac
```

This was on Fedora 31 with kernel 5.3.16, but I had the same problem
on Ubuntu 19.10. I'm pretty sure the file goes in the same place on Ubuntu.

