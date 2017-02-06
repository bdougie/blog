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
I used the same Element I used in the Stack.

```
type Element struct {
	value    interface{}
	stack    *Stack
	next     *Element
	previous *Element
}

```

I created an Enqueue function to add elements to the Queue.

```
func (q *Queue) Enqueue(value interface{}) {
	q.size++
	if q.size == 1 {
		q.top = &Element{value: value, previous: nil}
		q.tail = q.top
		return
	}
	q.tail.previous = &Element{value: value, previous: nil}
	q.tail = q.tail.previous
}

```

The Dequeue removes elements form the Queue

```
func (q *Queue) Dequeue() interface{} {
	if !q.IsEmpty() {
		value := q.top.value
		q.top = q.top.previous
		q.size--
		return value
	}

	return nil
}
```

I created an `isEmpty` to check if the Queue is empty to prevent an error. 

```
func (q *Queue) IsEmpty() bool {
	if q.size > 0 {
		return false
	}

	return true
}
```

Tests

```
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
	top := q.top.value
	assert.Equal(t, "Last", top)
}
```

