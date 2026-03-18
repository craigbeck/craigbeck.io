---
layout: post
title: "How to Async Tests in Elixir"
date: 2026-03-18T12:00:00-07:00
linkhref: https://andrealeopardi.com/posts/async-tests-in-elixir/
categories:
  - elixir
---

[{{ page.title }}]({{ page.linkhref }})

> Proper, robust asynchronous tests solve slow and flaky test suites through horizontal scaling and process isolation.

Andrea Leopardi digs into why async testing gets hard in Elixir as apps grow — singletons and shared state are the usual culprits. The practical advice here is solid: think like a library author, avoid hardcoded singletons, and leverage tools like `ProcessTree` and `nimble_ownership` for resource isolation. A great reference if your test suite is getting slow or flaky.
