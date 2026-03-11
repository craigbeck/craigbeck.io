---
layout: post
title: "Effection: Structured Concurrency for JavaScript"
date: 2026-03-06T10:00:00-08:00
linkhref: https://frontside.com/effection/
categories:
  - javascript
  - libraries
---

[{{ page.title }}]({{ page.linkhref }})

> Structured Concurrency and Effects for JavaScript. Stop worrying about asynchronous bugs and memory leaks. Effection gives you leak-proof, composable operations with the structured concurrency guarantees you didn't know you needed.

Effection takes a different angle on async JavaScript -- instead of bolting cleanup and cancellation onto promises after the fact, it bakes structured concurrency in from the ground up. Every operation automatically cleans up after itself, including all child operations it spawned, so resource leaks become a thing of the past. The API feels familiar too -- just regular `let`, `const`, `try/catch/finally` -- no exotic abstractions to learn. Dependency-free and under 5KB gzipped, with first-class TypeScript support. The [GitHub repo](https://github.com/thefrontside/effection) is worth a look.

Also see their post [The Hearbreaking Inadequacy of AbortController](https://frontside.com/blog/2025-08-04-the-heartbreaking-inadequacy-of-abort-controller/) for a great explianer of the type of problem Effection is solving.
