+++
categories =  ["rails", "javascript"]
date = "2017-03-10T19:02:43+05:30"
description = "All Rails dev need javascript support for their project. This is how webpack and yarn can be used with ease"
draft = false
keywords = ["rails", "webpack", "rails 5", "yarn in rails"]
slug = ""
tags = ["rails", "javascript"]
title = "Using Webpack and Yarn with Rails 5"
toc = false

+++
Rails is awesome, agreed? Everyone understood that JavaScript is coming huge and there has to be a community-specific way to integrate React, Angular or [Vue](https://vuejs.org/) with a rails project.

There have been partial successful attempts like like [react-rails gem](https://github.com/reactjs/react-rails), [react-on-rails](https://github.com/shakacode/react_on_rails), webpack-rails, etc to help user bring JS in. Still, they all lacked somewhere. So here comes all new [Rails 5.1](weblog.rubyonrails.org/2017/2/23/Rails-5-1-beta1/) with **webpack** and **yarn** integrated.

You don't need to wait for 5.1 to release or try its beta version, all these is is now available via the gem [webpacker](https://github.com/rails/webpacker). In this post I'll cover how we can pull in this gem and start our JavaScript love story in the Rails land gracefully.

I am doing a post on how to integrate Vue and Rails, so this is a follow up for how to get the app up and running.

## Setting up the Webpacker gem

Add the following line to your `Gemfile`:
```ruby
gem 'webpacker', github: 'rails/webpacker'
```
then run the following commands from your bash:

```bash
# to install the new gem
bundle
# to configure webpack
bin/rails webpacker:install
```
This will generate an `app/javascript` directory for you. All of the files can now use `ES6` syntax. These files will be compiled and available in your `/public` folder.

## What next?
You can now create a file in this javascript directory and then we can refer them from any file like:

```erb
<%# like in app/views/layout/application.html.erb %>
<%= javascript_pack_tag 'calendar' %>
```
`javascript_pack_tag` is helper provided to bring in this files. This will basically import the compiled version of `app/javascript/calendar.js`

So now we have written our first file and we want to use that, so we will want to have our webpack transpile these file for us. We can do so by running the command below in a separate terminal.

```bash
./bin/webpack-watcher
```

This will keep watching for all the changes we make to our file and bundle them.

## Installing packages

You should also see a `package.json` file created in your root which allows you to bring in any npm or bower packages. Let's say we want to install [lodash](https://lodash.com/), we can simply do:

```bash
yarn add lodash
```
and now you have this npm asset available along with your rails assets pipeline, pretty cool huh?

This is very powerful if you don't know. Previously rails developer need to be dependent on some wrapper gem, which will most probably not updated very frequently. So this saves us all those headache.

## bonus!

The webpacker gem tries to help you start your project with ease and thus come with preconfigured with react, vue and angular. You can start using anyone of them with the respective command below:

```bash
rails webpacker:install:react
rails webpacker:install:angular
rails webpacker:install:vue
```

## Conclusion

There are still few things like getting all of these to work while keeping `turbolinks` and how to structure the code. All these things are yet to get more concrete. In the meanwhile, whatever we have now is pretty powerful and helps achive a lot. I hope you find this post helpful. Thanks for reading.
