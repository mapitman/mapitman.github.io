+++
title = "Fix Docker Will Not Start Error On macOS"
draft = false
date = "2017-01-25T19:30:41-08:00"
image = "./images/docker.png"
slug = "fix-docker-wont-start-error-on-mac-os"
+++

I recently updated Docker on my Mac and began getting errors that it was not able to start the daemon:
```
com.docker.osx.hyperkit.linux failed to start
Exit code 1
```

I tried uninstalling and re-installing, to no avail. After doing a little searching, I came across an [issue](https://github.com/docker/for-mac/issues/1198) on the Docker Github repo with some tips.

The short fix is:

```
rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
```

Hope this helps someone.
