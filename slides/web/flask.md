---
layout: slides
title: "flask"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## Python and MySQL/MariaDB? Y THO?

__Why might we use python and a database together__ &rarr;

* {:.fragment} we may want some application that we wrote in Python to have access to a database!
	* {:.fragment} maybe a web site that stores information in the database
	* {:.fragment} maybe a desktop application that saves "state" in a database
* {:.fragment} maybe you need a language that's more expressive than sql
	* {:.fragment} maybe preparing data before inserting into a database
	* {:.fragment} maybe using Python's ecosystem of tools to analyze data already in a database
		* visualization, machine learning, etc.

__Let's a very brief tour of how you might have a site that's backed by a database__ &rarr;
{:.fragment}

</section>
<section markdown="block">
## Flask 

Flask is a __web framework__ &rarr;

1. a framework is a library that makes doing _some web development_ related tasks easier
2. flask is not the server (though it has a built in server for development)

</section>
<section markdown="block">
## Installing Flask

__On `i6`, flask can be installed with__:

```
pip3 install --ignore-installed flask
```

More generally, though
{:.fragment}

* `pip install flask`
* or add to requirements.txt / `pip freeze`
* or use `conda install -c anaconda flask`
* use [venv to create virtualenv](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)
{:.fragment}

</section>
<section markdown="block">
## Flask App

__A flask site is centered around an application object (it represents your web app)__

Create it with a constructor, `Flask`:

```
# import
from flask import Flask

# creating our app
app = Flask(__name__)

# debug mode so that stack trace shows up in response
app.debug = True 
```

The argument to `Flask`, a name, is used internally for identifying your application. 


</section>

<section markdown="block">
## Responding to a Path

__To have your flask app respond to a path, define a function and add an `@app.route('/somepath')` decorator to it__:

```
@app.route('/')
def hello():
    return 'hello'
```
{:.fragment}

* {:.fragment} the argument to `route` is the path
* {:.fragment} the return value of the function is what is sent back to the browser


</section>

<section markdown="block">
## Additional Notes on Route Functions

__Details are a bit off topic for this class, but if you're interested in web development, you can add routes that deal with different kinds of requests, render templates, etc.__

```
@app.route('/test-post', methods=['POST'])
def test_post():
    return 'yup, that was a POST'

@app.route('/test-template', methods=['POST', 'GET'])
def template_test():
    return render_template('test.html', foo='bar', baz=['qux', 'quxx'])
```
</section>

<section markdown="block">
## Deploying on i6

__On `i6` our web app is _served_ by a web server through _cgi_.__

This basically means that when a request is made to the web server, it hands over the responsibility of formulating a response to our script. To set this up...

* make sure you have a `cgi-bin` in your `public_html` folder
* modify the permissions so that your app / script is executable
* [see full details](https://cims.nyu.edu/webapps/content/systems/userservices/webhosting#CGI)
* wrap your application in Python's cgi handler...  (this sets up things like making print statements send back data to the client, supplying the script with the request information, etc.)


</section>

<section markdown="block">
## A Wrapper

__On `i6`, assuming that your application, called `app` is inside a file called `myapp`__... the following cgi script will delegate the responsibility of handling requests to your flask app

```
#!/usr/bin/python3
import traceback
try:
    from wsgiref.handlers import CGIHandler
    from myapp import app
    CGIHandler().run(app)
except:
    print("Content-Type: text/html\r\n\r\n")
    print(f"<pre>{traceback.format_exc()}</pre>")
```

Note the example code above is for debugging purposes. Normally, detailed errors would be written to a log file rather than printed out on a web page.
{:.fragment}

</section>

<section markdown="block">
## With PyMySQL

__We can combine flask with pymysql to read data from a database and send back html containing that dadta!__

We'll have to configure and use `pymysql` within our app, so there will be some additional code...

</section>

<section markdown="block">
## Imports

__Imports and initial setup__

```
import pymysql
from flask import Flask
app = Flask(__name__)
```
</section>

<section markdown="block">
## Loading an External Configuration

__Rather than hardcoding our credentials, we can read them from a file. Here's one way to do it [if your config file format is .ini](https://en.wikipedia.org/wiki/INI_file#Sections)__

```
from configparser import ConfigParser

def load_config(fn):
    parser = ConfigParser()
    parser.read(fn)
    return {k: v for k, v in parser.items('db')}
```

This returns a dictionary containing keys  like `username`... and values with the appropriate values from the file.

</section>


<section markdown="block">
## Connecting

__Figuring out when and how many connections to make for web apps can be an entirely separate class! For now, we just create a new connection every time the script is called... and we can lump all of this functionality into a single function__

```
def connect():
    config = load_config('/path/to//mysql.ini')
    conn = pymysql.connect(**config, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    return cursor
```
</section>

<section markdown="block">
## Finally, a Route!

```
@app.route('/')
def home():
    cursor = connect()
    q = 'select * from report limit 5'
    cursor.execute(q);
    html = ''
    for row in cursor:
        html += f'<div>{row["report_id"]} - {str(row["event_date"])}</div>'
    return html
```
</section>

<section markdown="block">
## More Debugging

__Again, not best practice, but useful when starting out / debugging... let's add this function to show any runtime errors from the app in the response to the browser__ &rarr;

```
@app.errorhandler(Exception)
def handle_error(e):
    return f'{e}'
```
</section>


