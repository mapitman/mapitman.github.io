---
date: "2004-10-19T06:26:00-07:00"
draft: false
title: "Windows Debugging"
slug: "windows-debugging"
aliases: [
	"windows-debugging"
]
---
<p>I have been lucky enough to be in a Windows debugging class for the last 4 days. The company I work for had an instructor from Microsoft come in to give us two classes. Windows DNA Debugging and .NET Debugging. If you are a Windows developer and you ever have the opportunity to take these classes, do it!</p> <p>Years ago, I was having troubles with IIS crashing. I remember talking to Microsoft support and they sent me a utility to capture a crash dump when IIS crashed. I sent it off to them and they figured out it was a problem with some Sybase DLLs. At the time, I had no clue how to read the crash dumps. Now that I have taken these classes, I can at least partially understand what is going on. Analyzing crash dumps seems to be something you need to do a LOT before you would become really good at it. There's a lot of assembly code and HEX values involved and it is a little overwhelming at first.</p> <p>If you can't take the classes, Microsoft has some&nbsp;info <a href="http://www.microsoft.com/whdc/devtools/debugging/default.mspx" target="_blank">here</a>&nbsp;about installing and using the debugging tools. One really cool thing I didn't know about is that Microsoft has a <a href="http://www.microsoft.com/whdc/devtools/debugging/symbols.mspx" target="_blank">server</a> that the debugger can download debug symbols from when it needs them. It handles getting the right version of each symbol file for you.</p>
