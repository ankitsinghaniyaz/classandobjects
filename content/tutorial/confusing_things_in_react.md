+++
categories = ["guide", "react js"]
tags = ["react js"]
date = "2016-09-09T20:12:23+05:30"
description = "Learning react can be easy if you are well equipped, these are the top 5 things to know when learning react"
draft = false
slug = ""
keywords = "react js, react for beginners, tips and tricks, confusions",
"things to know about react"]
title = "Things Beginners Find Confusing About React.js"
toc = false

+++
React js is currently the most hyped front-end framework(view) today. I am lucky that at my current workplace I am getting a chance to explore react and rails. I am a Python lover, but I am completely open to learning new technologies. I have seen confusing things in Ruby on Rails which is very opposite to React and Javascript environment. I have pointed out top 5 reasons why React js can be confusing. So let us get started.

## 1. React is just the view layer

You will not understand what does this mean, I didn't, and it is ok. If you already do not have some understanding of what modern MVC front-end frameworks are then this definition is almost useless. In a simple way, view layer will simply mean a replacement for your HTML, CSS and Javascript(umm.. maybe). These three things make up the view of any web application. So React js provides us with a way to write things in a reusable and powerful way. You still have to do all the things like AJAX, data handling, function naming convention, etc in you own fashion. This gives you a lot of flexibility but at a reduced speed of development.

## 2. JSX is not HTML or XML

React is aimed at being developer friendly and I second it. It uses an XML-like syntax called JSX. It will look like normal HTML, but has few catches. `class` is a reserved keyword so you have to use `className`, this means you cannot use your HTML code directly, you will have to do a bunch of replacements.

```html
## Normal HTML
<div class="row" ... >
## Syntax for React
<div className="row" ...>
```
 There are other catches you need to remember, you cannot use independent HTML tags like `<br>` and `<input>`, it is required that you close them like `<br/>` and `<input />`

Always beware of these gaps as you tend to overlook them, even the error messaging cannot help you much.

## 3.  What should be a Component?

There is an opinion on what you should make into a component. There are people who believe that any piece of code that is supposed to be used again should be made into a component while other want to do so when you are dealing with states. This is not a big issue, but you will have to adjust yourself according to the developer culture you find yourself in.

## 4. Multiple syntax options

Javascript is evolving very fast with the advent of these new front-end frameworks. The current syntax is called as ES6 or ES2015, which is a bit different than the older version. This can be very confusing if you do not know this. In your quest to find something you may find resources which can be following the older syntax or the newer one.

```javascript
## Older Syntax
var aComponent = React.createClass({
  function: render() { ... }
});

## Newer ES6 Syntax
class ComponentB extends React.Component {
  render() { ... }
}
```

You can find the use of the both the syntax in React official documentation. They both work fine but try avoiding mixing them up  and stick to the newer ES6 style.

## 5. How to use it with your existing application

React is an independent layer which you will want to include in your already existing full stack solution. They could be a bit daunting. To me using webpack and browsify are a task in themselves. In Rails, we have `react-rails` gem which make the task very easy. Undoubtedly there are similar efforts in other community as well. You will find many ways to integrate react, try using the easier one and upgrade as your need increases.

## Conclusion

As my conclusion, I will say that React js seem like it will stay in the market for a long time. Even if it does not, it is very easy to learn and does not require a lot of concepts. It is fast and keeps your code DRY. You should try React if you have not tried it yet. It is fun.
