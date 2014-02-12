# Add the ability to pass columns roles for further
# processing downstream
#
# Thanks to Oliver Gjoneski
#
# Role columns must follow column they pertain to.  Proper naming
# conventions must be be observed.  For example, roles fulfilling tooltip
# roles and must be called "foo.blah.tooltip".
#
# For more details see:
# https://developers.google.com/chart/interactive/docs/roles

df <- data.frame(year=1:11,pop=1:11,
                 pop.html.tooltip=letters[1:11])

plot( 
  gvisScatterChart(df,
                   options=list(tooltip="{isHtml:'true'}")
  )
)

df <- data.frame(year=1:11,pop=1:11,
                 pop.html.tooltip=letters[1:11],
                 y=11:1, y.html.tooltip=LETTERS[11:1],                 
                 y.certainty=c(rep(TRUE, 5), rep(FALSE, 6)),
                 y.scope=c(rep(TRUE, 5), rep(FALSE, 6)),
                 y.emphasis=c(rep(FALSE, 4), rep(TRUE, 7)))

plot(
  gvisScatterChart(df,
                   options=list(tooltip="{isHtml:'true'}",              
                                lineWidth=2))
)


dat <- data.frame(Year=2010:2013,
                  Sales=c(600, 1500, 800, 1000),
                  Sales.html.tooltip=c('$600K in our first year!',
                                       'Sunspot activity made this our best year ever!',
                                       '$800K in 2012.',
                                       '$1M in sales last year.'),
                  Sales.certainty=c(TRUE, FALSE, TRUE, FALSE),
                  Sales.emphasis=c(TRUE, TRUE, FALSE, FALSE))

plot(
  gvisColumnChart(dat, xvar='Year', 
                  yvar=c('Sales', 'Sales.certainty'), 
                  options=list(tooltip="{isHtml:'true'}")
  )
)

plot(
  gvisLineChart(dat, xvar='Year', 
                yvar=c('Sales', 'Sales.emphasis', 
                       'Sales.html.tooltip'),
                options=list(tooltip="{isHtml:'true'}")
  )
)


df <- data.frame(country=c("US", "GB", "BR"), 
                 val1=c(1,3,4), 
                 val1.emphasis=c(TRUE, TRUE, FALSE),
                 val2=c(23,12,32))

plot(
  gvisLineChart(df, xvar="country", 
                yvar=c("val1", "val1.emphasis")
  )
)

plot(
  gvisLineChart(df, xvar="country", 
                yvar=c("val1", "val1.emphasis", "val2")
  )
)