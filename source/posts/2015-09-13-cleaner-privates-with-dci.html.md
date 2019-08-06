---
title: Cleaner Privates with DCI
date: 2015-09-13 07:27 UTC
tags:
category: ruby
layout: post-layout
summary: DCI in Ruby
---
# Clean your Privates with DCI

Understanding the context of code in a team repo is hard and it's harder when the solution to figuring how code works is, **"I Don't Know, just Git Blame and talk to the person who wrote it."** That works until the person to blame is either yourself or unavailable.

Having clean code and readable code is a must for growing teams.

One code smell I find a lot is the use of abstracting tons of business logic into private methods. This is a method of abstraction I am very familiar with and use often thanks to [POODR](https://www.poodr.com/).

The idea of abstracting complex business logic into a private method makes it easy to test, because you aren’t suppose to test private methods. This [code smell](https://en.wikipedia.org/wiki/Code_smell) can grow into a problem where too much hidden business logic hidden from tests and hard to change.

I discovered this firsthand when I had to make updates to key business logic in the code base. I rewrote the way we collect and send information for student [NPS](https://en.wikipedia.org/wiki/Net_Promoter) survey, and made updates to how we qualify students who are eligible to provide feedback. 

In an effort to prevent requesting feedback from students on their first day of the course or too many times, the following code was written as is:

<script src="https://gist.github.com/bdougie/a0ad352f508203e30cc4.js"></script>

**Pain Points:**

1. Testing a specific enrollment for feedback eligibility is extremely hard due to the amount of private methods being abstracted (I had to do this multiple times to make sure my code was sound).

2. In the event we change the way how we set feedback eligibility, the code becomes more complex and harder to change.

**DCI**(Data Context and Interaction) is a pattern to provide roles/methods at the times they are needed. This pattern helps reflect your business use case clearly in your code, and avoids the need for [comment bloating](https://github.com/bbatsov/ruby-style-guide#comments) in your code, or the case of missing developer who wrote this code.

I implemented the following refactoring:

<script src="https://gist.github.com/bdougie/4086c9a53fa534c2d27c.js"></script>

I took all my private methods and placed them in a context class called `CheckingFeedbackEligibility`. This move gives me the ability to call this context of checking feedback eligibility into an easily testable file. 

My `:upcoming_enrollments` method now looks like this:
<script src="https://gist.github.com/bdougie/0a6a0eee2e2266d77215.js"></script>
I even wrote a simple test:

<script src="https://gist.github.com/bdougie/1141581a30ae56000975.js"></script>

**Benefits:**

In summary there is now no need for a ton of private methods bloating my `Feedback` model and I can now easily test in context if a specific enrollment is `:eligible?`.

All I had to do is take code that matters in only in one place and move it somewhere that can be easily be written and explained.

So if you are find yourself struggling to figure out your private methods and business logic, it might be worth abstracting into a separate context. 

**Final code:**

<script src="https://gist.github.com/bdougie/e1691a2da5938c57be8f.js"></script>

I recently had this opportunity to use the concept of DCI thanks to the book [Clean Ruby](https://clean-ruby.com/) and I highly recommend it if you would like to find out more.

*This article was originally posted on [code.bloc.io](https://code.bloc.io/) 
