---
layout: page
title: "R language learnings"
---

them: "Hey, we have an urgent need for some front-end help putting together an analytics dashboard for a demo next week, can you help out?"

me: "Sure!"

them: "Great! We already have a prototype -- it's in R..."

me: "..."

And so started my learning of [R](https://en.wikipedia.org/wiki/R_(programming_language)) to put together an data visualization app using [Shiny](https://shiny.rstudio.com), [Flexdashboard](http://rmarkdown.rstudio.com/flexdashboard/) and [Leaflet](https://rstudio.github.io/leaflet/) for mapping.


## R basics

### Data Types

#### DataFrames

### Sanitizing and filtering data

## R Web Applications

### Flexdashboard

### Shiny

### Leaflet

#### Data gotchas

- Make sure your data points all have `lat` and `long` values. One dataset I was working with had 1500+ records but some were missing valid coordinates. The result was Leaflet rendered only a fraction of the data until I filtered out the data points with bad coordinates, and it did so without any errors or warnings.

#### adding popups

### links!

- [Animating Leaflet Markers]( http://piratefsh.github.io/how-to/2015/10/16/animating-leaflet-markers.html)

### Examples
