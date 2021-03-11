# Python & R for the Modern Data Scientist
# Companion script to Chapter 2: R for Python Users

# Import a data set from a file using a base R command
diamonds <- read.csv("ch02-r4py/data/diamonds.csv")

# Install a package, e.g. tidyverse:
# install.packages("tidyverse")

# Get library paths
.libPaths()

# Load a package
library(tidyverse)

# Import a data set from a file using a tidyverse command
diamonds_2 <- read_csv("ch02-r4py/data/diamonds.csv")

# Alternatively, without loading the package
# diamonds_2 <- readr::read_csv("ch02-r4py/data/diamonds.csv")

# Print a max outpur of diamonds
diamonds

# Nicer format
diamonds_2

# Show classes
class(diamonds)
class(diamonds_2)

# Types
a <- c(TRUE, FALSE)
typeof(a)

b <- c(1, 2)
typeof(b)

c <- c(3.14, 6.8)
typeof(c)

# Coercion
b <- as.integer(c(1, 2))
typeof(b)

# Integer specification
b <- c(1L, 2L)
typeof(b)

d <- c("a", "b")
typeof(d)

# A tibble from scratch
my_tibble <- tibble(a = c(T, F),
                    b = c(1L, 2L),
                    c = c(3.14, 6.8),
                    d = c("a", "b"))
my_tibble

# Structure:
str(my_tibble)
glimpse(my_tibble)


# Naming things:
# Base package version
# Data.frame
data.frame("Weight (g)" = 15,
           "Group" = "trt1",
           "5-day check" = TRUE)

# Importing, no header:
diamonds_base_nohead <- read.csv("ch02-r4py/data/diamonds_noheader.csv", header = F)
names(diamonds_base_nohead)

# Tidyverse

# tibble
tibble("Weight (g)" = 15,
       "Group" = "trt1",
       "5-day check" = TRUE)

# Importing, no header:
diamonds_base_nohead <- read_csv("ch02-r4py/data/diamonds_noheader.csv", header = F)
names(diamonds_base_nohead)

# Lists
typeof(my_tibble)
glimpse(PlantGrowth)
str(PlantGrowth)

pg_lm <- lm(weight ~ group, data = PlantGrowth)

typeof(pg_lm)
class(pg_lm)


names(PlantGrowth)
PlantGrowth$weight

names(pg_lm)
pg_lm$coefficients

# Using ~ and . notation
lm(len ~ ., data = ToothGrowth)
lm(len ~ supp + dose, data = ToothGrowth)
lm(len ~ supp * dose, data = ToothGrowth)

# Factors
typeof(PlantGrowth$group)
class(PlantGrowth$group)
dput(PlantGrowth$group)

# order factors
diamonds$color

# Logical Expressions
diamonds$price > 18000
diamonds$price > 18000 & diamonds$carat < 1.5

# Do math
sum(diamonds$price > 18000 & diamonds$carat < 1.5)
sum(diamonds$price > 18000 & diamonds$carat < 1.5)/nrow(diamonds)

# Indexing
letters[1]
letters[-4]
letters[-(1:20)]
letters[23:26]
letters[23:length(letters)]
# letters[23:] # error
df[1]
t[6]
diamonds$color[diamonds$price > 18000 & diamonds$carat < 1.5]
diamonds[diamonds$price > 18000 & diamonds$carat < 1.5, "color"]

diamonds %>%
  filter(price > 18000, carat < 1.5) %>%
  select(color)

# Other dplyr functions
PlantGrowth %>%
  group_by(group) %>%
  summarise(avg = mean(weight),
            stdev = sd(weight))


irrigation <- read_csv("ch02-r4py/data/irrigation.csv")

irrigation %>%
  group_by(region) %>%
  mutate(area_std_1980 = area/area[year == 1980])

irrigation <- irrigation %>%
  group_by(region) %>%
  mutate(area_std_1980 = area/area[year == 1980],
         area_per_change = c(0, diff(area)/area[-length(area)] * 100))

# apply family
tapply(PlantGrowth$weight, PlantGrowth$group, mean)
tapply(PlantGrowth$weight, PlantGrowth$group, sd)