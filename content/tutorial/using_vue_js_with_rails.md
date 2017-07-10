+++
categories = ["rails", "vue", "javascript"]
date = "2017-03-29T10:58:41+05:30"
description = "Vue is awesome just like RoR. Rails 5.1 allows you to use easily integrate it. In this post we talk about easily setting up Vue and Rails, keeping Turbolink intact"
draft = true
keywords = []
slug = ""
tags = ["rails", "vue", "javascript"]
title = "How to setup Vue with Rails"
toc = false

+++

This is a short post about how you can make Vue and Rails work while using Turbolinks!

## Installing Rails 5.1

> Awesomeness: Rails 5.1 will now configure Yarn, Webpack and Vue for you.

`gem install rails --pre` this will install `Rails 5.1.0`.

## Starting the project

```
rails new app --webpack=vue
```

You'll have to run following command on two terminals:

```
# on the first terminal, to start rails server
rails s
# on the second terminal, to start webpack server
bin/webpack-dev-server
```

##
