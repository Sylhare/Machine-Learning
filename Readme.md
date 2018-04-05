# Machine Learning

A repository for all related to machine learning.

## Machine Learning 

### Sources

Here are some couple resources to get started with machine learning.

- [fast.ai](http://www.fast.ai/)
- [deeplearning.ai](https://www.deeplearning.ai/)
- [Choose the machine learning algorithm](https://blogs.sas.com/content/subconsciousmusings/2017/04/12/machine-learning-algorithm-use/?utm_source=linkedin&utm_medium=cpc&utm_campaign=analytics-global&utm_content=US_skills_audience-network)

### Open AI

OpenAI Gym is a toolkit for developing and comparing reinforcement learning algorithms

- Get started with [Open AI](https://gym.openai.com/docs)

Tests has been made with Open AI v0.6.0 so it might be outdated already since it's evolving quickly check it out at [openai/gym](https://github.com/openai/gym). Try the examples with:

```
pip install -Iv gym==0.6.0
```

> It was not tested, check the documentation for more information. I was a bit disappointed with it.

## Machine Learning with R

### Set up

- Download R [here](https://cran.rstudio.com/)
- Download an IDE for R such as [RStudio](https://www.rstudio.com/products/rstudio/download/)
- Install and start coding

#### Install packages with R

If you have RStudio, you can go on the bottom right panel and click on Packages > install as specified [here](http://derekogle.com/IFAR/supplements/installations/InstallPackagesRStudio.html)

Or directly with R:

```R
# Install the package
install.packages("packageName")

# Load the library for the current script
library(packageName)
```

### Learning R

- [Quick R](http://www.statmethods.net/index.html)
- [DataCamp](https://www.datacamp.com/courses/free-introduction-to-r)
- [Working with data frames](https://en.wikibooks.org/wiki/R_Programming/Working_with_data_frames)
- [R cookbook](http://www.cookbook-r.com/)

### CARET: Classification And REgression Training

Caret provides you with essential tools for:

– Data preparation, including: imputation, centering/scaling data, removing correlated predictors, reducing skewness
– Data splitting
– Model evaluation
– Variable selection


```R
model.mtcars_lm <- train(mpg ~ wt,
                         data = mtcars,
                         method = "lm"
                        )
```

train() is the function that we use to “train” the model. The function that will “learn” the relationship between the target (mpg) and the input (wt).

- formula notation: y ~ x tells caret “I want to predict y on the basis of a single input x.”
- data: which dataset  is used ([mtcars](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html))
- method: which machine learning method is used lm (liner regression model)



### Resources

- [Kaggle](https://www.kaggle.com/wiki/Tutorials) for data science competition
- [Machine learning with R: quick](http://sharpsightlabs.com/blog/quick-introduction-machine-learning-r-caret/)