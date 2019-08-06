---
title: Consistently Random Selection in Go
date: 2016-03-21 04:41 UTC
tags: go
category: go
layout: post-layout
summary: rand.Seed(time.Now().UnixNano())
---
# Consistently Random Selection in Go


I am relatively new to Go and have found it relatively easy to pick up how to do things, but every now and then something trips me up.

A simple task I gave myself was to rewrite a script I wrote in Ruby, in Go. This script takes a list of my coworkers and picks 3 of them at random to alert about my new pull request. This is a task that I have to do multiple times throughout the work day, which is why a script is ideal.

```

# Ruby

possible_reviewers = %w(
   afogel
   ambriz
   brett
   brian
   christian
   jared
   jason
   megan
   Patrick
   joe
   stan
   aaron
)

three_reviewers = possible_reviewers.sample(3).join(‘, ‘)
print “#{three_reviewers}\n#{note}\n”

```

I begin with a Ruby Array and use it’s the standard library `:sample` to select 3 people. I rewrote this in Go rather easily, see below.

```

# Go

import (

  “math/rand”

  “fmt”

)

var possible = []string{
   “afogel”,
   “ambriz”,
   “brett”,
   “brian”,
   “christian”,
   “jared”,
   “jason”,
   “megan”,
   “Patrick”,
   “joe”,
   “stan”,
   “aaron”,
}

randomize := rand.Perm(len(possible))

for _, v := range randomize[:3] {
   fmt.Println(possible[v])
}

```

This is pretty straight forward, I start with an Array in Go and randomize using the [Perm()](https://golang.org/pkg/math/rand/#Perm) function from the `math/rand` library. The function takes and integer as an argument but returns a pseudo-random permutation of the integers `[0,n)` from the default Source.

The only issue with randomizing in Go is the `math/rand` is deterministic by default, which means the randomization only happens once and returns the same random numbers each time. 

Don’t believe me? See for yourself in the playground:

<a href="https://play.golang.org/p/tqeIL0hImX"> see this code in play.golang.org </a>

```
rand.Perm(10) // returns [9 4 2 6 8 0 3 1 7 5] everytime
```

I spent sometime trying to figure this out and found two very imformative threads with solutions for my problem. 

[math/rand: Deterministic random by default is dangerous · Issue #11871 · golang/go](https://github.com/golang/go/issues/11871)

[Random generator always returns same value on every run](https://groups.google.com/forum/#!topic/golang-nuts/TzsEceDLGI0)

The easiest and most legit solution is seeding `rand` with something. By default the seed is `1` which is why the same result is return, but by seeding my `rand` with `time.Now().UnixNano()`, I get something more random, which is expected. 


```
rand.Seed(time.Now().UnixNano())

```

I am basically just getting a current time stamp to ensure each run of the program will be a different result.

[Final Solution](https://play.golang.org/p/L31xCUuUVC)

```
package main

import "fmt"
import "math/rand"
import "time"

func main() {
	rand.Seed(time.Now().UnixNano())
	fmt.Println(rand.Perm(10))
}
```
