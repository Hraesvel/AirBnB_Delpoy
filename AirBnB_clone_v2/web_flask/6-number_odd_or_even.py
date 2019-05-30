#!/usr/bin/python3
# add route '/hbnb' returns HBNB
from flask import Flask
from flask import abort, render_template

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


@app.route('/python')
@app.route('/python/<text>')
def python_said(text='is cool'):
    '''retuns a string with "python <text>"
    '''
    return "Python {}".format(text.replace('_', ' '))


@app.route('/number/<n>')
def is_int_number(n):
    '''check if n is a int number
    '''
    try:
        string = "{} is a number".format(int(n))
        return string
    except Exception:
        abort(404)


@app.route('/number_template/<n>')
def render_is_number(n):
    '''check if n is a int number and render a template
    '''
    try:
        num = int(n)
        return render_template('5-number.html', n=num)
    except Exception:
        abort(404)


@app.route('/number_odd_or_even/<n>')
def render_number_odd_even(n):
    '''check if n is a int number
    then render a template that check if the number is odd or even

    This version does the logic in the script and then suplises the
    answer via dictionary
    '''
    try:
        num = {
            'n': int(n),
            'parity': '{}'.format('even' if int(n) % 2 == 0 else 'odd')
        }
        return render_template('6-number_odd_or_even.html', n=num)
    except Exception:
        abort(404)


if __name__ == '__main__':
    app.run()
