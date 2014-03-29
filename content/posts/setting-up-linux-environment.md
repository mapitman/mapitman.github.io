+++
date = "2015-07-05T17:39:12-07:00"
draft = false
title = "Setting Up a New Linux Environment"
image="./images/logobig.jpg"
+++

I find myself setting up Linux VMs quite often and I always dread getting my environment set up how I want it. Yesterday, I installed Linux on my Macbook and decided it was time to automate as much as possible. I had some notes that I was using to make sure I didn't miss anything when I did it manually, so I used that to build a script.  

I saved it on [Github](https://github.com/mapitman/linux-setup) so others could benefit from it as well. There are probably still some tweaks I need to make, but for the most part it works OK. The instructions for setting it up are in the readme, but I'll repeat it here as well:

# linux-setup
Scripts for getting my linux environment set up from scratch.  
This is focused on using zsh, Vim, Golang and Docker in Ubuntu Linux.

## Installation
We need a few packages to be installed before running the setup script
```
sudo apt-get install curl git zsh
```
### Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
### Install [Docker](https://www.docker.com/)
```
sh -c "$(curl -sSL https://get.docker.com/)"
```

### Run the install script
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mapitman/linux-setup/master/setup.sh)"
```

This will install [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), and configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go). 

