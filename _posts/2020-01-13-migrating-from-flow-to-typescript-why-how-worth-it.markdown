---
layout: post
title: "Migrating From Flow to Typescript: Why? How? Worth It?"
date: 2020-01-13T16:07:01-08:00
linkhref: https://medium.com/inato/migrating-from-flow-to-typescript-why-how-worth-it-5b7703d12089
categories:
  - javascript
  - typescript
---


[{{ page.title }}]({{ page.linkhref }})

> When I arrived at Inato, the codebase was written in ES6. Then, we added some robustness with Flow. It helped us perform major refactors and lower our bug count. We were happy… until problems showed up.

I've been using Flow for a bit over 3 years now on the same project. I have had experience with typed languages before (.Net C#, Java) so it was not an entirely new thing, but I admittedly found many annoyances with types in these languages and I was always eager to use new features in a language (C#'s `var` for one) to reduce the overhead. I found it annoying that the compiler would complain if I told it the wrong type, but tell me what type it should be. I mean if it knows what it is, how about it just dealt with it and stop bothering me? 🙄

So coming to and environment that used typed javascript (Flow) I was skeptical at first... but it quicly became clear that there were whole classes of bugs that _didn't exist_ because I had the safety of a type system... ensuring I wasnt passing the wrong things or edge cases were properly covered (looking at you `null or undefined` 🤨)

But 3 years on and supporting Flow in our still growing codebase has been wearing us down. Third party library support is... spotty. Updates to `flow-bin` have lead to a slew of new errors (aka newly supported cases) with little help from the error messages or library typedefs to previously "happy" codebases (redux `connect` and `@FlowFixMe` like cookies and cream), to the point that we are wondering "is it all worth it?"

Has TypeScript won the war of developer mindshare? It sure is time for us however, and I'm relieved to see we are not the only ones.
