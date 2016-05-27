+++
categories = ["hugo", "github", "hosting"]
date = "2016-05-21T15:36:40+05:30"
description = ""
tags = ["hosting on github", "hugo", "github"]
title = "How to Easily Host a Static website on Github"
toc = false

+++

This post shows, how you can easily host your static website on Github. We are using Hugo static site generator. You can use anything similar.

## Initial Setup

I believe that you already have [setup your hugo project](https://gohugo.io/overview/quickstart/), refer the link in case you want to start a project. Then open your `config.toml` file and modify the **baseUrl** as:

`baseurl = "http://{username}.github.io/"`

replace {username} with your username.


## Repository for Project Files

This step is not mandatory, but still you want to do this. Creating a repository for you content will help you monitor how your site advanced. It will also help you correct changes in case you do something wrong(which is bound to happen).

Create a new repository on Github with same name as your project. Then `cd` inside the directory and issue following commands:

```bash
git init
git add -A
git commit -m "init : setup project"
git remote add origin <project name>
git push -u origin master
```

These commands will also be displayed to you when you create the repository on Github.

>Note : Make sure you are inside the project directory, before issuing the commands.

## Repository for Web Pages
We will now create another repository to hold our static website. Create a new repository on GitHub with name as `{username}.github.io`. Replace the {username} with you Github username.

After this create a new directory parallel to your project directory. Name it as you find appropriate. I name it same as the project directory with some extra suffix. This helps in keeping them close. like
`github` and `github_pages`. Move into this new directory and do as following:

```bash
git init
git add -A
git commit -m "init : setup project"
git remote add origin {username}.github.io
git push -u origin master
```

## Generate Static Site

We are all set-up. We will create our website which will be visible to everyone.
Move into your project directory and run following commands:

```
hugo -d ../github_pages [-t theme_name]
```
>Note : Change directory name to match yours.

`-d` flag tells where should hugo dumb the site

`-t` flag is optional, you can specify a theme name you are using.

So, Now we have our website ready. All we need to do is host them and make it available to everyone.

## Bring It Live

To get our site live we have to move into our `github_pages` directory and push it up to Github.

```bash
git add -A
git push
```

You can now view you website at **www.yourusername.github.io**

## Automate It

We do not want to repeat commands every time we make some changes. So in my `github` project directory I create a new file called `deploy.sh` and add following lines to it.

```bash
#!/bin/bash

# Build the project.
hugo -d ../classandobjectspage

# Change directory
cd ../classandobjectspage

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push
```

Now you can just run `bash deploy.sh "your message"`. This will do all the above tasks we did manually.


## Custom Domain
Adding a domain to your website is optional. You can read [how to add domain to my github page](http://classandobjects.com/hugo/adding_custom_domain_to_github_pages/).

## Finally

I tried to show every step I took in hosting my website. My experience was not good with the available documentation, but I hope that this will help you all. If you find anything missing or not mentioned, do let me know in the comments below! Thanks for reading...
