---
layout: post
title: "How to Make Your React App Fully Functional, Fully Reactive, and Able to Handle All Those Crazy Side Effects"
date: 2017-03-09T11:09:15-08:00
linkhref: https://medium.freecodecamp.com/how-to-make-your-react-app-fully-functional-fully-reactive-and-able-to-handle-all-those-crazy-e5da8e7dac10#.5m5uap81o
categories: react
---


[{{ page.title }}]({{ page.linkhref }})

> In this article I’ll talk about redux-cycles, a Redux middleware that helps you to handle side effects and async code in your React apps in a functional-reactive way — a trait which is not yet shared by other Redux side effect models — by leveraging the Cycle.js framework.

Interesting observation on the declarative/reactive nature of the common side-effect libraries I've used with react previously. They solve a problem, but they haven't left me entirely satisifed and maybe this is the reason why.

