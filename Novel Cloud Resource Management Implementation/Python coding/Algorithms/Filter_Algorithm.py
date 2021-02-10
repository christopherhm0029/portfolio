#This application reacts as an API that provides the Filter Algorithm function using the dataset created
from flask import Flask, request
import io
import re
import sys
from collections import Counter
import json
from snips_nlu import SnipsNLUEngine
from snips_nlu.default_configs import CONFIG_EN

with io.open("/home/chris/Desktop/filterAlgorithm/dataset.json") as f:
    dataset = json.load(f)
seed = 42
nlu_engine = SnipsNLUEngine(config=CONFIG_EN, random_state=seed)
nlu_engine.fit(dataset)


app = Flask(__name__)


@app.route('/test/<value>')

def hello(value):

    parsing = nlu_engine.parse(value)
    result = json.dumps(parsing, indent=2)
    return result

if __name__ == "__main__":

    app.run()
