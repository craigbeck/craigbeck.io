---
layout: page
title: "R language learnings"
---

> them: "_Hey, we have an urgent need for some front-end help putting together an analytics dashboard for a demo next week, can you help out?"_

> me: _"Sure!"_

> them: _"Great! We already have a prototype -- it's in R..."_

> me: _"..."_

And so started my learning of [R](https://en.wikipedia.org/wiki/R_(programming_language)) to put together an data visualization app using [Shiny](https://shiny.rstudio.com), [Flexdashboard](http://rmarkdown.rstudio.com/flexdashboard/) and [Leaflet](https://rstudio.github.io/leaflet/) for mapping. This is a collection of notes that I've built up as I've learned R and may have some small value for someone else. Or not, <abbr title="Your Mileage May Vary">YMMV</abbr>.


## R basics

Variable names look a bit different than in other languages as a period '.' is commonly used as a word delimiter, but is not special like in other languages so `my.var` is a valid name, so is `my` and `my.var.foo` as well as `.foo.bar`.

### Lists

Simple list use. Notice the double square brackets to access the list elements. Note also that R uses 1-based indexing.

```r
> a <- list(1, 3, 5)
> a[[1]]
[1] 1
> a[[2]]
[1] 3
```

Using a list with named keys similar to a dictionary in other languages.

```r
> opts <- list(foo=3, bar="baz")
> opts$foo
[1] 3
> opts$bar
[1] "baz"
```

### Vectors

Vectors... almost like lists but not. Accessed the same way, but you can't use names like you can with a list.

```r
> v = c(1, 3, 5)
> v[[1]]
[1] 1
> v[[3]]
[1] 5
```

Data frames are frequently used to store table data ([see this](http://www.r-tutor.com/r-introduction/data-frame))

Constructing a data frame manually with vectors. Note the name of the vector variable becomes the column name.

```r
> n = c(1,2,3)
> s = c("aa", "bb", "cc")
> b = c(TRUE, FALSE, TRUE)
> my.df <- data.frame(n, s, b)
> my.df
  n  s     b
1 1 aa  TRUE
2 2 bb FALSE
3 3 cc  TRUE
>
```

Access a row

```r
> my.df[2,]
  n  s     b
2 2 bb FALSE
```

Access a column

```r
> my.df[,2]
[1] aa bb cc
Levels: aa bb cc
```

Access individual cell

```r
> my.df[1,2]
[1] aa
Levels: aa bb cc
```

R even has some built-in data frames...

```r
> mtcars
                     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
```

### Data operations

Filtering data frames

```r
> subset(my.df, my.df$s == "bb")
  n  s     b
2 2 bb FALSE

> subset(my.df, my.df$b)
  n  s    b
1 1 aa TRUE
3 3 cc TRUE
```

### Functions

Creating your own functions is simply using the `function() {...}` syntax and assigning to a variable

```r
filter.invalid.latlng <- function(df) {
  subset(df,
    !is.na(df$lat) &
    !is.na(df$long)
  )
}
```

## R Web Applications

### Flexdashboard

### Shiny

### Leaflet

#### Data gotchas

- Make sure your data points all have `lat` and `long` values. One dataset I was working with had 15,000+ records but some were missing valid coordinates. The result was Leaflet rendered only a fraction of the data until I filtered out the data points with bad coordinates, and it did so without any errors or warnings.

#### adding popups

### links!

- [Animating Leaflet Markers]( http://piratefsh.github.io/how-to/2015/10/16/animating-leaflet-markers.html)

### Examples
