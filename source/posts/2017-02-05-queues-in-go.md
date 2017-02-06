---
title: Queues in Go
layout: post-layout
tags: go
category: go
date: 2017-02-07T01:59:58.000Z
summary: Queues
---

As a follow-up to my previous post on [Stacks in Go](/posts/2017/01/30/stacks-in-go), I am going to walk through my learning of Queues.

## Queue

Similar to Stacks, Queues are an abstract data structures when the collection of data are kept in order. Items can be enqueued to add to the queue and dequeued to be removed from the queue. 

I approach the structure knowing the Queue will have a head and a tail. This is something I have heard mentioned in the  


```
type Queue struct {
	head  *Element
	tail *Element
	size int
}
```

