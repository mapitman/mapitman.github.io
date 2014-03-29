---
title: "Git Extras"
date: 2017-07-14T06:31:30Z
draft: false
image: /images/Git-Logo-2Color.jpg
---
I use Git every day. I'm pretty comfortable using it from the command line, but there's a lot of advanced things that I just can't remember how to do off the top of my head. There's also a lot of command sequences that I type over and over. I recently came across the [Git Extras](https://github.com/tj/git-extras) project that provides a lot of useful plugins for Git that make using it a little less tedious.

One of the commands I think will be useful is [`git feature`](https://github.com/tj/git-extras/blob/master/Commands.md#git-featurerefactorbugchore).

## How to use it

```bash
$ git feature git-extras-post -r
Total 0 (delta 0), reused 0 (delta 0)
To mygitserver/pitman.bz.git
 * [new branch]      HEAD -> feature/git-extras-post
Branch feature/git-extras-post set up to track remote branch feature/git-extras-post from origin.
Switched to a new branch 'feature/git-extras-post'
```

The `-r` option tells it to setup a remote tracking branch and since I didn't pass a remote name, it defaults to `origin`.
So, the first thing it did was push a branch to `origin`. Then it fetched from `origin` and created a local branch setup to track to the same branch name at `origin` and checked it out.

## How to finish out your feature branch

After completing my work in this branch, I would use a similar command to finish:

```bash
$ git checkout master
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
$ git feature finish git-extras-post
Already up-to-date.
Deleted branch feature/git-extras-post (was 055ade6).
Deleted remote-tracking branch origin/feature/git-extras-post (was 055ade6).
To mygitserver/pitman.bz.git
 - [deleted]         feature/git-extras-post
 ```

 First, I switched to the master branch. Then the `feature finish` command did a no-ff merge into the current branch (master) and deleted the `feature/git-extras-post` branch. It then deleted the remote branch.

 Is this earth-shattering? No, not really. But I like the way it automates some of the workflow that I already use.

## Other Commands
 There's a lot of other neat commands too:

+ [git-summary](https://github.com/tj/git-extras/blob/master/Commands.md#git-summary) - Prints some summary info about the repo.
+ [git rename-branch](https://github.com/tj/git-extras/blob/master/Commands.md#git-rename-branch) - Renames a branch, both local and remote.
+ [git alias](https://github.com/tj/git-extras/blob/master/Commands.md#git-alias) - Easy way to setup aliases for git commands.
+ [git ignore](https://github.com/tj/git-extras/blob/master/Commands.md#git-ignore) - Quickly add files to `.gitignore`

There's many more listed in the [repo](https://github.com/tj/git-extras/blob/master/Commands.md).

## Contributing

The maintainers are pretty friendly. I submitted a pull request to fix the remote handling of the `git feature` command and after some code review, and a few changes, it was merged quickly.

Is there a Git workflow you use that you think others would benefit from? [Fork](https://github.com/tj/git-extras#fork-destination-box) the [Git Extras repo](https://github.com/tj/git-extras) and submit a pull request!