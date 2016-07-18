---
title: Adding SEO To Your Middleman Site
date: 2016-03-26 09:29 UTC
tags: blog, middleman
category: react
layout: post-layout
summary: Learn how to implement SEO in your middleman site
---
# Adding SEO to your Middleman Site

[Middleman](https://middlemanapp.com/) is a [static site generator](https://davidwalsh.name/introduction-static-site-generators) built in Ruby. This site is actually built using Middleman.

Very recently I started working on a project at work that required me to
consider SEO on the project. I have never considered how any project I
have worked up to this point will be crawled on Google until this
project, including this Blog. 

My assumption is that through a long tail of existence on the web my
blog will eventually be found and considered useful. Little did I know,
I could actually help Google find my blog with SEO.

![blog seo example](http://i.imgur.com/LV7hjCz.png)

## Meta Tags

Meta Tags are low hanging fruit in SEO. When you do a Google search and
get results, each result includes 3 things: a title, a link, and a
description.

The 3 things are sourced from the site's meta tags. In HTML you can set
your meta tag easily by adding to your document's `HEAD`.

```
<!doctype html>
<html>
  <head>
    <title>This Developing Journey</title>
    <meta name="description" content="Discoveries into Go, JavaScript, and Ruby">
    
    ...
  </head>
  <body>
    ...
  </body>
</html>
```

Middleman is served by Ruby and naturally user a ruby file to serve
HTML. You can edit your Middleman site title and description in the `layout.html.erb`.

## Sitemap

Once you have meta tags, you can proceed with making a [site map](https://en.wikipedia.org/wiki/Site_map). A site map is a list of pages of a web site accessible to crawlers or users (from [Wikipedia](https://en.wikipedia.org/wiki/Site_map)). 

A sitemap is not needed to be crawled, but you are basically helping
google find your site much faster, which means when people are
searching how to create [static sites in
Haskell](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=static+site+generator+in+Haskell), your
project will rank higher much faster.

In Middleman you can add a sitemap in a number of ways. The way I
approach it is to be able to generate a sitemap automatically. My blog
gets a new post once or twice a month (hopefully sooner in the future)
  and the sitemap will need to be updated when new pages/posts get
  added. 

  I added the [middleman-search_engine_sitemap](https://github.com/Aupajo/middleman-search_engine_sitemap) gem to my blog and added the following code to my `config.rb`.

```
page "/sitemap.xml", :layout => false

# Sitemap
set :url_root, 'http://developingjourney.netlify.com/'
activate :search_engine_sitemap
```

By default, the generator will update once a month. You can now
confirm this all works by going to your site's root url
`/sitemap.xml`. If you see something there, you did everything
correctly, You check on this site [here](http://developingjourney.netlify.com/sitemap.xml).

## Submit your site to Google

Now that meta tags and sitemap are out of the way you can now let
Google know your site exist.

This step comes with disappointment, because it is too easy. The only steps are:

1. Enter your site's URL in the form
1. Completing the CAPTCHA.

![submit your url image](http://i.imgur.com/Feuequv.png)

Once submitted the Google Robots will walk through your site and
rank you with their [famous PageRank algorithm](http://checkpagerank.net/).

That is all, now go and update your site.
