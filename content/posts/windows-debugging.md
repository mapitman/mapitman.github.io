---
date: "2004-10-19T06:26:00-07:00"
draft: false
title: "Windows Debugging"
slug: "windows-debugging"
aliases: [
	"windows-debugging"
]
---


I have been lucky enough to be in a Windows debugging class for the last
 4 days. The company I work for had an instructor from Microsoft come
 in to give us two classes. Windows DNA Debugging and .NET Debugging.
 If you are a Windows developer and you ever have the opportunity to
 take these classes, do it!

Years ago, I was having troubles with IIS crashing. I remember talking
to Microsoft support and they sent me a utility to capture a crash dump
when IIS crashed. I sent it off to them and they figured out it was a
problem with some Sybase DLLs. At the time, I had no clue how to read
the crash dumps. Now that I have taken these classes, I can at least
 partially understand what is going on. Analyzing crash dumps seems to
 be something you need to do a LOT before you would become really good
  at it. There's a lot of assembly code and HEX values involved and it
   is a little overwhelming at first.

If you can't take the classes, Microsoft has some info
[here](http://www.microsoft.com/whdc/devtools/debugging/default.mspx)
about installing and using the debugging tools. One really cool thing I
 didn't know about is that Microsoft has a
 [symbol server](http://www.microsoft.com/whdc/devtools/debugging/symbols.mspx)
 that the debugger can download debug symbols from when it needs them.
 It handles getting the right version of each symbol file for you.
