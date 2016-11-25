+++
categories = ["javascript", "react"]
date = "2016-11-26T01:35:47+05:30"
description = "React is awesome, but the choices to create a single page app with react has challenges. Here I share the issues I faced when creating a react SPA."
draft = false
keywords = ["spa", "single page app react", "choice fatigue with react", "things to know before single page app in react"]
slug = ""
tags = ["javascript", "react"]
title = "Problem With React Single Page App"
toc = false

+++

If you are planning to create a single page app maybe you have heard people recommending React as an option. React is amazing and I am currently using React in almost all the projects. As you may have also heard that React is just the view layer so that means you will have to make choices. The choice about the state management, styling, routing,  app structure, naming conventions and much more. These choices could be fun and intimidating at the same time. I am writing this article to outline my challenges and discovery trying to create single page app using React Js.

<img src="/images/tutorial/react.png" alt="react js single page app" title="single page app issues with react"/>

## The Beginning

When I started the project I was sure that my project will be on React. I asked myself how do you start a new React project? The first crossroad was about using ES2015. I knew this was coming to all the browsers still I had to make a choice. Recently facebook has introduced a CLI for React called as React-Create-App, which will do the most recommended setup for you. I assume that you are using this CLI tool to scaffold your project. If you indeed used it, congratulations. You saved yourself the pain of setting these things:

- EsLint (Helps you follow some rules and ease error identification)
- Babel (Polyfill for ES6 and JSX syntax)
- Webpack (Handle bundling and running babel)
- [Jest](https://facebook.github.io/jest/) (Testing)

I still  think I haven't mentioned all the things that scaffolding did for you. If instead, you tread on the manual path, you will have to educate yourself about setting up webpack and babel. Differentiate testing frameworks like enzyme and jest. This knowledge is not bad, but it comes in the way of what you actually want to achieve. So this was just setting up the view layer. Let's move on.

## State Mangement

The state is the cool thing in react, which is monitored by React and whenever a state changes the view is updated automagically. Now I asked myself how will I want to manage my states? I was presented with few answers. The idealist in me said Redux, the minimalist said React States, the optimist said [MobX](https://mobxjs.github.io/mobx/). What do you choose???

If your app is simple you can just get away with React states and never know other libraries ever existed, but if it has some complex state management you may want to consider the others. Redux is the most famous, widely used and mature. If you are building something critical then Redux can give you powerful debugging and testing abilities. If you just want to avoid boilerplate code associated with Redux and want to get the React Magic in state management also, then MobX may be the right things.

After some blogs, few video lessons and a few sample projects. I decided to go with MobX, so that I have power when I need and I can avoid boilerplate as much as I can. With this checkpoint passed, you are 75% done with the setup.

> P.S. I am Rubyist, so boilerplate? NOOO!

## Routing

[React-Routers](https://github.com/ReactTraining/react-router) is the defacto way of routing with React. It also has a simple API and easy to learn. Though there are concepts like Hash History and Browser History. In short, HashHistory is ugly and not to be used in production but easier to setup. The opposite is true for BrowserHistory. In order to use this good looking, preferred BrowserHistory you have to configure the server to return the root page for anything requested. This again feels like a lot of work to me as it should have been easily available out of the box.

## CSS Inline vs Class

I am pretty sure that your app will have some form of styling. So again you will have to spend time digging through discussion and forums deciding what kind of styling you prefer. This may not be a big deal but it takes time and impact the way you structure your project.

## Application Structure, File Name Conventions

Again not a difficult part but I like to follow some well-defined conventions so that I do not have to overload my brain with deciding where to place my files and how will I want to name them. Like my `<Toolbar />` should live in `toolbar.jsx` , `toolbarComponent.js`, `Toolbar.componet.js`, ....

I think you get the problem. All these options are logically sound and our mind seems to adapt and learn more patterns as we advance in the project. Some time later I may feel bad about the names I chose a few months back.

## Conclusion

Please see these are the things which I find challenging and believe someone will feel the same. If you are fine with all these work I respect your views and choices. I am completely for the React and I love it, but surely this issues warrant my attention to other notable frameworks like [ember.js](http://emberjs.com/). I will like to try out Ember and see how it fits my style of development. I will soon be doing a post on my choices and how I tackled all these problems in the React ecosystem. Then I will redo the same things with Ember and try to note my experience with the same.

If this post helped you in any way, I would love your appreciation below. Thanks for reading.
