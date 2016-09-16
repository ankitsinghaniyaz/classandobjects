+++
categories = ["tutorial", "guide"]
date = "2016-09-16T22:35:37+05:30"
description = "Subscribe button are crucial to engage your loyal audience. Create a subscribe button for your static site. Also add a on scroll pop up for subscribers."
draft = false
keywords = ["add subscribe button",
  "subscribe button on static site",
  "subscribe form on scroll"
]
slug = ""
tags = ["javascript", "blogging", "hugo"]
title = "Add Subscribe Button to Your Website, also Add a Scroll Triggered Subscribe Box"
toc = false

+++
Subscribe button is a useful feature to have on any website. It helps you create loyal audience base and helps your users get amazing content from the blogs they love. It can be quite easy to integrate one on a WordPress site or a website with a backend. In this article, I will show you how to add a subscribe button to any static website using [formspree.io](www.formspree.io), [Vex js](https://github.com/hubspot/vex) and javascript. I will also show how you can add a subscribe box(popup) when a user has scrolled the page. I am using Hugo as my static site generator, the process is exactly the same for any static site. So let's get started.

## Setup Vex js

I did my little research and found out Vex js is the best dialogue(popup) creator library. It is **light, good looking and has zero dependencies**, and that is all we need. First, you will need to [select a theme](http://github.hubspot.com/vex/api/themes/), visit the link to see examples of all the themes which you can use. Select the one you like and download it from here. Also download `vex-theme-bottom-right-corner`, if you want to do a subscribe popup after scrolling your page. You will need to [download vex.combined.min.js](https://github.com/HubSpot/vex/tree/master/dist/js) from this link. Make sure you have one theme CSS file and one Vex combined js file. Now you will want to store this file to your static directory, where you have your Javascript and CSS.

> NOTE: Skip to the next step if you are not using HUGO.

In case of Hugo, I will put it under the themes as follow:
```
/themes
  /theme-name
    /js
      vex.combined.min.js
    /css
      vex-theme-name.css
```

## Add a subscribe button

Now, after having set up Vex, we want a form to be shown to the user when  they click the Subscribe button.

```

<!-- for normal HTML -->
<!-- include css and js like this -->
<script src="path/to/myscripts.js"></script>
<link rel="stylesheet" type="text/css" href="path/to/mystyle.css">
<!-- most of the times they are included in the `footer` partial in Hugo. -->
```

```
<!-- Add this button in your html file -->
<button onclick="subscribe()">Subscribe</button>

<script>
function hide (elements) {
  elements = elements.length ? elements : [elements];
  for (var index = 0; index < elements.length; index++) {
    elements[index].style.display = 'none';
  }
}

function subscribe() {
    // replace vex-theme-plain with the name of your theme
    vex.defaultOptions.className = 'vex-theme-plain';
    var vexId = vex.dialog.open({
    message: 'Get latest updates, enter your email:',
    input: [
        '<input name="email" type="text" placeholder="jhondoe@domain.com" required />',
    ].join(''),
    buttons: [
        $.extend({}, vex.dialog.buttons.YES, { text: 'Subscribe' }),
        $.extend({}, vex.dialog.buttons.NO, { text: 'Back' })
    ],
    callback: function (data) {
        if (!data) {
                }
                else {
            var email_value = data.email;
                        var form = document.createElement("form");
                        form.setAttribute('method',"post");
                        //replace below email with your email
                        form.setAttribute('action', "http://formspree.io/classandobjects@gmail.com");

                        var input = document.createElement("input"); //input element, text
                        input.setAttribute('type',"email");
                        input.setAttribute('name',"email");
                        input.value = email_value;

                        form.appendChild(input);
                        form.submit();
        }
                // In most cases you wont need the below line, but after clicking submit or cancel if the box does not closes for some reason, you will want to uncommnet the line below.
                // hide(document.querySelectorAll('.vex'));
    },
    });
}
</script>
```

In the above example just replace classandobects@gmail.com with you own email address and the theme name with your selected Vex theme. This should be enough to get you started. Formspree.io allow you to get 1000 emails for free and is fairly easy to use. Until now you have implemented a subscribe option like the one you get when you click the `envelope` icon on your left.

> TIP: You will have to verify the first email you get via formspree.io

## Bonus, Adding a subscribe form on scroll

Try scrolling below on this site and as you reach around **70%**, you get a popup to subscribe. You should continue this step if you want to implement something similar to this.

> NOTE: `jQuery` is a requirement for this step. There are high chances that you are already using jQuery.

```
<script>
  function createSidePopup() {
    if (document.querySelectorAll('.vex').length == 0) {
        vex.defaultOptions.className = 'vex-theme-bottom-right-corner';
        var vexId = vex.dialog.open({
        message: 'Why not subscribe for more! Email Please',
        input: [
            '<input name="email" type="text" placeholder="jhondoe@domain.com" required />',
        ].join(''),
        buttons: [
            $.extend({}, vex.dialog.buttons.YES, { text: 'Subscribe' }),
            $.extend({}, vex.dialog.buttons.NO, { text: 'Back' })
        ],
        callback: function (data) {
            if (!data) {
                    }
                    else {
                var email_value = data.email;
                            var form = document.createElement("form");
                            form.setAttribute('method',"post");
                            form.setAttribute('action', "http://formspree.io/classandobjects@gmail.com");

                            var input = document.createElement("input");
                            input.setAttribute('type',"email");
                            input.setAttribute('name',"email");
                            input.value = email_value;

                            form.appendChild(input);
                            form.submit();
            }
                    hide(document.querySelectorAll('.vex'));
        },
        });
    }
}

function onScrollSubscribePopup () {
    {{ if .IsPage }}
    $(document).ready(function() {
        $(window).scroll(function(e){
            var scrollTop = $(window).scrollTop();
            var docHeight = $(document).height();
            var winHeight = $(window).height();
            var scrollPercent = (scrollTop) / (docHeight - winHeight);
            var scrollPercentRounded = Math.round(scrollPercent*100);
            if (scrollPercentRounded > 70 && scrollPercentRounded <     80) {
                createSidePopup();
            }
        });
    });
    {{ end }}
}
</script>
```

The code to calculate the scroll percentage has been taken from this [codepen](https://codepen.io/achudars/pen/Cpast).

## Conclusion

I believe this post was helpful for creating a subscribe button. If you find any issue with the above code or need any help do let me know in the comments below. Thanks for reading!
