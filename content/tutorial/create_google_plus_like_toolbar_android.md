+++
categories = ["guide", "tutorial"]
date = "2016-09-20T21:46:00+05:30"
description = "Creating an Android toolbar can be sometimes challenging. Create a bottom toolbar like google plus with button feedback, touch effects and lot more."
draft = false
keywords = ["android bottom toolbar", "tutorial", "create toolbar", "android", "bottom" , "how to"]
slug = ""
tags = ["Android"]
title = "Best Way To Create Bottom Toolbar Like Google Plus Android App"
toc = false

+++

Android [toolbar](https://developer.android.com/reference/android/widget/Toolbar.html) is a neat functionality which replaces the old Actionbar. If you want to create a traditional looking, top positioned toolbar then this article is not for you. If you are looking for something in the line of Google plus bottom bar and have the ability to customize it then you should keep reading. Here are few screenshots to demonstrate what I mean.

<img src="/images/tutorial/google_plus.png" alt="google plus bottom toolbar screenshot" title="Google plus bottom bar screenshot" style="width: 300px; padding-right: 30px;"/>
<img src="/images/tutorial/quoted.png" alt="quoted android app screenshot" title="Quoted Android app screenshot" style="width: 300px"; padding: 20px;"/>

## The Layout

Few thing to know before we start, I will not use `menu` options, it makes the toolbar creation easier but takes away the power to customize. I am also using `svg` imported images as my buttons. This allows me to alter their size on the go without loosing the quality. I will share the code snippets directly and explain as I go, so let us dive into it.


{{< gist ankitsinghaniyaz 9f36098bc29446e46ea2bd89b1d15664 >}}


## Adding Background To Image View Buttons
As you will see above in the button level `LinerLayout`, we have a background. You will need to create few drawable files as I will show below. If you do not specify this, the effect which you see when you touch a button will be absent. In some cases when you use svg or png images they may not even appear proper. Here is what you need to put into your drawable folder.


{{< gist ankitsinghaniyaz e2e3677bb1a6babc0ff881a6ad26387f >}}

## Adding Touch Feedback on Click

You may also want to enable a little haptic touch feedback. This can be done easily. Make sure you `hapticFeedbackEnabled="true"` in your button and wherever you are listening to the button, just add the following line.

```java
public  void toggleFont(View view) {
  // this line will enable haptic feedback
  view.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
  Log.d(TAG, "toggleFont");
  //... do more
}
```

You can try out this feature on my live app [Quoted](https://play.google.com/store/apps/details?id=com.classandobjects.quoted), which helps you *explore and share quotes*.
## Conclusion

As you may see implementing a bottom toolbar in android with all functionality is easy. It is just that we have to hunt for information and gather it. I hope you find this article informative if yes do not forget to subscribe. If you have any doubt feel free to leave comments below or email me. Thanks for reading.
