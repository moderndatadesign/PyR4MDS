# A simple Python script

# Import python package modules
from sklearn import datasets
from sklearn.svm import SVC

# Load the data, names iris_py to avoid a naming conflict with R's iris dataset
iris_py = datasets.load_iris()

# Create an instance of the SVC, _Support Vector Classification_, class
clf = SVC()

# Call the fit methods on the target, using target names
clf.fit(iris_py.data, iris_py.target_names[iris_py.target])
