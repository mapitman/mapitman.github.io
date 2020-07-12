---
title: "Restore Gnome Titlebar Buttons"
date: 2020-07-11T20:56:08-07:00
draft: false
---

I've been trying out tiling window managers lately and I recently installed 
[Regolith](https://regolith-linux.org/) into my existing Ubuntu installation.

After logging out of my Regolith session and back into my Gnome session, I 
noticed the window titlebar buttons were missing. Gnome Tweaks only allowed me
to get back the minimize and maximize buttons. To get the close button as well,
I had to run the following command:

```
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close,'
```
Hope this helps someone else.
