---
layout: post
title: "Building a CQRS/ES Web Application in Elixir Using Phoenix"
date: 2017-01-31T11:46:21-08:00
linkhref: https://10consulting.com/2017/01/04/building-a-cqrs-web-application-in-elixir-using-phoenix/
categories:
---


[{{ page.title }}]({{ page.linkhref }})

> Building applications following domain-driven design and using CQRS feels really natural with the Elixir – and Erlang – actor model. Aggregate roots fit well within Elixir processes, which are driven by immutable messages through their own message mailboxes, allowing them to run concurrently and in isolation.

Really nice (long) dive into building a [CQRS](http://martinfowler.com/bliki/CQRS.html)/[Event Sourcing](https://martinfowler.com/eaaDev/EventSourcing.html) application using Elixir.

