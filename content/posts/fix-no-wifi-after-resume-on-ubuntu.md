---
title: "Fix No Wifi After Resume on Ubuntu"
date: 2020-01-19T18:37:51-08:00
draft: false
---

Similar to the [issue I had on Fedora](/posts/no-wifi-access-after-resume-from-sleep), when I resume from sleep on Ubuntu,
my wifi connection _looks_ like it is up, but I'm unable to access any network
resources. 

Unfortunately, unloading and reloading the wifi adapter kernel module didn't
work this time around. I found that restarting the Network Manager service
after resume made the network accessible. So, I created a script to restart
it after the system was resumed.

Create the file `/lib/systemd/system-sleep/network-manager`.

```sh
#!/bin/sh

# /lib/systemd/system-sleep/network-manager

# Restarts network-manager after sleep.
# This prevents the problem where the network is not
# available after resume.

case $1 in
    post)
        /usr/bin/sleep 10
        /usr/bin/systemctl restart network-manager
        ;;
esac

```

Make the file executable:

```sh
chmod 755 /lib/systemd/system-sleep/network-manager
```

I found that restarting immediately after resume didn't work, so I added the `sleep` command. I tried various values, but 10 seconds seemed to be the lowest value that made it work.

