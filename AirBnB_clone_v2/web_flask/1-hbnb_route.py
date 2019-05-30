#!/usr/bin/python3
# add route '/hbnb' returns HBNB
from flask import Flask

app = Flask(__name__)
app.url_map.strict_slashes = False


@app.route('/')
def index():
    '''return a string as default
    '''
    return 'Hello HBNB!'


@app.route('/hbnb')
def hbnb():
    ''' return string for route /hbnb
    '''
    return 'HBNB'


if __name__ == '__main__':
    app.run()
