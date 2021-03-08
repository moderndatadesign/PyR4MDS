# 0 - Setup.R
# In this script:
# 0.1 - Install & load reticulate
# 0.2 - Set default Python build
# 0.3 - Create a virtual environment
# 0.4 - Populate the virtual environment

# ========================================================================================================
# 0.1 - Install & load reticulate ========================================================================
# Check install, or...
if(!require(reticulate)) {install.packages("reticulate"); library(reticulate)}

# ... just load if already installed
library(reticulate)

# ========================================================================================================
# 0.2 - Set default Python build =========================================================================
# Set default Python build
use_python("/usr/local/bin/python3.8", required = TRUE)

# Check 
py_config()

# ========================================================================================================
# 0.3 - Create a virtual environment =====================================================================

# 0.3.1 - Virtualenv admin ===============================================================================
# If you're on Windows you're best bet is to use miniconda (see 0.3.2, below).
# Otherwise use virtualenv

# Find where your virtual environments are:
virtualenv_root()

# list a create a new virtualenv
virtualenv_list()
virtualenv_create("modern_data")
# virtualenv_remove("modern_data")

# 0.3.2 - miniconda ======================================================================================
# Before you get started, 
# you'll need to install or update miniconda.
# You can do this directly from R.
install_miniconda()
miniconda_update()

# Check miniconda path
miniconda_path()

# list and create a new conda env
conda_list()
conda_create("modern_data")
# conda_remove("modern_data")

# ========================================================================================================
# 0.4 - Populate the virtual environment =================================================================
# You may choose to use the generic function ...
# py_install("scikit-learn", "modern_data")
# ... or the two specifics given below 

# 0.4.1 - virtualenv =====================================================================================
# Install a single package
virtualenv_install("modern_data", "seaborn")

# Install multiple packages
# Using purrr map()
library(tidyverse)
c("scikit-learn", "pandas", "seaborn") %>%
  purrr::map(~ virtualenv_install("modern_data", .))

# Using old school apply family (no need for additional packages)
lapply(c("scikit-learn", "pandas", "seaborn"), 
       function(x) 
         virtualenv_install("modern_data", x)
       )

# 0.4.1 - miniconda ======================================================================================
# Install a single package
conda_install("modern_data", "scikit-learn")

# Install multiple packages
# Using purrr map()
library(tidyverse)
c("scikit-learn", "pandas", "seaborn") %>%
  purrr::map(~ conda_install("modern_data", .))

# Using old school apply family (no need for additional packages)
lapply(c("scikit-learn", "pandas", "seaborn"), 
       function(x) 
         conda_install("modern_data", x)
)