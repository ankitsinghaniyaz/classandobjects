+++
title = "Right Way to Use CSS Varialbes in a Vue, Inspired by Tailwind.css"
description = "CSS variables are not widely supported in all the browsers today. Understanding how to structure and use them in our Vue application can give us super powers to write a more consistent frontend application. I also share how I enable CSS variables in my Vue application inspired by Tailwind.css"
tags = ["css", "vue"]
keywords = ["vue css variables", "css variables in vue", "css", "vue", "better design in vue", "tailwind with vue"]
date = "2019-03-29T09:59:20+05:30"
categories = ["css", "vue"]
toc = false
slug = ""
draft = false
+++
I can never emphasise enough on how Vue makes my life easy but I definitely want to work more in Vue if I'm doing frontend development. One issue that I face when building Vue applications using single file components(SFC) is about sharing the common style across components. There is no easy way to do this and most of you will be fine doing a copy paste of the styles across the components.

Another cool project that I like is [tailwind css](http://tailwindcss.com/). I like the idea of how we can have CSS utility classes and build things fast. If I were to summarize my take away from using this library they would be:

#### Negetives

- memory overload - a lot of too and fro to guess/find the class names.
- reduced readability - I like my markup to very concise and readable but with such extended list of classes on a single tag they tend to run out of my viewport and wrap around, which is something I detest.
- costly extractions - In Vue generally most of my CSS is scoped so I can leave the utility class names as is or extract them as tailwind suggest, this operation looks costly to me.


#### Positives

- uniformity - the idea of having a standardized set of values used across the app. I more often than not end up using arbitrary values for padding, margin, the colour which is not a good thing for a long term project. The idea of having specific tweakable values which can be used app-wide is such a blessing.
- fast prototyping - once you get the hang of class names you can do things very fast


So from here, I know that I want the uniformity aspect of the code but I also want the ability to write idiomatic BEM based class names. So how do we do this?

I started out by extracting the very well defined constants in the `tailwind.js` file as CSS variables. Now I access these variables throughout the application. To make it work with the view we will need to follow the following steps.


1. Create a file `src/assets/css/constants.css`
2. Copy the content of [this gist](https://gist.github.com/ankitsinghaniyaz/382ac9a5cb8c6a97cc731ff5cf14c704) to the above CSS file.
3. Import the CSS file like in you `main.js` file like `import '@/assets/css/constants.css'`
4. Now all the variables defined in the constants file are available in all our components. Really neat!


Here is an example of how my styles section of a component will look like:


```css
.movie__header {
  margin: var(--spacing-4);
  color: var(--grey--darker);
}
```

So now we can use these CSS variables in any component and have our app use standard measures. I hope you like the post. Do let me know your thoughts in the comments. Thanks for reading. :)

