# Python & R for the Modern Data Scientist
# Companion script to Chapter 3: Python for R Users

# import an entire library
import math # Functions beyond the basic maths

# Import an entire library and give it an alias
import pandas as pd # For DataFrame and handling
import numpy as np # Array and numerical processing
import matplotlib.pyplot as plt # Low level plotting
import seaborn as sns # High level Plotting
import statsmodels.api as sm # Modeling, e.g. ANOVA

# Import only specific modules from a library
# we'll use this for the t-test function
from scipy import stats

# Import only specific functions from a library 
# ols is for ordinary least squares
from statsmodels.formula.api import ols

# Use a function in thje math package:
math.log(8, 2)

plant_growth = pd.read_csv('data/plant_growth.csv')

# Examine:
# Methods
plant_growth.info()
plant_growth.describe()
plant_growth.head()

# Attributes
plant_growth.shape
plant_growth.columns

# A method on a series:
plant_growth['group'].value_counts()
np.mean(plant_growth['weight'])

# summary statistics
plant_growth.groupby(['group']).describe()
plant_growth.groupby(['group']).agg({'weight':['mean','std']})

# Produces Pandas Series
plant_growth.groupby('group')['weight'].mean()

# Produces Pandas DataFrame
plant_growth.groupby('group')[['weight']].mean()

# Data Visualizations
sns.boxplot(x='group', y='weight', data=plant_growth)
plt.show()

sns.catplot(x="group", y="weight", data=plant_growth)
plt.show()

# Alternatively
# sns.stripplot(x='group', y='weight', data=plant_growth, jitter=0.2)

sns.catplot(x="group", y="weight", data=plant_growth, kind="point")
plt.show()

# fit a linear model
# specify model
model = ols("weight ~ group", plant_growth)

# fit model
results = model.fit()

# extract coefficients
results.params.Intercept
results.params["group[T.trt1]"]
results.params["group[T.trt2]"]

# Explore model results
results.summary()

# ANOVA
# compute anova
aov_table = sm.stats.anova_lm(results, typ=2)

# explore anova results
aov_table
print(aov_table)

# Tukey HSD
from statsmodels.stats.multicomp import pairwise_tukeyhsd
print(pairwise_tukeyhsd(plant_growth['weight'], plant_growth['group']))
