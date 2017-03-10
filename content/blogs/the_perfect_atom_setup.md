+++
categories = ["editor", "atom"]
date = "2017-03-10T19:02:13+05:30"
description = "If you love atom like me, this is how you can enhance it to be your best companion."
draft = false
keywords = ["atom configuration", "perfect atom setup", "best atom configuration"]
slug = ""
tags = ["editor", "atom"]
title = "The Perfect Atom Setup"
toc = true

+++
<img src="/images/blogs/atom_logo.png" alt="atom editor" title="The ultimate editor atom" style="padding-right: 30px;"/>

I love my editor, Atom. I have tried most of them out there and still, I always come back to this one. It is not perfect but I find my peace in its imperfection. Here are few things I do to make my Atom awesome.


## Making it beautiful

I am a connoisseur when it comes to beauty. If you want me hooked, be beautiful. I love beautiful code and here is what I do to make my editor look beautiful.

### UI theme

I use [Atom Material UI](https://atom.io/themes/atom-material-ui), there are people who may not like this theme but I perfectly adore this.

```bash
apm install atom-material-ui
```


### Syntax Theme

This is the most important things you can have in your editor, the right syntax colouring can do magic. This can increase your productivity, reduce eye strain and make the work enjoyable. I take my eyes very seriously so should you. I use [Spacegray Atom Dark Syntax](https://atom.io/themes/spacegray-atom-dark-syntax).

```bash
apm install spacegray-atom-dark-syntax
```

The syntax highlighting in VS Code is better than Atom, but that is a discussion for another day.


### Font Face

The font I personally use is [Source Code Pro](https://github.com/adobe-fonts/source-code-pro), I also like to use [Fira Code](https://github.com/tonsky/FiraCode) for its symbol translations.

## Making it powerful

Atom is modular in structure and everything can be added as a package. Here are few packages I use to speed up my workflow.

### Auto close HTML
This is a huge time saver, helps me [autoclose HTML tags](https://atom.io/packages/autoclose-html).
```bash
apm install autoclose-html
```

### Fold Function
If you have ever navigated a huge codebase you know how many functions it can have and this package helps [fold functions](https://atom.io/packages/fold-functions) and just see their prototype.
```bash
apm install fold-functions
```

### Minimap

This seems like a useless plugin, but I miss it when it's not there. I use it to [scroll and navigate](https://atom.io/packages/minimap) the codebase.
```bash
apm install minimap
```

### Highlight Selected

This is a must have. Most of the editor has this built in, but we can always install the extension in the atom and make it work. It helps me [highlight a word and find all its instances](https://atom.io/packages/highlight-selected).

I also install a version which shows [highlighted words](https://atom.io/packages/minimap-highlight-selected) in minimap too.
```bash
apm install highlight-selected
apm install minimap-highlight-selected
```

## Linting

I use Ruby and JavaScript most of the times and my projects have linting configured, so I like to see the error as I code. So I use [ruby lint](https://atom.io/packages/linter-ruby) and [eslint](https://atom.io/packages/linter-eslint).
```bash
apm install linter-ruby
apm install linter-eslint
```

## Conclusion
For someone who is interested this is how my editor looks like:
<img src="/images/blogs/my_atom_preview.png" alt="Quoted Android App" title="Quoted Android App"/>

If there is anything that you feel I should try, feel free to let me know. My arsenal is always empty for cool technologies. Thanks for reading.
