---
layout: post
title: "Safari + Hapi.js + CORS = 404"
date: 2015-10-27 18:34:37 -0700
comments: true
categories:
  - hapijs
  - Safari
  - CORS
---

So with recent software updated on OS X (including newest Safari 9.0.1) and _also_ updating a project to latest version of [hapi.js](http://hapijs.com)(v11) CORS requests are broken.

It appears Safari now sends an Access-Control-Request-Headers value of "accept, origin, authorization", while Hapi has a default configuration for CORS headers doesn't include "origin". Chrome meanwhile, was still working only sending "accept, authorization" for the header value.

The solution is to tell Hapi to also accept "origin" as a CORS request header value:

```js
server.connection({
  port: process.env.PORT || 8081,
  routes: {
    cors: {
      additionalHeaders: [
        "Origin"
      ]
    }
  }
});
```

There have been a few changes in configuration and handling of CORS in Hapi of late, so this may not be needed down the road if changes are made to the default configuration.


## Related Issues:

- ["CORS: Is 404 on OPTIONS request the right thing to do?"](https://github.com/hapijs/hapi/issues/2868)
- ["Request header field Content-Type is not allowed by Access-Control-Allow-Headers in preflight response."](https://github.com/hapijs/hapi/issues/2853)
