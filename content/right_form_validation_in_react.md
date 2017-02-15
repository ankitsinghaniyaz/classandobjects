+++
categories = ["validation", "javascript", "react"]
date = "2017-02-16T00:13:56+05:30"
description = "There are so many ways to validate form and inputs. What is the right way to do it? Validation gets even more complicated with React js, here is what I do"
draft = false
keywords = ["form validation", "the right way to validate form", "how to validate form in react"]
slug = ""
tags = ["validation", "javascript", "react"]
title = "The zen of form validation (React)"
toc = false

+++

Form validation is complex! With react, it gets even more complicated. In the traditional web, there are inputs and we specify the type, max, min, etc which are validated when the user submits the form. In a slightly more UX focused app you will use `jQuery` and it's plugin to give the feedback as user types and interacts with the system. You can see all types of validations happening throughout the web and here are my conclusion after doing some research. I will also share how I plan to solve this excruciating pain in React.

These are few distilled rules that I come to rely upon which can be followed. They may look very simple but difficult to get right. Here they are:

> TL;DR;

1. Validate field only when they are touched
2. If a field is changing there should be some delay before you validate.
3. When submit is attempted then validate all
4. Show error above/beside the input, also highlight the input in question.

If we are to follow these few rules then we can easily nail down validation. I will quickly and briefly describe them.

### Validate only when a field is touched

Let's say you have few fields and all are empty by default. Do you like to see all the fields marked as red before you even do anything? NO! So we should only validate fields which user has touched once. By touch I mean not just clicked in the input, it means he/she actually tries to change the value even once. Then we can keep doing validation continuously.

### Delay before you validate

I bet you have seen this, click on a field called as `email`, type the first character and you see an error, this is not a valid email. You just started and you know it's not complete yet. Give some time before you show error in these cases.


### Validate all fields on submit

Validation on submit is the only way you can validate required fields. It is only when the end user tries to submit the form you will know that he left out the required field(s). Other times we can safely assume that he is still filling in the form.


### Show error message above/beside and highlight the input in question

This is the goal why we are reading this post. The user doesn't fill in something or fills in the wrong information. We want to avoid that. So we need to show `meaningful` and `well-located` error messages. According to my reading, people say showing the error on top of the input in question is ideal, but I'm not sure on this one. All I am saying is error should be shown as close to the input as possible. Also highlighting the input is a plus to get users attention.

### Conclusion

If you follow these steps you are bound to nail form validation and UX for your application. I am also trying to solve the same problem with React, as you may know, that form validation in React is a pain. In the next article, I'll talk about how can we follow these rules and do the right things in react. I hope you liked the article, thanks for reading!
