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
## Git
In Git, _color.status.changed_, _color.status.untracked_ and _color.branch.remote_, default to red on normal (whatever your console background color is). This can be difficult to read. You can change them using:
```
git config  "foreground-color background-color attribute"
```

​For example:
```
git config --global color.status.changed "yellow normal bold"
git config --global color.status.untracked "yellow normal bold"
git config --global color.branch.remote "yellow normal bold"
```

_Note that "yellow normal dim" will show up as white in PowerShell, so if you want to use yellow, you must also specify bold._
## Git-Posh
Git-Posh uses red as the default for _GitPromptSettings.WorkingForegroundColor_ and _GitPromptSettings.UntrackedForegroundColor_. These are difficult to read as well. They can be changed by editing your PowerShell profile:

1. From a PowerShell window, type: notepad $profile to edit your profile.
1. Add the following lines somewhere after the #### end POSH-GIT config line near the end.

```
$global:GitPromptSettings.WorkingForegroundColor    = [ConsoleColor]::Yellow
$global:GitPromptSettings.UntrackedForegroundColor  = [ConsoleColor]::Yellow
```

You'll need to restart PowerShell to see the change.
