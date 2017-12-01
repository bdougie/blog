---
title: Getting GraphQL in your API
layout: post-layout
tags: 'graphql, apollo'
category: graphql
date: 2017-12-01T18:09:27.491Z
summary: >-
  Convincing your team to change up technologies can be challenging. Convincing
  my team to use GraphQL was not, mainly due to simplicity in getting a GraphQL
  prototype up and running using Apollo's Launchpad and our existing REST API.
---
#Getting GraphQL in your API

[GraphQL](http://graphql.org/) is a query based language for APIs. GraphQL provides a better way to request data from your existing API that can potentially speed up the development experience.

A common misconception of GraphQL is that it needs to replace your current REST API, and this is not the case. I was able to add GraphQL to Netlify's current API with a low amount an effort.

Netlify has a [public REST API](https://www.netlify.com/docs/api/) that I am leveraging for a side project, [a mobile app](https://github.com/bdougie/PocketDeploys) to manage the deployment of my personal projects. From my initial investigation I found it to be a great fit for leveraging GraphQL. Netlify is not only a big proponent of the [JAMstack](https://jamstack.org/), we are also consumers. This architecture made it easy to a GraphQL layer in between my client-side application and the existing API.

![graphql-jam](/img/uploads/jamstack-graphql.png)

I initially tried a number of tools to add GraphQL to the Netlify API, but most took a lot of work and required me to take away bandwidth from the API team. In an effort to not take up too much time on this internal side project, I looked into [wrapping the REST API in GraphQL](http://graphql.org/blog/rest-api-graphql-wrapper/).

The [Meteor Development Group](https://www.meteor.io/) have been working on an universal GraphQL API called the, [Apollo project](https://www.apollographql.com/). Out of that project came a new project, called [LaunchPad](https://launchpad.graphql.com/new), and it was my saving grace in getting GraphQL working in a few hours. LaunchPad is like the [CodePen](https://codepen.io/) for schemas and was the easiest way for me to get started with GraphQL. After some initial research I had a working endpoint in a few hours, which is live at [launchpad.graphql.com/m1wl39p39](https://launchpad.graphql.com/m1wl39p39).

![grpahql-jamstack](/img/uploads/launchpad-graphql-jam.png)

By wrapping the API layer in the LaunchPAd GraphQL interface, I was able to not only get GraphQL into my project, but I was also able to sell GraphQL as a viable option for the rest of the team. As of last September, we got the green light for a public GraphQL API.

If you have are looking to wrap integrate GraphQL into an existing API, consider wrapping your existing API in a GraphQL layer.
