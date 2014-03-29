+++
date = "2013-07-19T07:59:50-07:00"
draft = false
title = "Changing Default Colors in Git and Posh-Git"
slug = "changing-default-colors-in-git-and-posh-git"
image = "./images/2015/04/Git-Logo-2Color.jpg"
aliases = [
	"changing-default-colors-in-git-and-posh-git"
]
+++
<h3 id="changing_default_colors"><strong style="font-size: 1rem; line-height: 1.846153846;">Git</strong></h3>
In Git, <em>color.status.changed</em>, <em>color.status.untracked</em> and <em>color.branch.remote</em>, default to red on normal (whatever your console background color is). This can be difficult to read. You can change them using:
<pre>git config  "foreground-color background-color attribute"</pre>
​For example:
<pre>git config --global color.status.changed "yellow normal bold"
git config --global color.status.untracked "yellow normal bold"
git config --global color.branch.remote "yellow normal bold"</pre>
<em>Note that "yellow normal dim" will show up as white in PowerShell, so if you want to use yellow, you must also specify bold.</em>
<h4 id="git_posh"><strong>Git-Posh</strong></h4>
Git-Posh uses red as the default for <em>GitPromptSettings.WorkingForegroundColor</em> and <em>GitPromptSettings.UntrackedForegroundColor</em>. These are difficult to read as well. They can be changed by editing your PowerShell profile:
<ol>
	<li>From a PowerShell window, type: notepad $profile to edit your profile.</li>
	<li>Add the following lines somewhere after the #### end POSH-GIT config line near the end.</li>
</ol>
<pre>$global:GitPromptSettings.WorkingForegroundColor    = [ConsoleColor]::Yellow
$global:GitPromptSettings.UntrackedForegroundColor  = [ConsoleColor]::Yellow</pre>
You'll need to restart PowerShell to see the change.