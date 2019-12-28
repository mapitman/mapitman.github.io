---
date: "2015-03-23T00:29:07-07:00"
draft: false
title: "Installing Webmin on Ubuntu"
slug: "installing-webmin-on-ubuntu"
image: "./images/2015/04/Webmin-Logo-600.jpg"
aliases: [
	"installing-webmin-on-ubuntu"
]
---
Install Webmin with apt-get by adding the Webmin repository to your sources:

    echo "deb http://download.webmin.com/download/repository sarge contrib" | sudo tee --append /etc/apt/sources.list
    
    wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -

Then install Webmin

    sudo apt-get update
    sudo apt-get install webmin
    
If firewall is enabled, allow traffic on port 10000

    ufw allow 10000/tcp
    