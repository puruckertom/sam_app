from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    import sys
    version = sys.version
    return 'Hello World! Python Version = %s' % version


if __name__ == '__main__':
    app.run(port=7778, debug=True)
