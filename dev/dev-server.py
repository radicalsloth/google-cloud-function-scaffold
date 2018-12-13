""" Dev server for a Google Cloud Function Python 3.7 environment """
from flask import Flask, request
from cloud_function.main import main as functions_main


app = Flask(__name__)


@app.route('/')
def main():
    return functions_main(request)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
