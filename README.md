# Python and R for the Modern Data Scientist Code

## Welcome

Welcome to the companion code repository for the O'Reilly book [Python and R for the Modern Data Scientist](https://learning.oreilly.com/library/view/python-and-r/9781492093398/). You can also access this repository as an [RStudio Cloud](https://rstudio.cloud/project/2534578) project (account required).

![](book_cover.jpeg)

Success in data science depends on the flexible and appropriate use of tools. That includes Python and R, two of the foundational programming languages in the field. With this book, data scientists from the Python and R communities will learn how to speak the dialects of each language. By recognizing the strengths of working with both, you'll discover new ways to accomplish data science tasks and expand your skill set.

Authors [Rick J Scavetta](https://www.linkedin.com/in/rick-scavetta/) and [Boyan Angelov](https://www.linkedin.com/in/angelovboyan/) explain the fundamentals of these languages and highlight where each one excels over the other, whether it's their linguistic features or the power of their open source ecosystems. Not only will you learn how to use Python and R together in real-world settings, but you'll also broaden your knowledge and job opportunities by working as a bilingual data scientist.

* Learn Python and R from the perspective of your current language
* Understand the strengths and weaknesses of each language
* Identify use cases where one language is better suited than the other
* Understand the modern open source ecosystem available for both, including packages, frameworks, and workflows
* Learn how to integrate R and Python in a single workflow
* Follow a real-world case study that demonstrates ways to use these languages together

## Repository structure

When available, companion scripts to the book are found in their respective chapter directories.

Part II. Levels of working together I: Bilingual
* [ch02-r-py: R for Pythonistas](ch02)
* [ch03-py-r: Python for R Users](ch03)

Part III. Modern Context
* [ch04-format: Data Format Context](ch04)
* [ch05-workflow: Workflow Context](ch05)

Part IV. Levels of working together II: Synergy

* [ch06-reticulate: Using the two languages synergistically](ch06)
* [ch07-case-study: Case study](ch07)

Appendix A. Bilingual Dictionary

*  Available [here](http://www.ylz.ncx.mybluehost.me/moderndata.design/PyR4MDS/).


## Datasets

Datasets used in the book can be found as follows.

### Diamonds

This dataset is from the R `ggplot2` package:

```r
library(ggplot2)
data(diamonds)
```

### Iris & Plant Growth

These are available in base R:

```r
data(PlantGrowth)
data(iris)
```

### Boston housing

This dataset is available in using the Python `scikit-learn` package:

```python
from sklearn.datasets import load_boston
boston_data = load_boston()
```

### Amazon music reviews

The Amazon music review data can be downloaded [here](http://jmcauley.ucsd.edu/data/amazon/). We use the "digital music" subset.

### Swimming pool and car detection

This dataset on swimming pool and car detection using satelite imagery is available on [Kaggle](https://www.kaggle.com/kbhartiya83/swimming-pool-and-car-detection).

### Daily Australian Temperatures

The daily australian temperatures dataset can be dowloaded directly from [Github](https://raw.githubusercontent.com/jbrownlee/Datasets/master/daily-min-temperatures.csv).

### Loxodonta Africana species occurence data

Obtain this data and the spatial raster (the bioclimactic varialbes) using the R `sdmbench` package:

```r
library(sdmbench)
data <- get_benchmarking_data("Loxodonta africana")
```

This object is a `list` and contains the occurence data in `data$df_data` and the raster layers in `data$raster_data`.

### Shared cars locations data

These data can be downloaded from [Kaggle](https://www.kaggle.com/gidutz/autotel-shared-car-locations).

### Wildfires

The wildfires data can be downloaded from the [USDA website](https://doi.org/10.2737/RDS-2013-0009.4) directly or from [Kaggle](https://www.kaggle.com/rtatman/188-million-us-wildfires). To run the case study, add the file `FPA_FOD_20170508.sqlite` to the `ch07-case-study/data/` folder.

### Star Wars

This dataset is from the R `dplyr` package:

```r
library(dplyr)
data(starwars)
```
