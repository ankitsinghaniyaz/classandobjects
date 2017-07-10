+++
categories = []
date = "2017-07-10T22:36:48+05:30"
description = ""
draft = false
keywords = []
slug = ""
tags = []
title = "Understanding the difference between Ruby class method and instance method"
toc = false

+++

Though this is a very simple concept. In my early days of using Ruby, I was always confused about which one to use when and why. I came up with the following way to identify if a method should be a class method or an instance method. I hope this will help you also clear the confusion.

## Class Method

I think of class methods like function which is going to deal with a collection of Object. Let's say we have a class `User` in our case and we want to get the list of all the users. This allows me to ask the question am I dealing with one user or a group of users. Here I know that I want a list of users. Therefore an instance method. Let's say we want to find the User with the best profile picture. All these methods tell us that we are dealing with multiple users and we want to operate on them. In the case of best profile picture, it is a bit more confusing as we are just going to return one instance of the User. Here is how it will look like in the code.


```ruby
class User
  def self.all
    # some logic to return all the users
  end

  def self.with_best_profile_pic
    # logic to find out the best profile pic and return that user
  end
end

# Print all the user
User.all
# Output: [<#User1>, <#User2>]

# Find a user with best profile pic in all users
User.with_best_profile_pic
# Output: <#User3>
```

## Instance Method

Instance methods deal with an individual instance of the class. In more object oriented way we would say these methods are the action which the object can take. Like again for our User class, one particular user can do actions like subscribe, log in, etc.

Here is how it will look in the code:

```ruby
class User
  def call
    # user calling action will be performed
  end
end

# we first get one of the users
sam = User.with_best_profile_pic
# then we can make that user do any action which we want
sam.call
```

> Question to ask: Am I dealing with one instance or many instances of the class?

## Conclusion

I hope that helped you in some way. Thanks for your time. Feel free to add more in the comments below!
