+++
date = "2014-01-15T16:59:03-08:00"
draft = false
title = "MyFeeds 2.9 Certified"
slug = "myfeeds-2-9-certified"
aliases = [
	"myfeeds-2-9-certified"
]
+++
<a title="MyFeeds 2.9" href="http://pitman.bz/2014/01/myfeeds-2-9/">MyFeeds 2.9</a> was certified and is available today! In addition to the bug fixes in the app, I have also re-enabled the ability to view GIF files. It requires a service to convert GIFs to JPEG since Windows Phone doesn't support GIFs. I had initially written it to run on Windows using C# but I have moved to a Linux server now and had to re-write it. Re-writing it in PHP was the easy part. Getting Nginx to treat an ASPX file as PHP took a few hours (I didn't want to change the URL of the service so older versions of the app would work.)  After fighting with a few complex solutions, I ended up with a very simple solution. I just rewrite the .php to .aspx. I wish I had tried that first!

Anyway, if you have a Windows Phone, download it now!
[![Download](http://res.cloudinary.com/pitman-bz/image/upload/v1385105993/WindowsPhone_125x40_blu_xw0xyu.png)](http://windowsphone.com/s?appid=d2648ca8-7eda-df11-a844-00237de2db9e)
