---
title: Stacks and Queues in Go
layout: post-layout
tags: go
category: go
date: 2017-01-30T21:37:27.914Z
summary: >-
  A Stack is an abstract data type that serves as a collection of elements with
  two principle operations, pop and push. If you think of the Stack as a deck of
  cards, you can only add to the top of the Stack and remove the top of the
  Stack. 
---

# Stacks and Queues in Go


One of the first things I implemented in Go was a simple data structure to keep track of individuals entering and leaving an amusement park ride line, I outline the assignment in my [previous post](/posts/2016/08/23/learn-computer-science-with-go).   

From my experience in the web in the past 3 years, I have never come across the term **Stack**. My day to day work was with larger frameworks in Ruby and JavaScript. All the implementation details are usually decided for me.

## Stack

A Stack is an abstract data type that serves as a collection of elements with two principle operations, pop and push. If you think of the Stack as a deck of cards, you can only add to the top of the Stack and remvoe the top of the Stack.

Building a Stack in Go only requires two functions **:push** and :**pop** to interface with it. I chose to not use an array as my underlying data structure in my Stack structure but followed from some inspiration from [godash](https://godoc.org/github.com/Kairi/godash). The Stack data also needs two attributes, **size** and the element on **top**. 

```
type Stack struct {
	top  *Element
	size int
}

```

While researching how to approach this, I chose to build a second Struct, called **Element** to keep track of the value of each, this was an approach I discovered while researching Stacks in different languages. The Element holds the info on the Elements around them, next and previous. This is not similar to Arrays which are position based, but rather only focused on which elements sandwiches them.

```
type Element struct {
	value    interface{}
	stack    *Stack
	next     *Element
	previous *Element
}

```

I am trying to avoid using as many non-standard library packages as possible, so I also opted in writing my own implementations of **:pop**, **:push**, etc but couldn't help but be inspired from godash.  

```
func (s *Stack) Push(value interface{}) {
	s.top = &Element{value: value, stack: s, next: s.top}
	s.size++
}

func (s *Stack) Pop() interface{} {
	if s.size > 0 {
		value := s.top.value
		s.top = s.top.next
		s.size--
		return value
	}

	return nil
}
```

In Go you can add functions to Structs, sort of similar to Class functions in dynamic languages. 
