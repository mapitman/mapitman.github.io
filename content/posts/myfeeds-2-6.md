+++
date = "2013-04-05T05:31:36-07:00"
draft = false
title = "MyFeeds 2.6"
slug = "myfeeds-2-6"
aliases = [
	"myfeeds-2-6"
]
+++
MyFeeds 2.6 is a quick bugfix. I had a number of reports on an OverflowException causing the app to crash. I was using Convert.ToInt32() to convert enclosure length from a string. I was storing it as a long anyway, so just needed to switch to Convert.ToInt64().
<ul>
	<li><span style="line-height: 13px;">Bugfix - OverflowException while parsing some feeds with enclosures was causing app to crash. Fixed!</span></li>
</ul>
&nbsp;

It has been certified and should be available within 24 hours. Get the update <a title="MyFeeds in the Windows Phone Store" href="http://windowsphone.com/s?appid=d2648ca8-7eda-df11-a844-00237de2db9e" target="_blank">here</a>!