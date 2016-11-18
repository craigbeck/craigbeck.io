---
layout: post
title: "Understanding the Node.js Event Loop"
date: 2016-11-03T13:11:36-07:00
linkhref: https://blog.risingstack.com/node-js-at-scale-understanding-node-js-event-loop/
categories:
  - node
---


[{{ page.title }}]({{ page.linkhref }})

> This article helps you to understand how the Node.js event loop works,
> and how you can leverage it to build fast applications. We'll also
> discuss the most common problems you might encounter, and the
> solutions for them.

Good article that describes how Node.js handles asynchronous operations
including geting into microtasks and macrotasks as well as how they
relate to the more common promise, `process.nextTick()`, and
`setTimeout()` calls relate.

