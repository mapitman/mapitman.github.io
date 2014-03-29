+++
date = "2014-01-21T09:49:13-08:00"
draft = false
title = "Node-Webkit Pre-Built Binary Fails to Run on Ubuntu 13.10"
slug = "node-webkit-pre-built-binary-fails-to-run-on-ubuntu-13-10"
image = "./images/2015/04/html5-node-webkit-retina-preview.png"
aliases = [
	"node-webkit-pre-built-binary-fails-to-run-on-ubuntu-13-10"
]
+++
I was trying to run the pre-built binaries for [Node-Webkit](https://github.com/rogerwang/node-webkit) and was getting an error:

    ./nw: error while loading shared libraries: libudev.so.0: cannot open shared object file: No such file or directory

To fix this on a 64-bit system:

    sudo ln -sf /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
    
On a 32-bit system:

    sudo ln -sf /lib/i386-linux-gnu/libudev.so.1 /lib/i386-linux-gnu/libudev.so.0
    
After that, Node-Webkit started up fine!