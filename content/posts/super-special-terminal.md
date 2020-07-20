---
title: "My Super Special Terminal Setup"
date: 2020-06-06T20:00:25-07:00
showDate: true
tags: ["blog","development"]
---

If you're anything like me you are super particular about your terminal setup. I am capable of working in most terminal environments, but since I spend a lot more time using the setup on my personal computer than those on machines I SSH into, I figure it's worth spoiling myself in that context, despite the fact that it might incur a slight efficiency penalty when I'm using machines without all the niceties that I like to add. Since I am now in the process of setting up my development environment once again, I figured I would take this opportunity to document all the things I do in a post so I don't have to go through so much trial and error every time to remember how I like things.

### Terminal

First things first, don't even open Terminal. Get [iTerm](https://www.iterm2.com).

### Package Manager

The next thing you'll need is a package manager. I've tried [Homebrew](https://brew.sh), but I found it to be confusing as someone who's spent time with other package managers like `apt` and `pacman`. I've also run into issues when macOS updates are installed; sometimes the permissions of your `/usr/local` directory get reset, and consequently your whole environment gets screwed up. The latter experience left me with a sour taste in my mouth and a compulsive desire to Dockerize everything, so now I'm using [MacPorts](https://www.macports.org). I found [this post](https://saagarjha.com/blog/2019/04/26/thoughts-on-macos-package-managers/) to be a well thought out comparison between the two, if you're interested something more nuanced than my knee-jerk reaction.

### Docker

Not strictly a terminal thing, but something that's important to my environment, due to the aforementioned compulsive Dockerization habit. I just install the [Docker For Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) app, not sure if that's the best way to do it but it's worked well for me so far.

### Shell

Once you've got iTerm and MacPorts setup, time to install your shell of choice (unless it's `bash`, which is fine I guess). Personally I've always been partial to `zsh`, mostly because it's what all my friends used in college (a nuanced decision making process, I know). Recently I've been considering checking out `fish`, but I haven't gotten around to it yet. To install `zsh`, just run:

```
$ sudo port install zsh zsh-completions
```

A necessary companion to `zsh` in my mind is [Prezto](https://github.com/sorin-ionescu/prezto), which adds a ton of nice features like history substring search, mostly reasonable `git` aliases, and `vim` bindings for your prompt, among other things. It's recommended that you fork the repo so you can store your personal configuration in GitHub. My fork is [here](https://github.com/jordancrane/prezto); it's pretty basic, just turning on a few colorization settings, adding some extra aliases, and tweaking my favorite prompt theme to have emoji (the most important change obviously).

I've typically used a modified version of the `steeef` prompt that comes with Prezto, but with this install I also discovered [starship](https://starship.rs), which seems interesting. I'm unsure how much feature overlap it has with Prezto, so whether I continue using it or not remains yet to be seen.

### Text Editor

As far as I'm concerned Vim is the One True Text Editor, and I mostly refuse to use any application that doesn't have a Vim bindings plugin. However, having gone way down the rabbit hole of Vim tweaking in the past, I will say that overall I prefer to use [NeoVim](https://neovim.io) since it tends to be easier to get plugins to work well with NeoVim without recompiling with a bunch of different variant flags. Install it with

```
sudo port install neovim
```

and add

```
alias vim='nvim'
```

to your `.zshrc` for an easy transition. Two bindings I find important are:

```
nnoremap j gj
nnoremap k gk
```

which allow you to move up and down wrapped lines (helpful for writing blog posts and whatnot without needing to add line breaks manually).

### Font

I really enjoy [Hermit](https://pcaro.es/p/hermit/).

### Colorscheme

I like the Apprentice color scheme for both [Vim](https://github.com/romainl/Apprentice) and [iTerm](https://github.com/romainl/apprentice-colorschemes). Do note that the background color for iTerm in that repo is a little off from that in the Vim one, change it to `#262626` to avoid having a frame around your Vim window. For installing it to Vim, I use [vim-plug](https://github.com/junegunn/vim-plug).

### Conclusion

I think that's about everything... This will likely be a living document that I will modify as my preferences change.
