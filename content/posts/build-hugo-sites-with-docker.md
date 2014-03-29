+++
title = "Build Hugo Sites with Docker"
draft = false
date = "2016-09-26T20:19:26-07:00"
image = "./images/gitlab.png"
+++

I use [Hugo](https://gohugo.io/) to create and build this website and run it in a [Docker](https://www.docker.com/) container. I was managing it all manually and wanted to make it more automatic. My last platform was Ghost and I really liked that I could post with minimal effort and fuss.  

When I dicovered that the free hosted [Gitlab](https://gitlab.com) supports builds, I decided to move my private git repos over to Gitlab. Gitlab offers the ability to import projects directly from other git hosts, so it was pretty easy to move from Bitbucket. 

The built-in CI runner on gitlab.com use Docker images to run the builds, so it needs an image with all the tools installed for building your project. Once I had my project moved, I had to find a Docker image I could use to build my website. That image would need Hugo, Docker and, for deployment, SSH installed. I looked around and wasn't able to find anything that suited my needs, so I created an image myself. It's based on the Docker image from [Docker Hub](https://hub.docker.com/_/docker/) which is based on [Alpine Linux](https://alpinelinux.org/) which is a tiny linux distro that is perfect for Docker images. The git repo can be found on [Github](https://github.com/mapitman/docker-hugo) and the image is hosted on [Docker Hub](https://hub.docker.com/r/mapitman/docker-hugo/).

If you already have a git repo with your Hugo site defined and a Dockerfile, you just need to add a `.gitlab-ci.yml` file to start building it.

This is the CI configuration I use to build my Hugo based website. I was unable to get the SSH login to work using keys, so it uses ssh-pass to login with userid and password instead.

```
image: mapitman/docker-hugo
stages:
  - build
  - deploy
services:
  - docker:dind
build:
  stage: build
  script:
  - git submodule update --init
  - hugo -t <YOUR_THEME>
  - docker login -u $DOCKER_USER -p $DOCKER_PASS
  - docker build -t $DOCKER_IMAGE_TAG .
  - docker push $DOCKER_IMAGE_TAG
  only:
  - master
deploy:
  stage: deploy
  script:
  - mkdir -p ~/.ssh
  - ssh-keyscan -t rsa $SSH_HOST 2>&1 >> ~/.ssh/known_hosts
  - sshpass -p "$SSH_PASS" ssh $SSH_USER@$SSH_HOST "docker stop blog; docker rm blog; docker pull $DOCKER_IMAGE_TAG:latest && docker run -p 80:80 -p 443:443 -d --name blog $DOCKER_IMAGE_TAG:latest"
  only:
  - master
```




