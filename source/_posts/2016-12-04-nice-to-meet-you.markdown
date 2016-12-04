---
layout: post
title: "Nice to meet you!"
date: 2016-12-04 16:44:15 +0500
comments: true
categories: ["octopress", "about", "blog"]
---

Hello, and Welcome.
My name is Denis Kirpichenkov, and I'm a Java developer who likes DevOps too ;)
In my first post will tell you how to get very powerful Content Management System, and how to get free hosting for it.

I tried many times to start blogging, but again and again I failed. The one of reasons was CMS. I could find content system to fit all of my needs.
But now, I hope I found The One. I'm talking about Octopress. It is a powerful and simple Content Management System, which is for say is not a CMS at all.
I'm will briefly describe its features in this post.

The next important step in blogging is a hosting. I tried Amazon's EC2 tiny instance, Digital Ocean's 5-dollars-per-month-vm. 
They didn't fit my needs as well. I had to maintain them, and this process takes time. It is a big problem for me.
I found the best hosting I've ever dreamt - GitHub.
Below I will tell how to make GitHub to host your blog for FREE.  

<!-- more -->

# Octopress basic

Octopress is not a CMS in common sense. It is a bunch of ruby scripts that generates static html pages to host your posts. So, your blog will be blazing fast.
You have some customization point such as themes, page templates. I promise I'll write about it after I'll try it on this blog.
I read about Octopress somewhere, google it, and thought that it is woth trying.

## Installation

First of all, you have to get it from github 

`git clone git://github.com/imathis/octopress.git octopress`

Next, make initial preparations

`cd octopress && bundle install`

After it you need to run 

`rake install`

**Ubuntu 16.04** I don't know why at the moment, but if you run `rake SOMETHING` you'll get wierd error, that tells nothing.
```
bundler: failed to load command: rake (/usr/local/bin/rake)
LoadError: cannot load such file -- /usr/share/rubygems-integration/all/specifications/bin/rake
  /usr/local/bin/rake:23:in `load'
  /usr/local/bin/rake:23:in `<top (required)>'
```

The quick solution is to use `/usr/bin/rake` instead of `rake`

## Taste it

After you've done Octopress installation, you can test it. Just run `rake preview` and open browser at `localhost:4000` 

## First post

Making post is as easy as run `rake new_post["This is a fisrt post"]` It will create a markdown file in  `source/_posts`

You are free to write whatever you want in this post in markdown.
To make it a bit easier here is [markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

## Generate pages

When you are ready to publish your blog you have to run `rake generate`. This command will produce everything you need to serve blog in `public` folder
So, after generation you are free to upload public to whatever you want hosting, and have your blog online.

# GitHub as a free hosting

After you've cloned a Octopress repo from github you can use it as your own repo for blog. First you need to run `rake setup_github_pages`.
This command will ask you about url to your github repository to work with

``
Enter the read/write url for your repository
``

You may answer something like this `git@github.com:USERNAME/REPOSITORY.git`
Don't forget to change USERNAME to your github's login, and REPOSITORY to your repository name

Next, add your remote repo to your local repo by running `git remote add origin git@github.com:USERNAME/REPOSITORY.git` 

The next step is renaming current branch from 'master' to 'source' with `git branch -m master source`

After that, generate everything with `rake generate`

Add the whole directory with Octopress and your post to a git with `git add .`

Make commit `git commit -am "First commit to github." `

Push it to github `git push origin source`

Deploy generated content to GitHub `rake deploy`

## Subdirectory problem

If you github repo is something like `d0k1/focusit` you'll face a problem - deployed blog would not find resources like static content (css, images).
To solve this you need to run `rake set_root_dir[d0k1/focusit]` 
To revert changes run `rake set_root_dir[/]`

After you done it, update `_config.yml` 
``
url: http://d0k1.github.io/focusit
``

and `Rakefile`
``
document_root = "~/d0k1.github.io/focusit"
``

## Custom Domain

You can add custom domain to you github pages based blog. To make it you need to create two file inside `source` catalog: `CNAME`, `.nojekyll`
File `CNAME` should contain you custom domain, for example `focus-it.ru`

After it you can ypddate you repository
```
rake generate
git add .
git add -am 'domain configuration'
git push origin source
rake deploy
```

Do not forget to update your DNS to forward requests from you custom domain to github's servers.
You need know what ip servers you repostiry

After I ran 
``dig d0k1.github.io +nostats +nocomments +nocmd``

I got 
```
; <<>> DiG 9.10.3-P4-Ubuntu <<>> d0k1.github.io +nostats +nocomments +nocmd
;; global options: +cmd
;d0k1.github.io.            IN    A
d0k1.github.io.        3599    IN    CNAME    github.map.fastly.net.
github.map.fastly.net.    29    IN    A    151.101.12.133
```

Now I know IP of server that process request to my repository (d0k1.github.io) -  151.101.12.133
And now I have to add to DNS
`@    A    151.101.36.133`

So, that's how I get my blog on focus-it.ru up and running on free hosting with a great "CMS"

--
_Cheers,_ 
