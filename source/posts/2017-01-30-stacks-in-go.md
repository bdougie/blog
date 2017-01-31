---
title: Stacks in Go
layout: post-layout
tags: 'go, computer science'
category: go
date: 2017-01-30T21:37:27.914Z
summary: >-
  A Stack is an abstract data type that serves as a collection of elements with
  two principle operations, pop and push. Writing Stacks in Go is a great way to
  learn the language, which I will explain further in this post.
---

# Stacks in Go

I previously implemented a simple data structure to keep track of individuals entering and leaving an amusement park ride line, I outlined the assignment in my [previous post](/posts/2016/08/23/learn-computer-science-with-go). This was pretty trivial to do using Slices in Go, but thanks to my discoveries I realize there are other data structures than Arrays in Computer Science.  

From my experience during 3 years of web development, I have never come across the term **Stack**. My day to day work mostly uses larger frameworks in Ruby and JavaScript. All the implementation details are usually decided for me, which makes it no mistery why I never came across this term.

## Stack

A Stack is an abstract data type that serves as a collection of elements with two principle operations, pop and push. If you think of the Stack as a deck of cards, you can only add to the top of the Stack and remove the top of the Stack.

Building a Stack in Go only requires two functions `Push` and `Pop` to interface with it. I chose to not use an array as my underlying data structure in my Stack structure but followed from some inspiration from [godash](https://godoc.org/github.com/Kairi/godash). The Stack data structure also needs two attributes, **size** and the element on **top**. This way we can always know what element is on top and how many exists on the Stack.

```go
type Stack struct {
	top  *Element
	size int
}
```

While researching how to approach this, I chose to build a second Struct, called **Element** to keep track of the value of each, this was an approach I discovered while researching Stacks in different languages. The Element holds the info on the Elements around them, next and previous. This is not similar to Arrays which are position based, but rather only focused on which elements sandwiches them.

```go
type Element struct {
	value    interface{}
	stack    *Stack
	next     *Element
	previous *Element
}
```

I am trying to avoid using as many non-standard library packages as much as possible, so I also opted in writing my own implementations of `Pop`, `Push`, etc but couldn't help but be inspired from godash.  

```go
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


Go allows Structs have the ability to create functions associated with them, similar to Class functions in dynamic languages. The first argument is actually not an argument but the Struct the function will be used on. It is then followed by the function name and then the actual arguments.

Here I am creating the `Push` function to be used on any Stack. I first set the top attribute of the Stack to be a new Element created using the value arguments. I am setting the next Element as the current top, which in this case is null. I also set the stack attribute as the current Stack I am working with.


```go
func  (s *Stack) Push(value interface{}) {  // value is an interface type
	s.top = &Element{value: value, stack: s, next: s.top} // set the top as a new Element using
	s.size++ // increases size by 1
}
```


The `Pop` function is a bit similar to the `Push` function but in reverse. I first wrap my operation into a conditional to check to see if the size of the Stack is greater than 0; No point popping if the Stack is empty. I then proceed to set the top attribute as the next attribute and decrease the stack size by 1. 

I also create store the value being popped into a variable to return. This is to prepare for an event where I might want to immediately use the value for another operation. This is just mirror how I know `:pop` works in Ruby.

```go
func (s *Stack) Pop() interface{} {
	if s.size > 0 {  // conditional to make sure the Stack size is greater than 0
		value := s.top.value // saves the value of the top attribute
		s.top = s.top.next // overwrites the top Element by setting the next Element as top 
		s.size-- // decrements the size by 
		return value // returns the value
	}

	return nil // returns nil instead of an error if the size is 0
}
```

My implementation of Stacks was created using Test Driven Development, an excellent way to stay sane while exploring a new language like Go. 

```go
package main

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestStackIsInitializedEmpty(t *testing.T) {
	s := new(Stack)
	assert.Equal(t, true, s.IsEmpty())
}

func TestItemCanBePushedOntoStack(t *testing.T) {
	s := new(Stack)
	s.Push("12")
	assert.Equal(t, false, s.IsEmpty())
}

func TestItemCanBePopOffStack(t *testing.T) {
	s := new(Stack)
	s.Push("7")
	assert.Equal(t, false, s.IsEmpty())
	s.Pop()
	assert.Equal(t, true, s.IsEmpty())
}

func TestStackIsLIFO(t *testing.T) {
	s := new(Stack)
	s.Push("First")
	s.Push("Last")
	s.Pop()
	top := s.top.value
	assert.Equal(t, "First", top)
}
```

Writing a Stack data structure in Go was a great way for me to explore Structs in Go, but also a great intro to Computer Science for myself as well. 

Stayed tuned for my next post to see my implementation of Queue data structure in Go. 
