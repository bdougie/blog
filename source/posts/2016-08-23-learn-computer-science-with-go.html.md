---
title: Learn Computer Science with Go
date: 2016-08-23 05:05 UTC
tags: go, computer-science
category: go
layout: post-layout
summary: Go is one of the best languages to learn computer science. Thanks the compiler and built in fmt tool.
---
# Learn Computer Science with Go

The company I mentor for realeased a course that teaches Software
Engineering Principles, which includes basic Computer Sciences concepts.
I had the opportunity to audit the course and learn about Data
Structures.

The course itself is language agnostic, but provides recommendations to use Ruby, however being a Rubyist for the past 2 years, I was looking for a bit more of a challenge and have opted to use Go for the exercises in the course.

The nice thing about learning Computer Science with Go is that I had
pre-existing knowledge of tricks in the language to do lower level
computations.

*I have wanted to write this blog post for awhile, but now getting around
to it thanks to [the  Mind the Gap talk from Katrina Owen](https://www.youtube.com/watch?v=ClPIeuL9HnI) and Matt Aimonetti article, [Go is for everyone](https://medium.com/@mattetti/go-is-for-everyone-b4f84be04c43#.8r2x2ahem).*

```ruby
// Amusement park line

line = ["bill", "susan", "mary", "sam"]
line.pop // ["bill", "susan", "mary"]
line.push("brian") //  ["bill", "susan", "mary", "brian"]
line.delete("susan") //  ["bill", "mary", "brian"]
```

The very first computer science assignment I completed required me to create a Data Structure that
resembled a line for an amusement park. This line Data Structure needs
to have functions that can add individuals to the line and remove
individuals from the line.

In Ruby or JavaScript (the 2
 languages I am most comfortable with) I could solve this problem in
minutes. As I did above in Ruby using the built in `:push` and `:pop`.

The assignment does assume some basic programming knowledge but does not
require the use of an Array, but I opted for its use, mainly because it was the most
familiar to me.

Go has [Arrays](https://tour.golang.org/moretypes/6), but they are a bit strict and require a specific length
that cannot be changed on the fly. I need Immutability, so I opted to
use the Go [Slice](https://tour.golang.org/moretypes/7) Data Structure.

The nice thing about Go is Slices (Their version of Arrays) does not
have those functions built in. The only thin available is `append()`, which
adds an item to the end of the list. 

Once I figured this out, I used it to work through this simple problem.
If anything is unclear below, I highly recommend using the [Tour of Go](https://tour.golang.org/welcome/1) to get a quick overview of the language. 


```
package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strings"
)

// A line of people at an amusement park ride

type AmusementRide struct {
	line []string
}

// my version of push

func addToEndOfLine(a *AmusementRide, person string) {
	a.line = append(a.line, person)
}

// my version of delete
func removeFromLine(a *AmusementRide, person string) {
	for i, p := range a.line {
		match, _ := regexp.MatchString(p, strings.ToLower(person))

		if match {
			a.line = append(a.line[:i], a.line[i+1:]...)
		}
	}
}

func manipulateTheLine() {
	SpaceMountain := AmusementRide{[]string{"bill", "susan", "mary", "sam"}}

	// CMD Line interface creation - I made this a CLI
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("The following people are in line", SpaceMountain.line)
	fmt.Println("Who would you like to add to the line: ")

	// Input
	text, _ := reader.ReadString('\n')

	addToEndOfLine(&SpaceMountain, text)

	fmt.Println("Who would you like to remove from the line? ")
	text2, _ := reader.ReadString('\n')

	removeFromLine(&SpaceMountain, text2)
}

func main() {
	manipulateTheLine()
}

```

This assignment was enlightening and though I am sure this is not the
cleanest code, I am pretty proud of it and my ability to learn a new
language with the intentions of learning a new language.

I actually was determined to learn Go well, so I wrote this code using [TDD](https://en.wikipedia.org/wiki/Test-driven_development) and have my test below as well.

You can see the full code in my [playground](https://play.golang.org/p/I-O_wGBLVN) or via this [GitHub link](https://github.com/bdougie/bloc-data-structures/blob/master/intro_to_data_structures/assignment.go) - PRs are welcomed.

```
package main

import (
	"github.com/stretchr/testify/assert"
	"testing"
)

// A line of people at an amusement park ride

func TestInitializationOfLine(t *testing.T) {
	SpaceMountain := AmusementRide{[]string{"bill", "susan", "mary", "sam"}}
	if length := len(SpaceMountain.line); length != 4 {
		t.Errorf("Expected line length of 4, but it was %d instead.", length)
	}
}

func TestAddingToLine(t *testing.T) {
	SpaceMountain := AmusementRide{[]string{"bill", "susan", "mary", "sam"}}
	addToEndOfLine(&SpaceMountain, "wayne")

	assert.Equal(t, len(SpaceMountain.line), 5)
}

func TestRemovingFromLine(t *testing.T) {
	SpaceMountain := AmusementRide{[]string{"bill", "susan", "mary", "sam"}}
	removeFromLine(&SpaceMountain, "sam")

	if length := len(SpaceMountain.line); length != 3 {
		t.Errorf("Expected line length of 3, but it was %d instead.", length)
	}
}
```
Please stay tuned for my next post, where I dive deeper into Stacks and
Queues in Go, as well how Structs are the most useful data structure.
