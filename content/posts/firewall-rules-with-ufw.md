+++
date = "2015-05-09T20:41:53-07:00"
draft = false
title = "Firewall Rules with UFW"
slug = "firewall-rules-with-ufw"
image = "./images/2015/05/ufw.png"
aliases = [
	"firewall-rules-with-ufw"
]
+++
UFW is _Uncomplicated Firewall_. It is an easy way to setup iptables firewall rules on your Linux system. If it is not already installed, it can be installed on Debian-based systems (like Ubuntu) like this:

    sudo apt-get install ufw

Check the status of current firewall rules.

    sudo ufw status

Here's the output on one of my systems:

    Status: active

    To                         Action      From
    --                         ------      ----
    22                         ALLOW       Anywhere
    80                         ALLOW       Anywhere
    10000/tcp                  ALLOW       Anywhere
    443/tcp                    ALLOW       Anywhere
    22 (v6)                    ALLOW       Anywhere (v6)
    80 (v6)                    ALLOW       Anywhere (v6)
    10000/tcp (v6)             ALLOW       Anywhere (v6)
    443/tcp (v6)               ALLOW       Anywhere (v6)

If you haven't set it up before, you won't see all those rules. To start configuring your firewall, add the default rules.

    sudo ufw default deny incoming
    sudo ufw default allow outgoing

If you're SSH'd into the machine, be sure to add a rule to allow it, otherwise you could lose access to your system.

    sudo ufw allow 22/tcp

When you've finished adding rules, enable the firewall.

    sudo ufw enable

Other useful commands:

    sudo ufw status verbose
    sudo ufw disable
    sudo ufw reset

Once you have your rules set up, they will be persistent across reboots.