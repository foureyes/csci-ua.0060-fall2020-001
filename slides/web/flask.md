---
layout: slides
title: "HTTP, flask"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## 

pip3 install flask
pip3 install --ignore-installed flask
for now installation is...
use venv to create virtualenv




chmod 711 /web/$USER/cgi-bin


chmod 755 /web/$USER/cgi-bin/sample-script.cgi

https://cims.nyu.edu/webapps/content/systems/userservices/webhosting#CGI


errors
https://flask.palletsprojects.com/en/1.1.x/errorhandling/
</section>

<section markdown="block">
## 

import random
from flask import Flask
app = Flask(__name__)

from configparser import ConfigParser
import pymysql

def load_config(fn):
    parser = ConfigParser()
    parser.read(fn)
    return {k: v for k, v in parser.items('db')}

def connect():
    config = load_config('/home/jjv222/.config/mysql.ini')
    conn = pymysql.connect(**config, cursorclass=pymysql.cursors.DictCursor)
    cursor = conn.cursor()
    return cursor


@app.route('/')
def home():
    cursor = connect()
    q = 'select * from report limit 5'
    cursor.execute(q);
    html = ''
    for row in cursor:
        html += f'<div>{row["report_id"]} - {str(row["event_date"])}</div>'
    return html

@app.errorhandler(Exception)
def handle_error(e):
    return f'{e}'

</section>
