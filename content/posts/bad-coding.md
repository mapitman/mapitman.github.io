+++
date = "2004-05-20T22:06:00-07:00"
draft = false
title = "Bad coding"
slug = "bad-coding"
aliases = [
	"bad-coding"
]
+++

        <P>Tim Marman <A href="http://weblogs.asp.net/tmarman/archive/2004/05/19/135547.aspx" target=_blank>blogs</A> about iGo's website being bad. So I went to their site, forced an error by changing a querystring a little and I see that they are passing the error message in the querystring! Bad, programmer! After <A href="http://markpit.com/blog/blog/archive/2004/05/19/178.aspx" target=_blank>Scott Guthrie's presentation</A> the other night on Cross-site scripting attacks, I thought, &#8220;I wonder if you could put javascript in the querystring?&#8221; Well, the answer is YES! Yikes! </P>
<P>I was going to provide a link to the site with a little &#8220;alert&#8221; message, but it's probably better to leave that as an exercise for the reader...</P>
      