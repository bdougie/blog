---
title: Managing Remote Data Flow in React
layout: post-layout
tags: 'react, graphql, apollo'
category: react
date: 2017-01-31T19:03:06.924Z
summary: >-
  Within the past year I have discovered different ways to solve the same
  problem — managing the increasingly complex data requirements of modern
  web/mobile apps. In this talk I will go through my talk through how to manage
  data in a React client application, using 5 of different techniques including
  starting with Promises and eventually getting to how I now got to GraphQL.
---

# Managing Remote Data Flow in React 

<iframe width="560" height="315" src="https://www.youtube.com/embed/WNLR2u7Pk3M" frameborder="0" allowfullscreen></iframe>

**slides for this talk are at http://apple-bottom-jeans.netlify.com/*

React is a powerful tool to create UIs and it does a great job of getting out of the way when it is not needed. Thanks to this it has enabled front-end developers to focus on other issues including managing data. Thanks to React’s ability to manage these UIs my sole job has been connecting APIs. 

Over the past year, I have created a number of React and React Native applications that use different methods for handling data. When I first began using React a year ago the pressure was on to learn Flux, primarily Redux, but I chose not to in favor of just learning React. On the way to eventually learning Redux, I played around with different data management tools to figure out when the best use case is for each of them. 

Out of the box React provides the ability to manage data using state and component lifecycle methods. In most cases beginning a new app with React’s built in API is more than enough to manage data, this is my preference for beginning new apps is this in most cases and will be explained further with examples in my talk of how far you can take this in your app. 

When I am managing multiple REST endpoints from an API I tend to pull in projects like react-resolver and react-transmit. Both libraries enable me to fetch data from my APIs and attached the returned Promise of JSON to my component’s props for ease of use. These projects both keep me close to how React works out of the box and does not require a large amount of overhead in my projects until needed. 

GraphQL has gained more popularity since coming out of developer preview at the end of the summer of 2016 and has become more of an option for managing data. Tools like Relay and Apollo make managing data from a GraphQL API manageable and also has the ability to attach itself to the props of a component. I am convinced that GraphQL is the best option and the tooling is getting better with GraphiQL and services like Scaphold and Graphcool. I will walk through how quickly you can bootstrap a simple app using these tools as well.

React prides itself on a being a small API, which is why I try to use every tool sparingly and explain each use case while weighing their pros and cons and when to use the right tool for the job in my talk at ReactSF.  
