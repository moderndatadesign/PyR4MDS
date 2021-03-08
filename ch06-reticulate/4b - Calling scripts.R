# 4b - Callilng scripts.R
# In this script:
# Calling an entire Python script and accessing its environment in R

# Load packages
library(reticulate)

# Activate a virtual environment
use_virtualenv("modern_data", required = TRUE)

# Check active build
py_config()

# Execute Python script
source_python("SVC_iris.py")

## Accessing Python functions
clf$predict(r_to_py(iris[-5]))