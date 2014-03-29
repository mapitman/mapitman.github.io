+++
date = "2005-09-15T01:35:08-07:00"
draft = false
title = "Removing Ads from MSN Messenger"
slug = "removing-ads-from-msn-messenger"
aliases = [
	"removing-ads-from-msn-messenger"
]
+++

        If you want to remove ads from MSN Messenger, but you don't want to go to the extremes documented <a href="http://markpit.com/blog/ct.ashx?id=b544c8dc-3107-4b07-a34d-532d6ea7b8dc&amp;url=http%3a%2f%2fwww.matthijs.net%2fmsn.php" _base_href="http://markpit.com/blog/">here</a>, there is another option.<br />

Open the file c:windowssystem32driversetchosts in notepad and add the following line:<br /><br /><font face="Courier New">0.0.0.0        rad.msn.com<br /><br /></font>The banner ad at the bottom of the main
messenger window will stop cycling and will just display the MSN
Messenger logo. The text ads in the IM windows will be gone too.<br />

This information is for educational purposes only :)<br />
      