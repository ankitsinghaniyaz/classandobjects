+++
categories = ["tutorial", "guide"]
keywords = ["using mobx and react with rails", "mobx", "rails"]
date = "2016-09-15T01:02:27+05:30"
description = "Step by step guide on how to setup rails project to use mobx and react. This can be a bit tricky, just use my react rails mobx boilerplate and get started"
draft = true
slug = ""
tags = ["react js", "rails", "mobx"]
title = "How to use React and MobX with Rails 5"
toc = false

+++
MobX is the new state management library which packs really well with react. Mobx makes things much simpler to `redux`, which is more famous in react community. I have detailed out the step on how to get started with using mobx with rails 5.

## Install [react_on_rails gem](https://github.com/shakacode/react_on_rails/blob/master/docs/tutorial.md)

To make mobx functional with rails, I had to drop `react-rails` gem and adopt the `react_on_rails` gem. Setting it up is cumbersome in the beginning but it pays off well in the long run. React on rails site have a detailed guide on how to setup react_on_rails gem, I'll just quickly brush them up.

> The below lines are just for reference, you can directly download the `react-rails-mobx-boilerplate` from my github repo and get started.

```
# adding the gem, add the below line to your gem file
gem 'react_on_rails', '~>6'

# Git commit all your changes and then
bundle

# you may need to do git commit again
# below lines will create a sample welcome controller
rails generate react_on_rails:install

# install
bundle && npm install
```

There are few things to know about `react_on_rails` gem, which can be confusing for a starter like me.

```
# You expose your react module so that it can be available outside
import ReactOnRails from 'react-on-rails';
# register you component
ReactOnRails.register({ Counter });
# you should also keep in mind that when creating new .jsx files
# you should add its path to webpack.config.js entry hash as
const config = {
  entry: [
    'es5-shim/es5-shim',
    'es5-shim/es5-sham',
    'babel-polyfill',
    './app/welcome/Counter', // like this
  ],
  .........
```

> NOTE: Make sure your Node js version is greater than 5, react_on_rails gem has this requirement.

## Add Mobx and Mobx React

```
# After previous step you will have a client folder
# inside that folder edit the package.json and add the below lines to the dependencies list

"mobx-react": "^3.5.6",
"mobx": "^2.5.1"

# If you will want to use decorators with mobx then make your .babelrc file look something like this

{
  "presets": ["es2015", "stage-0", "react"],
  "plugins": ["transform-decorators-legacy"]
}

# I was also required to install
npm install babel-plugin-transform-decorators-legacy --save-dev

# finally do npm install to install newly added dependencies
npm install
```
