---
layout: post
title: "ui.router and 'aProvider' problems"
date: 2013-12-11 10:37
comments: true
categories:
  - Yeoman
  - AngularJS
  - ngMin
  - problem
  - Grunt
  - Javascript
---

So I have a fairly simple [AngularJS](http://angularjs.org) project using the new [Angular UI Router](https://github.com/angular-ui/ui-router) and the project is scaffolded with the Yeoman angular generator. All is well when running locally in developer mode, but theres trouble once I run <code>grunt</code> and run with the grunt built/minified/uglified code -- the browser would just hang (Safari) or outright crash (Chrome). Hmmm, thats definitely not right. 

My scripts are included in my <code>index.html</code> file like so:

```html
<!-- build:js({.tmp,app}) scripts/scripts.js -->
<script src="scripts/app.js"></script>
<script src="scripts/controllers/main.js"></script>
<script src="scripts/controllers/realm.js"></script>
<script src="scripts/services/realms.js"></script>
<!-- endbuild -->
```

The purpose of the comment lines are to delineate a block of the html that should be processed together -- in this case the individual files will be concatenated, minified, and then the <code>index.html</code> will be rewritten to include the processed file <code>scripts.js</code>

After some non-productive mucking about with ordering and including/excluding files for processing, I cracked open the processed file. It's still fairly readable even with the minification that has taken place.

## NgMin is cool

One thing the angular generator set up is the use of [ngMin](https://github.com/btford/ngmin) so you can write your Javascript without having to worry about details of how it will be minified later so that this:

```js
angular.module("indexApp",[
    "chieffancypants.loadingBar","ui.bootstrap","ui.router"
  ])
  .config(function($urlRouterProvider, $stateProvider) {
    // snip...
  });
```

is turned into this after grunt is done with it:

```js
angular.module("indexApp",[
    "chieffancypants.loadingBar","ui.bootstrap","ui.router"
  ])
  .config(["$urlRouterProvider","$stateProvider",function(a,b) {
    // snip...
  }]);
```

Notice the arguments to the anonymous function passed to the config method in the before example. The whole argument has been rewritten as an array with the names of the arguments as strings followed by the function where the arguments have been replaced with the more succinct names "a" and "b".

This is cool. NgMin is aware of how Angular does it's dependency injection and rewrites it using the more verbose syntax Angular supports so we can still use our other tools for processing scripts.

## But not all is well.

Here is one of my states that is setup in the anonymous funciton passed to the module's config method:

```js
$stateProvider
  .state('main', {
    url: '/',
    templateUrl: 'views/main.html',
    controller: 'MainCtrl',
    resolve: {
      allTheRealms: function(MyAppService) {
        console.log('MainCtrl resolve', arguments);
        return MyAppService.init();
      }
    }
  })
``` 

I'm using a service to make https requests against a service and this needs to be done on initialization so I'm using the <code>$stateProvider</code> resolve property to initiate the asynchronous call to the server and once that succeeds its passed to my controller. 

This normally works great, but in this case the resolve function had its own dependency on a service. After Grunt had done its thing the code above looked like this:

```js
b.state('main', {
  url: '/',
  templateUrl: 'views/main.html',
  controller: 'MainCtrl',
  resolve: {
    allTheRealms: function(a) {
      return a.init();
    }
  }
})
```

Notice the function argument is now just called <code>a</code>, and the <code>$stateProvider</code> is called <code>b</code>. This is not helpful as Angular's dependency-injection *magic* doesn't know what the function needs (i.e. I have no "a" service to be injected). Usually this files with an error about no "aProvider" found, but in this case *the browser was hanging and or crashing!*

## What is `a`?

Step back to the earlier example:

```js
angular.module("indexApp",[
    "chieffancypants.loadingBar","ui.bootstrap","ui.router"
  ])
  .config(["$urlRouterProvider","$stateProvider",function(a,b) {
    // snip...
  }]);
```

`a` is actually the `$urlRouterProvider` and we are calling `init()` on it. Not what we wanted at all. I haven't dug further but my guess is there is an `init` method on that and it's resulting in something nasty and probably recursive causing the Bad Things&trade;.

Well once I saw that it was a quick Google of "ui.router ngmin resolve" and found this issue: [Support for ui-router resolve, onEnter and onExit](https://github.com/btford/ngmin/issues/54)

So apparently ngMin for all its goodness misses on these properties in the state setup. The simple solution is go back to using the alternate Angular syntax for specifying the dependencies:

```js
$stateProvider
  .state('main', {
    url: '/',
    templateUrl: 'views/main.html',
    controller: 'MainCtrl',
    resolve: {
      allTheRealms: ['MyAppService', function(MyAppService) {
        console.log('MainCtrl resolve', arguments);
        return MyAppService.init();
      }]
    }
  })
```

Once I had that sorted my app loaded fine!

- [Angular Dependency Injection Guide](http://docs.angularjs.org/guide/di)
- [Using Resolve property with route provider](http://egghead.io/lessons/angularjs-resolve)
- [More about using resolve](http://egghead.io/lessons/angularjs-resolve-conventions)


