---
layout: post
title: "Choosing GraphQL to Build Drift's Messaging Platform"
date: 2016-10-18T17:52:33-07:00
categories:
  - GraphQL
---

[Choosing GraphQL to build Drift's messaging
platform](https://medium.com/drift-engineering/choosing-graphql-to-build-drifts-messaging-platform-8b4310facbc1)

> Like most internet companies today, we built our platform starting from a RESTful JSON API. But even with a clean slate, we still ran into familiar challenges that all API developers face: schema definition and introspection, versioning, paging, data aggregation and response shaping.

> GraphQL allows you to create a schema that exposes your entire organization's data model via read and write operations. This creates a single point of entry into your API and enables clients to ask in a single call what most REST JSON APIs take many calls to fulfill.

GraphQL is the post-REST API.

I did some work putting together GraphQL servers in Node and Elixir and really enjoyed the ease that clients had in getting the exact data they needed in a single call. It has a learning curve (but so did REST), but it really made for a better API experience.

[Relay](relay) (and [Apollo](apollo)) are the client side companions for GraphQL. The learning curve for Realy was steep -- it is very specific about its expectations for schema which is sometimes not so clear -- but getting past the *steep* learning curve (it is very early) I was amazed that I had written no network/data code for my client app. That's about 30% of the code for a comparable app that just isn't there.


[relay]:https://facebook.github.io/relay/
[apollo]:http://www.apollostack.com
