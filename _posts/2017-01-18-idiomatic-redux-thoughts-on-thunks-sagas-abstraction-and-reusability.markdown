---
layout: post
title: "Idiomatic Redux: Thoughts on Thunks, Sagas, Abstraction, and Reusability"
date: 2017-01-18T10:30:15-08:00
linkhref: http://blog.isquaredsoftware.com/2017/01/idiomatic-redux-thoughts-on-thunks-sagas-abstraction-and-reusability/?utm_campaign=React%2BNewsletter&utm_medium=email&utm_source=React_Newsletter_58
categories:
  - react
---


[{{ page.title }}]({{ page.linkhref }})

> The redux-thunk and redux-saga libraries are the most widely-used libraries for "side effects" in Redux. Both provide a place to make AJAX requests, dispatch multiple actions, access the current store state, and run other complex logic. redux-thunk does this by allowing you to pass a function to dispatch(), while redux-saga uses ES6 generators to execute asynchronous logic.
> 
> There's been a lot of recent statements arguing that thunks (and sagas) are bad and should almost never be used. As a result, I've seen developers confused and wondering what alternatives they have to implement a given feature.
> 
> The concerns being raised are valid, but to balance the discussion, I would argue that thunks are a useful tool in Redux applications, and that developers should not be scared to use thunks in their codebase.
> 
> With those thoughts in mind, let's dig into the discussions and see just what has been said about thunks.

Lots of good stuff in here. I can see a couple of things right away that I have noticed as problematic (duplication of async code, going "dispatch crazy" with chained actions) but struggled to find an obviously better solution.

