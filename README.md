
Functions to quickly see what a dataset looks like

```coffee
    library(devtools)
    source_url('https://raw.githubusercontent.com/timcdlucas/see/master/R/see.R')

    z <- data.frame(a = rnorm(50), b = rexp(50), d = runif(50))

    see(z)
```

gives you

![Example histograms on a dataframe](example.png)


I'd like to do more with this, but struggling for ideas. Get in touch or take the code so far and do something with it please!
