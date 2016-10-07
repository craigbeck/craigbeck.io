---
layout: post
title: "Dokku + Dockerfile deployments"
date: 2016-01-13 13:58:10 -0800
comments: true
categories:
  - dokku
  - docker
  - build
---

[Dokku](https://github.com/dokku/dokku) is a fantastic little PAAS app written in bash that can take a `git push`, build, and host your apps. It can use Heroku Buildpacks or [Docker](http://docker.com) to build your app (and uses Docker to host your running app) and can hadle running multiple Docker containers on a single host and sets up Nginx to proxy and route requests to the correct application.

I have deployed many apps onto our Dokku hosts, mostly Node.js apps using [Hapi.js](http://hapijs.com), [Express](http://expressjs.com), as well as Java services. Recently I built a statically-rendered [React](https://facebook.github.io/react/) application (a client-side only app without a server process doing the rendering etc; see [this](https://blog.andyet.com/2015/05/18/lazymorphic-apps-bringing-back-static-web/) post for explaination) where I just wanted Nginx to handle serving the app code and assets. To do so I created a new base Docker image for serving the app just ran Nginx and ponted to my app code.

One problem with this static-rendering strategy is the issue of configuration. Depending on the environment we were deploying the app too meant we needed slightly different setups. For the test environment, we want to point to test envirnmant APIs, use production builds, while production would need to use the produciton APIs, and also would be proxied to from the getway nginx servers with a path prefix i.e. under test the app would be at http://myapp.test.dev while the production app would be at http://foo.com/myapp -- there is an extra layer of nginx proxying involved in the production setup, but it also requires the production build to be aware of that extra path segment when returning URLs for assets (javascript, PNGs etc).

Where we have server process handling requests we have full control over these and use request headers to inject this configuration per request, however a static app can't do this in the same way so we're left with producing environment specific builds. Dokku inherently does this as every deployment (e.g. to prod host or test host) so we just need to be able to pass this configuration at build time. According to the Dokku docs "The variables are available both at run time and during the application build/compilation step" however this is _only_ true for Heroku buildpack deployments, _not_ Docker deployments.

To get the same thing with Docker builds we have to use the dokku `docker-options` command which allows us to set options for build, deploy, or run phases of the process. Under the covers the Dokku build invokes `docker build` which does not take the same `-e` parameter that `docker run` accepts for setting environment variables, but does have the `--build-args` parameter. One caveat of this technique is this requires the Dockerfile your app uses to be modified to accept build arguments using the `ARG` command. If you don't specify the arg being passed with `ARG` the build will fail with the error "One or more build-args were not consumed".

So to set a build argument of `PATH_PREFIX` in our example above:

1. `dokku build-options:add myapp build '--build-arg "PATH_PREFIX=/myapp"'`
2. modify your dockerfile

```
FROM baseimage

ARG PATH_PREFIX                            # declare PATH_PREFIX as build arg
RUN PATH_PREFIX=${PATH_PREFIX} ./dobuild   # use PATH_PREFIX (in this case as an env var consumed by build script)
```

Then commit changes and `git push` your app

