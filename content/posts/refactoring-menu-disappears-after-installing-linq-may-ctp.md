+++
date = "2006-06-16T16:15:10-07:00"
draft = false
title = "Refactoring menu disappears after installing LINQ May CTP"
slug = "refactoring-menu-disappears-after-installing-linq-may-ctp"
aliases = [
	"refactoring-menu-disappears-after-installing-linq-may-ctp"
]
+++

        <P>After installing the MAY CTP of LINQ, the refactoring menus in VS2005 stopped working. I use that a lot, so I either had to find a way to fix it or uninstall LINQ! I found a post on the <A href="http://forums.microsoft.com/msdn/showpost.aspx?postid=412559&amp;SiteID=1">MSDN forums</A> that solves the problem. There is a registry entry you must change along with running a few commands from the command line. I have zipped up two files that will make the process a little easier.</P>
<P><A href="http://markpit.com/blog/binary/Fix_Refactoring_Menu.zip">Fix_Refactoring_Menu.zip (.7 KB)</A></P>
<P>There is a reg file and a cmd file contained in the zip file. You may need to edit the contents if you have installed Visual Studio somewhere besides the default location.</P>
      