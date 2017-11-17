+++
categories = ["rails", "vue"]
date = "2017-11-17T10:58:41+05:30"
description = "As a Rails developer generators are a crucial part of the daily workflow. Sometimes we do repeated tasks like the creation of files, directory structure and boilerplate code. In this article, we see how to create a Rails generator for Vue files."
draft = false
keywords = ["creating a generator in rails", "rails generator for vue", "custom generator rails"]
slug = ""
tags = ["rails", "vue"]
title = "Creating a Generator in Rails for Vue files"
toc = false

+++

When learning Rails we all learn about generators. I still remember when I saw it for the first time. I just fell in love with it. Writing a single command can create useful files and directories for me. Until recently I never had a chance to create a generator. Yesterday I did a blog on [using Vue.js with Rails](https://www.classandobjects.com/tutorial/using_vue_js_with_rails/) and I saw that I had to create a few files every time I wanted to add Vue to a view. So I went ahead and created a generator that will create all the files and folder structure for us. Here is how it is done.

### Generate the Generator

Rails has a [ generator to generate a generators ](http://guides.rubyonrails.org/generators.html). That was difficult. ;)

```bash
rails generate generator vue
```

This will create a file structure like this.

```yaml
lib/generators/
└── vue
    ├── templates
    │   ├── html.erb
    │   ├── javascript.erb
    │   └── vue.erb
    ├── USAGE
    └── vue_generator.rb
```

Let's know what each file is about.

- **USAGE** - This file gives useful hints and help when we run the help command on any generator. In our case if we run `rails g vue --help` it will show us all the helpful details. We will look into the content of the file in a while.
- **vue_generator.rb** - This is the main file where all our logic lives. The interesting thing about this file is that when we call generator all the public method in this files are called in the order of their definition.
- **templates** - It is the directory where we define template for all the files that we are going to generate. We will understand this better as we see the source code.

### Vue Generator Source Code

Here is how our `USAGE` file looks like.

{{< gist ankitsinghaniyaz 89d27b79844d51bfbe523abfb23a885d >}}

Here is how running the help command will look like.

```bash
aks:shareito$ rails g vue --help
Running via Spring preloader in process 12007
Usage:
  rails generate vue NAME [options]

Options:
  [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Create Vue files corresponding to the Rails views

Example:
    rails generate vue [namespace]/[controller]/action

    This will create:
        app/javascript/packs/[namespace]/[controller]/action.js
        app/javascript/views/[namespace]/[controller]/action.vue
        app/views/[namespace]/[controller]/action.html.erb
```

Here is our `vue_generator.rb` file.

{{< gist ankitsinghaniyaz  b6095914b8b2219d943b12bdafa4b6f9>}}

All the templates below are ERB files which allow us to use methods and variable to create custom content.


{{< gist ankitsinghaniyaz  66d9515080cd2946d18d5ea3e1898c59>}}

That is all the thing required to create a generator in Rails. Let's see an example and what files are generated.

```bash
aks:shareito$ rails g vue  posts/index
Running via Spring preloader in process 12848
      create  app/javascript/packs/posts/index.js
      create  app/javascript/views/posts/index.vue
      create  app/views/posts/index.html.erb

```

as we can see the specified three files have been generated. Let's checkout their content.

{{< gist ankitsinghaniyaz  66d9515080cd2946d18d5ea3e1898c59>}}

And all these files are created perfectly namespaced for us.


### Conclusion

I hope it was fun reading this article. If you have any suggestions do let me know in the comments below. I would love to take up the next challenge and put this generator into a gem. Let's see how that goes. Thanks for reading. :)

