# 1 - Activate.R
# In this script:
# 1.1 - Restart R
# 1.2 - Activate a Python virtual environment

# ========================================================================================================
# 1.1 - Restart R ========================================================================================

# Use one of the four following methods: 
# Select menu Session > Restart R
# Use the keyboard shortcut shift + cmd/ctrl + F10
# Execute the command
.rs.restartR()
# Restart RStudio

# ========================================================================================================
# 1.2 - Activate a Python virtual environment ============================================================

# 1.2.1 - virtuanenv =====================================================================================
# load reticulate
library(reticulate)

# Suggest python build
# use_virtualenv("modern_data") 

# Force Python build
use_virtualenv("~/modern_data", required = TRUE) 

# Explicit
# use_python(virtualenv_python("modern_data"), required = TRUE)

# Check current build (confirm that the virtual environment name is shown in the Python path in the first line)
py_config()

# 1.2.2 - miniconda ======================================================================================
# load reticulate
library(reticulate)

# Suggest Python build
# use_miniconda("modern_data")

# Force Python build
use_miniconda("~/modern_data", required = TRUE) 

# Check current build
py_config()