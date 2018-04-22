# Machine Learning

A repository for all related to machine learning.

![](https://raw.githubusercontent.com/Sylhare/Machine-Learning/master/resources/Images/deep-learning-small.jpg)

## Algorithms

There are multiple algorithms available for machine learning, here is a cheat sheet, of the one currently available, how to use them and in which situation.

![](https://raw.githubusercontent.com/Sylhare/Machine-Learning/master/resources/Images/machine-learning-cheet-sheet.png)

### CARET: Classification And Regression Training

Caret provides you with essential tools for:

– Data preparation, including: imputation, centering/scaling data, removing correlated predictors, reducing skewness
– Data splitting
– Model evaluation
– Variable selection

#### Example using R:
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


## Open AI

OpenAI Gym is a toolkit for developing and comparing reinforcement learning algorithms

- Get started with [Open AI](https://gym.openai.com/docs)

Tests has been made with Open AI v0.6.0 so it might be outdated already since it's evolving quickly check it out at [openai/gym](https://github.com/openai/gym). 

Try the examples with:
```
pip install -Iv gym==0.6.0
```

> Check the documentation for more information. I was a bit disappointed with it.

## Sources

Here are some couple resources to get started with machine learning.

- [fast.ai](http://www.fast.ai/)
- [deeplearning.ai](https://www.deeplearning.ai/)
- [Open AI](https://gym.openai.com/docs)
- [Choose the machine learning algorithm](https://blogs.sas.com/content/subconsciousmusings/2017/04/12/machine-learning-algorithm-use/?utm_source=linkedin&utm_medium=cpc&utm_campaign=analytics-global&utm_content=US_skills_audience-network)
- [Machine learning with R: quick](http://sharpsightlabs.com/blog/quick-introduction-machine-learning-r-caret/)
- [Kaggle](https://www.kaggle.com/wiki/Tutorials) for data science competition
