---
layout: post
title: "Octopress cheat sheet"
date: 2016-12-04 22:08:29 +0500
comments: true
categories: [octopress, blog] 
---

Octopress posting workflow:

1. ``rake new_post["Post title"]``. Note, if you are _zsh_ user don't forget to escape `[` and `]`
2. ``rake generate``
3. ``git add .``
4. ``git commit -am 'Post title'``
5. ``git push origin source``
6. ``rake deploy``

