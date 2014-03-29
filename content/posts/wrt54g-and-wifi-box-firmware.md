+++
date = "2005-08-18T01:28:52-07:00"
draft = false
title = "WRT54G and WiFi-Box Firmware"
slug = "wrt54g-and-wifi-box-firmware"
aliases = [
	"wrt54g-and-wifi-box-firmware"
]
+++

        
		<p>
		</p>I decided it was time to stop using the SVEASOFT firmware on my Linksys router. <a href="http://markpit.com/blog/ct.ashx?id=7a751c18-8b99-490d-8883-77612bd46b06&amp;url=http%3a%2f%2fslashdot.org%2f%7eTheIndividual%2fjournal%2f" target="_blank" _base_href="http://markpit.com/blog/">I'm not real keen on some of the things I have heard about the people behind it</a>. So, I decided to install <a href="http://markpit.com/blog/ct.ashx?id=7a751c18-8b99-490d-8883-77612bd46b06&amp;url=http%3a%2f%2fsourceforge.net%2fprojects%2fwifi-box%2f" target="_blank" _base_href="http://markpit.com/blog/">Wifi-Box</a> instead.
I made one crucial mistake though. I forgot to reset to factory
defaults before flashing the new firmware. Once the upgrade was done, I
could no longer access the router through the LAN ports. The weird
thing was that I could access it through the WAN port! The WAN port had
taken the address 192.168.1.1, which is normally what the LAN side is
set to. I telnetted in and looked at the nvram settings and noticed a
bunch of old settings from the SVEASOFT firmware and realized what had
happened. I tried holding in the reset button for 30 (and even
more) seconds. That didn't seem to help. Then I found a website
describing a way to truly clear the nvram <a href="http://markpit.com/blog/ct.ashx?id=7a751c18-8b99-490d-8883-77612bd46b06&amp;url=http%3a%2f%2fvoidmain.is-a-geek.net%2fredhat%2fwrt54g_revival.html" target="_blank" _base_href="http://markpit.com/blog/">here</a>.
It involves opening the router and shorting two pins on the flash chip,
so it is not for the feint of heart. Well that seemed to do the trick,
I was then able to TFTP the official linksys firmware back on the
router and everything worked. Then i went ahead and flashed it with the
WiFi-Box firmware. The main reason I want to use this firmware is so I
can use <a href="http://markpit.com/blog/ct.ashx?id=7a751c18-8b99-490d-8883-77612bd46b06&amp;url=http%3a%2f%2fpeople.ee.ethz.ch%2f%7eoetiker%2fwebtools%2fmrtg%2f" target="_blank" _base_href="http://markpit.com/blog/">MRTG</a> to do some monitoring and this firmware provides SNMP.
      