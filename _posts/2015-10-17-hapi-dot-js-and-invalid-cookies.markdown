---
layout: post
title: "Hapi.js &amp; invalid cookies"
date: 2015-10-17 12:36:04 -0700
comments: true
categories:
  - hapijs
---

I love using [Hapi.js](http://hapijs.com), but every time I start a new
project with it I have this problem where all my requests get 400
responses due to an invalid cookie value.

My new shiny hapi app doesn't care about cookies. I don't want it to care
about cookies. But it still does. By default, hapi tries to read all the
cookies that were sent with the request, _including signed cookies set
by express_. Of course, as I've a habit of developing on localhost, and
because we have multiple apps on the same domain (java, express, as well
as hapi) where _some_ of those apps care about these cookies, these
cookies are going to get sent along with the request to an app that
doesnt care about them. Hapi does it's job to try and verify the signed
express cookie and fails (it doesn't have any way to actually verify,
i.e. no keys/secrets used in the signing), retuning the 400.

So every new hapi service I start with now I ignore cookie errors:

```js
server.connection({
  port: process.env.PORT || 8000,
  state: {
    ignoreErrors: true
  }
});
```

