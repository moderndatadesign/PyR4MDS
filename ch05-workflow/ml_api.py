import pickle
import numpy as np
from ast import literal_eval
from flask import Flask, request, jsonify
app = Flask(__name__)

infile = open("models/regr.pkl", "rb")
regr = pickle.load(infile)
infile.close()


@app.route('/')
def predict(methods=["GET"]):
    payload = request.json["data"]
    input_data = np.array(literal_eval(payload)).reshape(1, -1)
    prediction = regr.predict(input_data)

    return jsonify({
        "prediction": round(float(prediction), 3)
    })


if __name__ == '__main__':
    app.run(debug=True)
