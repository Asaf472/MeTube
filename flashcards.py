from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

# https://jinja.palletsprojects.com/en/3.1.x/templates/#builtin-filters
@app.route("/")
def welcome():
    return "Hello world"


@app.route("/<name>")
def user(name):
    return render_template("index.html",
                           date=str(datetime.now()),
                           name=name,
                           list=["A", "B", "C", 10])

