---
title: Reviving projects with dependency automation
layout: post-layout
tags: 'github, dependency, automation'
category: post
date: 2019-08-06
summary: >-
  Convincing your team to change up technologies can be challenging. Convincing
  my team to use GraphQL was not, mainly due to simplicity in getting a GraphQL
  prototype up and running using Apollo's Launchpad and our existing REST API.
---
# Reviving projects with dependency automation

I have fallen off writing blog posts here in the last two years, and the reason for that has been because blogging became my full-time job. I was offered a role at a new startup to write code for them, as well as, be the point person for their developer relations strategy. 100% of my blogging move to [Netlify's blog](https://www.netlify.com/blog/2017/04/20/creating-a-blog-with-middleman-and-netlify-cms/), and I was super excited about this. I had spent almost 2.5 years before writing content about my coding journey blogging on my entry-level experience. This change allowed me to work on hard problems with a new goal of sharing all my work publicly. 

The challenge of not leveraging this blog for so long is that there were maintenance challenges that prevented me from getting the blog even to run locally. In that same two years, I had moved from daily contributions to Ruby on Rails applications to writing JavaScript and React exclusively. I no longer needed to maintain Ruby versions in [rvm](https://rvm.io/) despite this blog leveraging on of Ruby's static site generators, [Middleman](https://middlemanapp.com/). I could no longer straightforward open up a terminal and ship a blog post without the headache debugging and dependency management, which causes me to focus on writing elsewhere. 

That all changed recently when [Dependabot announced its acquisition](https://dependabot.com/blog/hello-github/) by GitHub. Until opting into automated dependency updates in the PRs, I was not aware how far out of date the code for this blog became. There we are a large number of vulnerabilities and places for dependency upgrades.

![security fixes](/img/uploads/2019-08-06-security-fixes.png)

Dependabot works exceptionally well with the combination of Git Hub's automating security advisories. This feature is the same feature that loads up your notifications with warnings about vulnerabilities in your code. I spent the better part of last year ignoring them due to me not having time addressing them in all of my repositories. The beautiful part about Dependabot is that you get pull requests opened in GitHub suggesting the update as wells as providing changelogs for new versions. 

With these automated pull requests and [automated deploy previews](https://www.netlify.com/blog/2016/07/20/introducing-deploy-previews-in-netlify/), I now have the confidence to merge these updates without a ton of thought. 

![blog changelog](/img/uploads/2019-08-06-blog.changelog.png)

Now that I am supporting the latest dependencies in my project, I no have writer's block due to local environment debugging. I look forward to shipping new content on this blog moving towards consistent publishing here on out.  

If you have interest in trying our Dependabot, you can do so [easily from their Markeplace listing](https://github.com/marketplace/dependabot-preview). 
