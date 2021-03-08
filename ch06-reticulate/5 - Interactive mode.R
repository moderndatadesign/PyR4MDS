# interactive mode


# Calling a python script

# set up:
# 1 -Create your virtual environment
# 2 - Install desired packages
# 3 - Restart R

library(reticulate)
use_virtualenv("modern_data", required = TRUE)
py_config()
repl_python()


# Paste these commands into the Python console
from sklearn import datasets
from sklearn.svm import SVC
iris = datasets.load_iris()
clf = SVC()
clf.fit(iris.data, iris.target_names[iris.target])
clf.predict(iris.data[:3])
exit

# After you exit the interpreter you'll still have access to objects in the Python environment
# predictions
py$clf$predict(np_array(as.matrix(iris[-5])))


# And you'll have access to R objects in the interpreter as well.
data(PlantGrowth)
repl_python()

# Execute this in the Python console
r.PlantGrowth
