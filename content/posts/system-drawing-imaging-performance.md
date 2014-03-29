+++
date = "2004-04-07T19:21:00-07:00"
draft = false
title = "System.Drawing.Imaging Performance"
slug = "system-drawing-imaging-performance"
aliases = [
	"system-drawing-imaging-performance"
]
+++
I just recently discovered Omar's <A href="http://shahine.com/omar">blog</A>&nbsp;and he <A href="http://www.shahine.com/omar/Trackback,guid,673c131f-26db-4f44-9908-c2667da832ad.aspx">posted</A> an interesting find about improving the performance of loading images from a file. The real issue is loading an image from a stream, since that what the .FromFile method ends up calling anyway. I wonder how many places this could affect performance in a lot of software out there!