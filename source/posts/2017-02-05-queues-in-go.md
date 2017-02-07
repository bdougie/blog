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

I approach the structure knowing the Queue will have a head and a tail, which was lifted from the pseudo-code example in the [Bloc Software](https://www.bloc.io/software-developer-track) course I previewed.   


```go
type Queue struct {
	head  *Element
	tail *Element
	size int
}
```
I used the same Element I used in the Stack to keep track of the value of each item in the Queue, this was an approach I discovered while researching Stacks in different languages. The Element holds the info on the Elements around them, next and previous. This is not similar to Arrays which are position based, but rather only focused on which elements sandwiches them.

```go
type Element struct {
	value    interface{}
	queue    *Queue
	next     *Element
	previous *Element
}

```

I created an Enqueue function to add elements to the Queue. This is different from a Push method in a Stack because you are adding elements to the tail and not the head.

My first check is to see if this is the first element in the Queue if so, I add it to the head and tail. If the element is not the first, the element gets added to the previous element of the current tail and then added to the tail of the Queue. The new tail now has no previous element, since it is indeed the tail. 


```go
func (q *Queue) Enqueue(value interface{}) {
	q.size++
	if q.size == 1 {
		q.head = &Element{value: value, previous: nil}
		q.tail = q.head
		return
	}
	q.tail.previous = &Element{value: value, previous: nil}
	q.tail = q.tail.previous
}

```

The Dequeue removes elements from the head of the Queue. I first check to see if the Queue is empty. If the Queue is empty I just return `nil`. If the Queue is not empty, I proceed to dequeue the head element by setting the previous as the head. I also return the value in the event it is needed to be used for another function.

```go
func (q *Queue) Dequeue() interface{} {
	if !q.IsEmpty() {
		value := q.head.value
		q.head = q.head.previous
		q.size--
		return value
	}

	return nil
}
```
No 3rd party libraries were sued in the making of this function in an effort to understand the basics of Go. I created an `isEmpty` to check if the Queue is empty to prevent an error. This helps keep my code less verbose, by abstracting the check for Queue size into a separate function.

```go
func (q *Queue) IsEmpty() bool {
	if q.size > 0 {
		return false
	}

	return true
}
```

Testing is straightforward with my isEmpty function. I do basic checks to see if my functions work as expected. All tests were written using TDD to help understand the Queue Data Structure while trying to create it.  

```go
func TestQueueIsInitializedEmpty(t *testing.T) {
	q := new(Queue)
	assert.Equal(t, true, q.IsEmpty())
}

func TestItemCanBeQueued(t *testing.T) {
	q := new(Queue)
	q.Enqueue("12")
	assert.Equal(t, false, q.IsEmpty())
}

func TestItemCanBeDequeued(t *testing.T) {
	q := new(Queue)
	q.Enqueue("12")
	assert.Equal(t, false, q.IsEmpty())
	q.Dequeue()
	assert.Equal(t, true, q.IsEmpty())
}

func TestFIFO(t *testing.T) {
	q := new(Queue)
	q.Enqueue("First")
	q.Enqueue("Last")
	q.Dequeue()
	head := q.head.value
	assert.Equal(t, "Last", head)
}
```
Knowing 2 data structures doesn't quite make me a Computer Scientists, but I now have a better understanding of approaching CS now. I also have a better understanding of Go as a language and just interfacing with functions and Structs. 

I will be tackling LinkedLists next.
