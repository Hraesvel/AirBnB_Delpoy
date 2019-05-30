#!/usr/bin/python3
# add route '/hbnb' returns HBNB
from flask import Flask

app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/')
def index():
    ''' returns string
    '''
    return 'Hello HBNB!'


@app.route('/hbnb')
def hbnb():
    '''returns string HBNB
    '''
    return 'HBNB'


@app.route('/c/<text>')
def c_said(text):
    '''retuns a string with "C <text>"
    '''
    return "C {}".format(text.replace('_', ' '))


if __name__ == '__main__':
    app.run()
