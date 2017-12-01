---
title: Migrating from the Graphcool Web UI to the Graphcool Framework
layout: post-layout
tags: graphql
category: graphql
date: 2017-12-02T13:22:18-08:00
summary: >-
  Graphcool has released a new framework to improve the standards around getting
  a GraphQL server up and deployed. But what about the people have already been
  using the Graphcool web UI. This is a tutorial migrate your existing project
  towards to the new Graphcool Framework.
---
# Migrating from the Graphcool Web UI to the Graphcool Framework

I have been using Graphcool for about a year now and have had my [Open Sauced](https://github.com/bdougie/open-sauced) for closer to 7 months now. The hosted version of Graphcool is amazing and everything I needed, at least until they announced the [Graphcool Framework](https://blog.graph.cool/graphcool-framework-preview-ff42081b1333). This framework is a way to the build standards and better practices around getting GraphQL servers up and deployed. 

Though I could continue using the web interface, the future of the platform is moving towards this framework. Graphcool took note that the web UI became cumbersome to navigate with larger teams and projects. 

The Framework's announcement came with instructions on how to migrate to your existing Graphcool projects but I found them limiting. This is my attempt to provide a more verbose guide for this migration. 

## 1. Upgrade your Project

The first step to migrating to the framework is upgrading the web UI to use it. This will make your schema and console read-only but also do the neccessary changes to make your project CLI ready. 


*If you would like to learn more about my project, check out this [post I wrote on Netlify](https://www.netlify.com/blog/2017/05/16/using-graphql-to-manage-open-source-repositories/) that goes into more detail.*
