---
title: "Tips for using Docker from git-bash on Windows"
date: 2019-07-27T17:56:39-07:00
draft: false
---

I've run across a few problems when running Docker CLI commands from git-bash on Windows. I use Linux on my home machines, but Windows at work. I use git-bash on Windows, instead of Powershell or CMD, so that I'm not constantly switching command line environments.

## TTY

Often, I use Docker containers to run an interactive Linux environment to use tools that are either not available on Windows or that I don't want to figure out how to install. To do this, I run something like

```
docker run --rm -it mapitman/linux-tools
```

I _should_ get a bash prompt, but instead I get this message:

```
the input device is not a TTY.  If you are using mintty, try prefixing the command with 'winpty'
```

So, just follow the suggestion and add `winpty` to the command and it works fine. Someday, I'll have a version of Windows with true pseudo-tty support, but until then, this works.

## Volume Mounting

It's useful to be able to mount your current working directory in a Docker container. I do it often when I'm writing code in a language that I don't use very often, like PHP. In Bash on Linux, it's straightforward.

```
docker run --rm -it -v $PWD:/workdir -w /workdir mapitman/php-cli
```

If I try the same thing in git-bash on Windows I get this:

```
winpty docker run --rm -it -v $PWD:/workdir -w /workdir mapitman/php-cli
C:/Program Files/Docker/Docker/Resources/bin/docker.exe: Error response from daemon: Mount denied:
The source path "C:/Users/mpitman/code-samples/php;C"
doesn't exist and is not known to Docker.
See 'C:/Program Files/Docker/Docker/Resources/bin/docker.exe run --help'.
```

It turns out, if you put a `/` in front of `$PWD`, it will work as expected.

```
winpty docker run --rm -it -v /$PWD:/workdir -w /workdir mapitman/php-cli
```

If I come across any other tips, I'll update this post.

