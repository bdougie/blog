---
title: adding-swipe-to-delete-toreact-native
date: 2015-12-06 18:48 UTC
tags: react-native
category: react-native
layout: post-layout
---
# Adding Swipe to Delete in React Native

Adding Swipe to Delete in React Native I am currently working on a mobile note app from the [Bloc iOS](https://www.bloc.io/ios-bootcamp) curriculum and  discovered certain things in iOS transfer over to React Native well.

A lot of iOS apps are built using the UIKit [UITableView](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/) structure (a list of items presented in rows):

![note app preview](http://i.imgur.com/8BzFCMTl.jpg)

In React Native the UITableView equivalent is called a [ListView](https://facebook.github.io/react-native/docs/listview.html). In terms of presenting the items, the UITableViews and ListViews pretty similar aside from the attribute names used to interact with them (so not that similar).

Unlike iOS, React Native takes on the challenge of being flexible enough to build mobile apps in Android and iOS, so some of the built functions like “Swipe to Delete” and [TouchableHighlight](https://facebook.github.io/react-native/docs/touchablehighlight.html)(Tap) are not included out of the box for ListViews to provide that flexibility.

<script src="https://gist.github.com/bdougie/8c9760ae1c2c792354e1.js"></script>

Having this limitation, I had to rely on a 3rd-party library to enable the deletion of a ListView. I spend some time searching for a solution and came across the [react-native-swipeout library](https://github.com/dancormier/react-native-swipeout). 

![swipeout example](http://i.imgur.com/j2GGAki.gif)

The use of this library is pretty straight forward and only requires the an import of the Swipeout component to wrap whichever component you would like to be swipeable.

You also need to add a variable (swipeBtns) containing the props for the swipe buttons.

<script src="https://gist.github.com/bdougie/1d22bf219044944f413a.js"></script>

Note that the swipeBtns holds objects within an array, allowing you to add multiple buttons to your Swipeout view. 

<script src="https://gist.github.com/bdougie/3194b635ebac34e2beef.js"></script>

This Swipeout library and React Native are still fairly new and still a work in progress, but for the functionality to delete rows in my ListView, it works great.

![finished example gif](http://i.imgur.com/jXIhYNk.gif)

If you are interested, you can view the my note app example [source code on my github](https://github.com/bdougie/BlackNotes). To checkout how “Swipe To Delete” works in native iOS apps, check out this Objective example here.

If you are interested in hearing about more details comparing React Native to Native iOS, come watch my talk at [Forward Conference](http://forwardjs.com/summit) in February 2016.
