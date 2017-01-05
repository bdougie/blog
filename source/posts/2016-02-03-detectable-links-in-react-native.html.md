---
title: Detectable Links in React Native
date: 2016-02-03 05:39 UTC
tags: react-native, ios
category: react
layout: post-layout
---

# Detectable Links in React Native

Having  some  iOS knowledge, I have a good idea on how to get things done in the Standard NSLibrary.

My most recent goal in my React Native Note App is auto detect links. This is actually pretty trivial in iOS and easily accomplished by wrapping [NSDataDetector](http://nshipster.com/nsdatadetector/) around the suggested text content. 

```
NSDataDetector *detector = [NSDataDetector 
  dataDetectorWithTypes: NSTextCheckingTypeLink | NSTextCheckingTypePhoneNumber
]
```

Unfortunately there is library that quite does it all in JavaScript (That I could find). I did find a tool that does half the job and its [AutoLinker](). The AutoLinker library will convert any potential links in the suggested text and convert it to raw html.

```
let htmlRenderedNote = AutoLinker.link(noteText, {phone: true, email: true});
```

Since I couldn’t just display the raw html on an iPhone and expect users to figure it out, I needed something that could render the this markup.

I eventually found the [react-native-htmlview]() library, which allows me to pass raw html to a HTMLView component and have it render clickable links.

This was a very nice tool to get me almost there, but I still needed the links to open their respective apps when clicked  — For example, If I had a email link, I needed it to open the mail app.

<script src="https://gist.github.com/bdougie/f354ffa7bcb71f69989e.js"></script>

To accomplish this basic app/link routing I used the [LinkingIOS](https://facebook.github.io/react-native/docs/linkingios.html) library, which comes from the Standard React Native library.

<script src="https://gist.github.com/bdougie/3d18460700dffaba2e99.js"></script>

Putting this all together I now have what I was looking for and that’s detectable links in my note app. This was definitely a lot more steps than can be done in a Swift/iOS combo, but that has more to do with React Native being such a young framework. I am sure as time goes on, some steps can be combine together.

![app gif](http://i.imgur.com/ZAfidxZ.gif)

You can see the code complete implementation [here](https://github.com/bdougie/BlackNotes/blob/e5a9113ae15de4cb859292d6959db8db87746ea5/App/Components/ViewNote.js).

