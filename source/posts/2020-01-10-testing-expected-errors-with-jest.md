---
title: Testing expected Errors with Jest
layout: post-layout
tags: 'jest, react, javascript'
category: blog
date: 2020-01-10T21:40:48.367Z
summary: This is a post to discover how to write a test for an expected error with Jest
---
# Testing expected Errors with Jest

While trying to create consistency in my tests for my [Open Sauced](https://opensauced.pizza/) ([previous revived](https://briandouglas.me/posts/2019/08/06/reviving-projects-with-dependency-automationhttps://briandouglas.me/posts/2019/08/06/reviving-projects-with-dependency-automation)), I found testing my reducer functions to be challenging.

My reducer is simplistic and possibly naive:

```js
// reducers.js

export function goalsReducer(state, action) {
  switch (action.type) {
    case "GET":
      return state.repository ? state : state.data.gitHub.viewer;
    case "UPDATE":
      return state;
    case "CREATE":
      return state.data.createRepository;
    default:
      throw new Error("No Action was provided.");
  }
}
```

It has been a few years since I needed to use the [Reducer](https://redux.js.org/basics/reducers/https://redux.js.org/basics/reducers/) pattern in code. To help instill confidence in my code, I decided to write tests. This path for writing tests worked out well and even improved my code a tiny bit.

The only struggle came in my default case, which throws an expected Error when no type is provided. I have handled Errors in test in languages like Ruby but had not approached this with Jest or JavaScript. 

My research landed me on the [.toThrow(error?)](https://jestjs.io/docs/en/expect#tothrowerrorhttps://jestjs.io/docs/en/expect#tothrowerror) function, which seemed like it should work, but it didn't. It could not identify my expected error, and my function continued to error. I almost went down the path of mocking out my expected error to catch it, but I discovered another pattern, which is using try/catch directly in my tests. 

```js
// reducers.test.js

describe("goalsReducer", () => {

  it("should error on no action type", () => {
    try {
      goalsReducer(state, {});
    } catch (e) {
      expect(e).toEqual(new Error("No Action was provided."));
    }
  });
});
```

Because this is my first reducer, this works for me. I imagine I will eventually write some mocks for expected Errors, but for now, I need to get back to Saucin.

Update:

As soon as I posted my experience on Twitter, I received [some feedback]([https://twitter.com/hugo__df/status/1215768310131908610](https://twitter.com/hugo__df/status/1215768310131908610)) that my test would still pass if the function stopper throwing the error. Instead I was recommend to [fail fast with Jest](https://codewithhugo.com/jest-force-explicitly-fail-test/). Failing fast is using [toThrow()](https://jestjs.io/docs/en/expect#tothrowerror), which I originally attempted. My mistake when trying out this expectation was not [binding the function](https://www.geeksforgeeks.org/javascript-function-binding/) to provide the error. 

```
// reducers.test.js

describe("goalsReducer", () => { 
  it("should error on no action type", () => {
    expect(goalsReducer.bind(null, state, {})).toThrow(new Error("No Action was provided."));
  });
});

```

If you found helpful or not helpful, let me know in the comments below. 

Thanks for reading!
