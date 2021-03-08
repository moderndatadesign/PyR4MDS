from sklearn.datasets import load_boston
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn import metrics
import pickle
from mlflow import log_metric, log_param

from sklearn.datasets import load_boston
X, y = load_boston(return_X_y=True)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42)

regr = RandomForestRegressor()
regr.fit(X_train, y_train)
preds = regr.predict(X_test)

accuracy = metrics.mean_squared_error(y_test, preds)

print(accuracy)
log_metric("MSE", accuracy)

outfile = open("models/regr.pkl", "wb")
pickle.dump(regr, outfile)
outfile.close()

print("Model trained & stored!")
