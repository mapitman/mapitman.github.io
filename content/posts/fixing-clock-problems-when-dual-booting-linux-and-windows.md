+++
date = "2014-03-24T21:52:12-07:00"
draft = false
title = "Fixing Clock Problems When Dual Booting Linux and Windows"
slug = "fixing-clock-problems-when-dual-booting-linux-and-windows"
image = "./images/2015/04/linux-windows-hosting-1.png"
aliases = [
	"fixing-clock-problems-when-dual-booting-linux-and-windows"
]
+++
I recently noticed I had to reset the time on my PC whenever I rebooted from Linux into Windows. It seemed like it started after I had to reset my Windows 8 install (seems like I have to do that a lot!) I like that Linux wants the hardware clock to be UTC, but I wish there was a way to make Windows work with that...

It turns out, there is a registry setting that takes care of this: 
<pre>[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation]
    "RealTimeIsUniversal"=dword:00000001</pre>