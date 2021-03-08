from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn import metrics
import sqlite3

conn = sqlite3.connect("data/FPA_FOD_20170508.sqlite")

import pandas as pd

df = pd.read_sql_query("SELECT \
                        STAT_CAUSE_DESCR, OWNER_CODE, DISCOVERY_DOY, FIRE_SIZE, LATITUDE, LONGITUDE \
                        FROM Fires \
                        WHERE (FIRE_YEAR=2015 AND STATE != 'AK' AND STATE != 'HI');", conn)

features = ["OWNER_CODE", "DISCOVERY_DOY", "FIRE_SIZE", "LATITUDE", "LONGITUDE"]
X = df[features]
y = df["STAT_CAUSE_DESCR"]

le = LabelEncoder()
y = le.fit_transform(y)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.33, random_state=42, stratify=y)

clf = RandomForestClassifier()
clf.fit(X_train, y_train)

preds = clf.predict(X_test)
conmat = metrics.confusion_matrix(y_test, preds)
acc = metrics.accuracy_score(y_test, preds)
