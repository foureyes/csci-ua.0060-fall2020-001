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
	* on `i6`, the web server is [apache](https://httpd.apache.org/)
	* we run python scripts in response to web requests
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

# optionally add debug mode 
# so that stack trace shows up in response
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
## Listening / Running

Depending on where we want our application to live, __running flask will vary__ &rarr;

1. {:.fragment} if we're running as __development server__ locally or on `i6` with a custom port number outside of apache 
	* {:.fragment} `FLASK_APP=hello.py python3 -m flask run --host=0.0.0.0 --port=10000`
	* {:.fragment} `FLASK_APP` is the environment variable specifying the file to run
	* {:.fragment} `-m flask` means to execute the module as a script
	* {:.fragment} `run` is a flask sub command to start the application
	* {:.fragment} finally, host and port specify which host and port to listen on
2. {:.fragment} if we're running on `i6` through apache, we'll have to configure our app to run as cgi (which we'll discuss later)

__Let's see if we can run this on `i6` through the development server__ &rarr;
{:.fragment}
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
## Templates

__Returning html as strings is tedious, cumbersome and error prone!__


Let's try using __templating__! Templates allow us to:
{:.fragment}

1. {:.fragment} create an html document with placeholders for data (along with some control structures)
2. {:.fragment} insert values into those placeholders through our flask application

</section>

<section markdown="block">
## Templates Location and Syntax

1. {:.fragment} create `templates` folder to store html templates
2. {:.fragment} templates can contain regular html
2. {:.fragment} within template, in addition to html, variables and control structures can be used:
	* `{% raw %}{{variable_name}}{% endraw %}` or `{% raw %}{{variable_name['key']}}{% endraw %}` outputs the variable or value at dictionary key as text
	* `{% raw %}{% control_structure %} {% endraw %}`, such as `{% raw %}{% for ele in li %}{% endfor %} {% endraw %}` allows looping, conditionals, etc.
	* within control structures, _regular_ html will be rendered on the page
</section>

<section markdown="block">
##  Using Templates

__To actually put data and a template together...__ &rarr;

1. {:.fragment} within the flask app, `from Flask import render_template`
2. {:.fragment} `render_template` is a function that merges data with your template
	* {:.fragment} first argument is template name (as a string)
	* {:.fragment} each additional keyword argument sets a variable name and value for your template


[More details on templates](https://jinja.palletsprojects.com/en/2.11.x/templates/)
{:.fragment}

</section>
<section markdown="block">
## Templating Example, Flask App

```
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
    animals = ['ant', 'bat', 'cat']
    artists = [('alice', 1944), ('bob', 1800), ('carol', 2000)]
    return render_template(
            'home-template.html',
            foo='bar',
            animals=animals,
            nested=artists)
```

</section>

<section markdown="block">
## Templating Example, HTML

__Here's an example if a single variable rendered within html__ &rarr;
```
<html>
<body>
<h1>{% raw %}{{foo}}{% endraw %}</h1>
</body>
</html>
```
</section>


<section markdown="block">
## Loops!

__Again, _some_ control structures can be used, such as for loops__

```{% raw %}
<ul>
{% for a in animals %}
<li>{{ a }}</li>
{% endfor %}
</ul>
{% endraw %}```
{:.fragment}

Note that the html is repeated within the loop1
{:.fragment}
</section>

<section markdown="block">
## Nested Loops

__Loops can be nested within loops as well!__  &rarr;

```
{% raw %}<table>
{% for row in nested %}
    <tr>
    {% for val in row %}
        <td>{{ val }}</td>
    {% endfor %}
    </tr>
{% endfor %}
</table>{% endraw %}
```
{:.fragment}
</section>

<section markdown="block">
## Capturing Parts of the URL

__You can grab pieces of the url's path to use as variables within your route__ &rarr;

```
from Flask import escape
@app.route('/artists/<name>')
def bar(name):
	# name is now available as a variable!
    return escape(name)
```
{:.fragment}

__Why might this be useful?__ &rarr;
{:.fragment}

You could potentially use this variable to influence what data you retrieve from your database
{:.fragment}
</section>

<section markdown="block">
## Default Values

__If you'd like a default value assigned to a url path part in case it's not present, you can stack @app.route decorators__ &rarr;

```
@app.route('/artists/', defaults={'constituent_id': None})                                                   
@app.route('/artists/<constituent_id>')
def artists(consituent_id):
	# if url is /artists
	# consituent_id will be None
```
{:.fragment}

</section>

<section markdown="block">
## Together

__It's possible to combine__

1. {:.fragment} retrieving data from the database
2. {:.fragment} our flask app
3. {:.fragment} templating
4. {:.fragment} capturing parts of a url path

__So that if we__
{:.fragment}

1. {:.fragment} go to `/artists`, we get a list of artists as divs (from a template)
2. {:.fragment} go to `/artists/1234`, we get the artist with id 1234


__Let's give it a try!__ &rarr;
{:.fragment}
</section>

<section markdown="block">
## Initial Imports and Setup

__We'll be using all three modules again, `flask`, `pymysql`, and `configparser`__:

```
from flask import Flask, render_template
from  configparser import ConfigParser
import pymysql
```
{:.fragment}

Create our flask app
{:.fragment}

```app = Flask(__name__)```
{:.fragment}

</section>

<section markdown="block">
## Database and Configuration

__As usual, we'll create functions to help configure our application and connect to the database__ &rarr;

```
def get_config(fn):
    parser = ConfigParser()
    parser.read(fn)
    db = parser.items('db')
    return {name: value for name, value in db}

def get_conn(conf):
    conn = pymysql.connect(**conf, cursorclass=pymysql.cursors.DictCursor)
    return conn.cursor(), conn
```

Create a configuration dictionary as a global:
{:.fragment}

```
conf = get_config('/path/to/config')
```
{:.fragment}



</section>

<section markdown="block">
## Retrieving Artists from the Database

__Let's create a helper function to retrieve a single artists or a list of artists__ &rarr;

```
def get_artists(constituent_id=None):
    cur, conn = get_conn(conf)
    if constituent_id is None:
        q = 'SELECT * FROM artist LIMIT 5'
        cur.execute(q)
    else:
        q = 'SELECT * FROM artist WHERE constituent_id = %s'
        cur.execute(q, (constituent_id,))
    return cur.fetchall()
```
{:.fragment}

</section>
<section markdown="block">
## Our Route

__Our route will allow an id in the path... if there's no id, then default it to None__

```
@app.route('/artists/', defaults={'constituent_id': None})
@app.route('/artists/<constituent_id>')
def artists(constituent_id):
    artists = get_artists(constituent_id)
    return render_template('artists.html', artists=artists)
```
</section>

<section markdown="block">
## Artists Template

Here's an example template:

```
{% raw %}<html>
<body>
{% for a in artists %}
<div>{{ a['constituent_id'] }} - {{ a['name'] }}</div>
{% endfor %}
</body>
</html>
</section>{% endraw %}
```
</section>

<section markdown="block">
## Deploying in i6 

__Running our flask application with `python3 -m flask run` has a few drawbacks__ &rarr;

* {:.fragment} it's a _development web server_, so it's not as fast, stable, and secure as a server that's actually designed specifically for serving web content
* {:.fragment} without modifications to the command, the flask app starts running when you close the terminal / log off of i6

__On `i6` our Python based web app can be  _served_ by a web server through _cgi_.__
{:.fragment}

This basically means that when a request is made to the web server, Apache, it hands over the responsibility of formulating a response to our script. __To set this up...__ &rarr;
{:.fragment}
</section>

<section markdown="block">
## Flask on i6 Through CGI


Some prep...

1. make sure you have a `cgi-bin` in your `public_html` folder
2. modify the permissions so that your app / script is executable
3. [see full details](https://cims.nyu.edu/webapps/content/systems/userservices/webhosting#CGI)
4. wrap your application in Python's cgi handler...  (this sets up things like making print statements send back data to the client, supplying the script with the request information, etc.)


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
## More Debugging

__Not best practice, but useful when starting out / debugging... you add this to your list of "routes" to show any runtime errors from the app in the response to the browser__ &rarr;

```
@app.errorhandler(Exception)
def handle_error(e):
    return f'{e}'
```
</section>


<section markdown="block">
## Further Reading

We've covered only very small portion of integrating a database with a web application. __If you'd like to explore flask further, check out these topics__ &rarr;

* [handling request data (using forms)](https://flask.palletsprojects.com/en/1.1.x/quickstart/#accessing-request-data)
* [using sessions to persist data between request and response cycles](https://flask.palletsprojects.com/en/1.1.x/quickstart/#sessions)
* [handling errors gracefully, using redirects](https://flask.palletsprojects.com/en/1.1.x/quickstart/#redirects-and-errors)



</section>
