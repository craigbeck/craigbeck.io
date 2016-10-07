---
layout: post
title: "the open source pit of success"
date: 2013-11-09 17:44
comments: true
categories:
  - Yeoman
  - NodeJS
  - npm
  - open source
  - projects
  - TravisCI
---

I just published my first public project -- [generator-pymod](http://github.com/craigbeck/generator-pymod). It is a super-simple [Yeoman generator](http://yeoman.io/generators.html) that creates a couple of files and a directory in the form of a Python module. As I said, simple. It's not much to do by hand, but I *hate* doing things over and over that a script would be better at doing for me, and I *hate* having to remember minutiae.

So I decided to automate this using Yeoman. I know I could have done this with a simple bash script (actually I did), but I wanted to learn how to put together a very simple generator by actually doing it. The end result  is that I learned a thing or two about yeoman, but more importantly my eyes were opened to how easy things like [npm](http://npmjs.org) make it to [publish my first npm package](https://npmjs.org/package/generator-pymod). 

It reminded me of [Jeff Atwood's](http://codinghorror.com) article ["Falling into the Pit of Success"](http://www.codinghorror.com/blog/2007/08/falling-into-the-pit-of-success.html). It was just *so easy* to publish it: why woudn't I? After the initial push [to github](https://github.com/craigbeck/generator-pymod) it was all of 2 minutes looking at the docs before I was "live" at the [npm package registry](https://npmjs.org/package/generator-pymod). A few more minutes and I had it running on Travis continuous integration on [travis-ci.org](https://travis-ci.org/craigbeck/generator-pymod). 


