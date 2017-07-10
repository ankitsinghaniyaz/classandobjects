+++
categories = ['ruby']
date = "2017-07-10T23:04:59+05:30"
description = "There are many ways to define a method in Ruby. Read for youself and find out which one is best for you."
draft = false
keywords = ['ruby', 'how to pass parameter to a method in ruby', 'pass variable number of params in ruby' ]
slug = ""
tags = ['ruby']
title = "4 ways to pass parameters to a method in Ruby"
toc = false

+++

Recently I have been dreaming and talking a lot about methods. Here are few cool things which I discovered on my way to get better at Ruby. I'll talk about different ways in which we can pass parameters to a method. Continue to find out how many of them did you knew already. You can read my [difference between class methods and instance methods](/tutorial/instance_method_vs_class_method_in_ruby/) for some more fun.

## The common method

```ruby
def full_name(first, last)
  "#{first} #{last}"
end

full_name('sam', 'smith')
=> "sam smith"
```

## Named parameters

```ruby
def parse(name: 'Jhon', hero: 'superman')
  "I am #{name}, the #{hero}"
end

parse
=> "I am Jhon, the superman"

parse(name: 'Harry Potter', hero: 'wizard')
=> "I am Harry Potter, the wizard"

parse(name: 'Luffy', food: 'meat')
# ArgumentError: unknown keyword: food
```

## Any number of unnamed parameters

```ruby
def attributes(*args)
 args.join(', ')
end

attributes('hi', 'how', 'are', 'you')
=> "hi, how, are, you"
```

## Any number of named parameters

```ruby
def fields(args = {})
  args.each do |k,v|
    puts k, v
  end
end

fields(name: 'adf', fasd: 'fasd')
name
adf
fasd
fasd
=> {:name=>"adf", :fasd=>"fasd"}

```

## Conclusion

We can do mix and match of all these different ways of sending params and create a very robust method. I hope you find this helpful. If I missed somthing do let me know in the comments below. Thanks for reading.