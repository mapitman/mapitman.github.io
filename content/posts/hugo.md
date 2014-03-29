+++
date = "2015-06-24T22:43:00-07:00"
draft = false
title = "Trying out Hugo"
slug = "trying-out-hugo"
image = "https://gohugo.io/img/hugo.png"
+++

I've been doing some Go programming lately and I ran across the [Hugo](http://gohugo.io) project while searching for something. It's kind of like [Jekyl](http://jekyllrb.com/) but written in Go. I looked around a little more and I found a Go program to [convert Ghost content to Hugo content](https://github.com/jbarone/ghostToHugo). I ended up submitting a pull request because it was writing out some junk in the [front matter](http://gohugo.io/content/front-matter/) of the posts. I think maybe it was written against a previous version of Ghost.

The point of Hugo is to be able to write your content in Markdown and publish it as a set of static pages. I like the idea of keeping my content in a Git repository and publishing it however I want to. I modified the [Vienna theme](https://github.com/keichi/vienna) a little so I can change the image at the top of the page on each post if I want to. I'll probably submit a pull request for it.
