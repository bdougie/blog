---
title: Setting up Bootstrap in Ember in 2 steps
date: 2015-07-06 07:05 UTC
tags:
category: ember
layout: post-layout
summary: Switching to Ember from Rails or plain html has been a learning
experience.
---
# Setting up Bootstrap in Ember in 2 steps

Switching to Ember from Rails or plain html has been a learning
experience for me. Certain things that came so easy previously had to be
relearned with an understanding of the Ember way, which is not exactly a bad thing. 

With my first Ember project I needed to implement a quick grid design
and assest associated with [Bootstrap](http://getbootstrap.com/) and
need to install it in the project.

My first thought was to include it in the `index.html` file, but that
did not work. I later found [ember-bootstrap](https://www.npmjs.com/package/ember-bootstrap) and installed via the ember-cli.

```
$ ember install ember-bootsrap
```

After installing it did not work until I included Bootstrap in my
`Brocfile.js`, which turned out to be the reason it wasn't working in
the first place.

```
# Brocfile.js

var app = new EmberApp({
+  'ember-bootstrap': {
+    'importBootstrapTheme': true
+  }
});
```

Now with Bootstrap installed I am able to carry-on slinging together my
simple design for side projects.
