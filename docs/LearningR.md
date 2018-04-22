
## Learning R

### Set up

- Download R [here](https://cran.rstudio.com/)
- Download an IDE for R such as [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install and start coding

### Install packages with R

If you have RStudio, you can go on the bottom right panel and click on Packages > install as specified [here](http://derekogle.com/IFAR/supplements/installations/InstallPackagesRStudio.html)

Or directly with R:

```R
# Install the package
install.packages("packageName")

# Load the library for the current script
library(packageName)
```

### Display the results

Once you start playing around with data, you generate graphs or you want to play with your results. I came across [shiny dashboard](https://rstudio.github.io/shinydashboard/index.html) which is a R librairy made by rstudio that provides exactly what you need in order to create dashboard.

It is rather simple and intuitive and has a good [visual](https://gallery.shinyapps.io/087-crandash/).

![](https://rstudio.github.io/shinydashboard/images/crandash.png)

### Sources

- [Quick R](http://www.statmethods.net/index.html)
- [DataCamp](https://www.datacamp.com/courses/free-introduction-to-r)
- [Working with data frames](https://en.wikibooks.org/wiki/R_Programming/Working_with_data_frames)
- [R cookbook](http://www.cookbook-r.com/)
- [Shiny Dashboard](https://github.com/rstudio/shinydashboard)