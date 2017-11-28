---
layout: post
title: "Namespacing Actions for Redux"
date: 2017-11-28T11:01:14-08:00
linkhref: https://kickstarter.engineering/namespacing-actions-for-redux-d9b55a88b1b1
categories:
  - redux
---


[{{ page.title }}]({{ page.linkhref }})

> With Redux, you can use combineReducers to create nested reducers that only operate on a slice of state, but all reducers still respond to all actions. Often this is the point—a component can affect another component just by dispatching an action. But when we started creating multiple instances of the same component, we created a system where every instance responded to action meant for just one.

