+++
categories = ["domain", "blog", "github"]
date = "2016-05-22T16:48:45+05:30"
description = "Step by step guide on how to add custom domain to github pages and blogs"
tags = ["add doamin to github page", "add godaddy domain to github page"]
title = "Adding Domain to Github Pages"
toc = false
draft = "true"

+++

A domain which shows what you do can add *credibility* to your blog. In this tutorial we are going to add custom domain to our github page. You may also want to [host a website on github](..). You can have domain with [godaddy](www.godaddy.com), [hostgator](www.hostgator.com), [namecheap](www.namecheap.com), etc. The steps remains the same. I will point out any peculiarity, if they exist. So, lets get started.

## Configuring Github

There should be a way for github to know what is the name of your domain. To keep it simple you have to create a file `CNAME` in your repository root. This will be the place where you have hosted your websites html content. In this file put in your domain name `mydomain.com`. You can [visit my github hosting](https://github.com/ankitsinghaniyaz/ankitsinghaniyaz.github.io) and checkout how my `CNAME` file looks.

## Configuring Domain Provider

In this step we have to login to our account where we have bought the domain.

> Warning: This may seem complicated, but it is not.

![adding entries in domain](/images/domain_entry.png "TEXT")

You have to follow these three simple steps. Just add/modify these entries:

1. Create/modify `A`, `Aname` or `Alias` with name as `@`  and value as `192.30.252.153`
2. Create/modify `A`, `Aname` or `Alias` with name as `@`  and value as `192.30.252.154`
3. Create/modify `CNAME` with name as `www` and value as `yourgithubid.github.io`

> Note: `A`, `Aname` and `Alias` are same thing.

Keep all other fields to their defaults. Do not hesitate to play. It is how you learn new things.

## Conclusion

Within less than 10 minutes you website will come live. You can go to your link and try it! If you find any information missing or have any doubts feel free to leave a comment below. Thanks for reading.
