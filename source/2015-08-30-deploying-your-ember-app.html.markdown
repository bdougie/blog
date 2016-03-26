---
title: Deploying Your Ember App
date: 2015-08-30 14:52 UTC
tags:
category: ember
layout: post-layout
summary: For every Rails app I have created and thought about creating I have used Heroku. I have never had a need to use anything else, as none of the apps I have developed had users and needed to grow beyond the same place of Heroku.
---
# Deploying your first ember app

For every Rails app I have created and thought about creating I have used Heroku. I have never had a need to use anything else, as none of the apps I have developed had users and needed to grow beyond the same place of Heroku.

It is very apparent that Heroku has cornered the market on new Rails apps and most people I know don't think twice about running `heroku create <my-app-name>`, especially with the [recent announcement from ninefold](https://twitter.com/barelyknown/status/568793801487204352) and their closing down their Rails service.

When it came time to deploy my first ember app I automatically assumed I would use Heroku, since I already had the Rails api waiting in a heroku dyno. Literally the day before I deployed my app I heard a coworker mention how another company in my previously local Orlando area deployed their ember app to a lesser know company, [Divshot](https://divshot.com/).

I wasn't aware of their service to deploy static web pages, and also was aware of an [ember-cli Divshot addon](https://github.com/rwjblue/ember-cli-divshot) that makes deploying to their service so easily. I had some issues that with getting my rails api url to get included in the config, but once I got that figured out it was a breeze to deploy. The deployment was actually so easy that I have completely discounted the need for heroku and might even transition some of my more popular static pages to the Divshot service.

If you are looking into publishing your first ember app, I highly
recommend giving Divshot a try and using the ember-cli-addon. It only
takes a few commands to get deploying.

```
$ ember install ember-cli-divshot
$ ember generate divshot
$ ember divshot push
```
