---
layout: slides
title: "MariaDB/MySQL and Python"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## 🐍 + DB

SQL is _great_ and all, but sometimes:

* {:.fragment} you may need to __integrate your database with an external program__
* {:.fragment} ...or you may find that you want the persistent and structured storage of a relational database __combined with the expressiveness of another programming language__ (_like Python_)



```
{% comment %}
from configparser import ConfigParser
from mysql.connector import connect

def load_config(fn):
    parser = ConfigParser()
    parser.read(fn)
    return {k: v for k, v in parser.items('db')}
    print(config)



if __name__ == '__main__':
    config = load_config('config.ini')
    conn = connect(**config)
    cursor = conn.cursor()

    q = 'select * from report limit 5'
    cursor.execute(q);
    for row in cursor:
        print(row)
```
{% endcomment %}
</section>



<section markdown="block">
## DB API 2

So, Python has a specification for accessing / interfacing with databases: [Python Database API Specification v2](https://www.python.org/dev/peps/pep-0249/#introduction)
{:.fragment}

* {:.fragment} it specifies a __consistent set of objects and methods that _should_ be implemented by a module__ that wants to communicate with a database 
* {:.fragment} (like `connection` and `cursor` objects... or an `execute` method)

</section>

<section markdown="block">
## MariaDB/MySQL Libraries

If you search for ways to work with Python and MariaDB/MySQL, the [results may be overwhelming](https://stackoverflow.com/questions/43102442/whats-the-difference-between-mysqldb-mysqlclient-and-mysql-connector-python/46396881#46396881). __However, because most adhere to the standard outlined by DB API 2, high level usage is somewhat similar__. &rarr;

Here are some options:
{:.fragment}

* [PyMySQL](https://github.com/PyMySQL/PyMySQL)
* [mysqlclient](https://github.com/PyMySQL/mysqlclient-python)
* [MySQL Connector](https://github.com/mysql/mysql-connector-python)
{:.fragment}
</section>


<section markdown="block">
## PyMySQL

__`PyMySQL` is a Python module that is:__ &rarr;

* {:.fragment} a _database adapter_ - software that connects an application to a database
* {:.fragment} written in Python 
	* {:.fragment} easier to install
	* {:.fragment} performance is not as fast as `mysqlclient` 
* {:.fragment} __specifically, for connecting to a MySQL/MariaDB 🐬__
* {:.fragment} an implementation of Python DB API 2

</section>

<section markdown="block">
## PyMySQL Install


On `i6`, __use this command__: `pip3 install --ignore-installed pymysql`

(let's do this together)
{:.fragment}

More generally, though...
{:.fragment}

* {:.fragment} with anaconda:
	* `conda install -c anaconda pymysql`
* {:.fragment} with pip
	* `pip install pymysql`
* {:.fragment} use [venv/virtualenv](https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/) to manage your application's dependencies


</section>

<section markdown="block">
## PyMySQL Methods

__`PyMySQL` Methods and Workflow:__ &rarr;

1. {:.fragment} create a connection object with `pymysql.connect()`
	* {:.fragment} `connect` returns a new connection instance
	* {:.fragment} it represents a database session (think: starting up `mysql`)
	* {:.fragment} allows creation of cursor objects 
2. {:.fragment} create a cursor object by calling `cursor` on a `connection` object
	* {:.fragment} allows execution of queries
	* {:.fragment} allows `commit` or `rollback` of transactions
</section>

<section markdown="block">
## PyMySQL Methods Continued

3. {:.fragment} `execute` queries form the `cursor` object
	* {:.fragment} use `execute` to query the database
	* {:.fragment} iteration over result or "fetch" some number of results (`fetchone`, `fetchall`)
4. {:.fragment} use `commit` on the `connection` object to make changes persistent 
	* {:.fragment} (for example, on updates, deletes, and inserts)
	* {:.fragment} (optionally use `rollback` on the `connection` to revert changes)
5. {:.fragment} close the connection
{:start="3"}

</section>

<section markdown="block">
## Example Data

__These slides use [the Museum of Modern Art (MoMA) collection data](https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artists.csv)__ for example data.

<pre><code data-trim contenteditable>
create table artist (
	constituent_id integer,
	name text,
	bio text,
	nationality text,
	gender text,
	begindate smallint,
	enddate smallint,
	wiki_qid text,
	ulan text
);
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
LOAD DATA LOCAL INFILE 'Artists.csv' INTO TABLE artist
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  IGNORE 1 LINES;
</code></pre>
{:.fragment}



</section>

<section markdown="block">
## PyMySQL Connection and Cursor

__Creating a connection object... and a cursor__ &rarr;

<pre><code data-trim contenteditable>
import pymysql
</code></pre>

<pre><code data-trim contenteditable>
conn = pymysql.connect(database="yourusername_test", user="yourusername", password="yourpw", host="warehouse.cims.nyu.edu")
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
# get a cursor object back to execute queries
# (there can be more than one cursor produced from a connection)
cur = conn.cursor()
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## PyMySQL Query Execution

__Construct and run the query__  &rarr;

<pre><code data-trim contenteditable>
# our query as a string...
q = """
SELECT * 
FROM artist 
WHERE nationality = 'American' 
	AND gender = 'Female' 
	AND name ilike 'Z%';
"""
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
# run the query using execute...
cur.execute(q);
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## PyMySQL Working With Query Results

__Once the query has been executed, you can treat the cursor object as an iterator__ &rarr;

<pre><code data-trim contenteditable>
# iterate over the cursor object to see 
# the query results
for res in cur:
    print(res)
</code></pre>
{:.fragment}

⚠️ note that each row is a `tuple`!
{:.fragment}

⚠️ like file objects, your query result can be "exhausted" (can't loop over again)
{:.fragment}

</section>

<section markdown="block">
## Fetch One / All

__Instead of iterating over the cursor, you can also retrieve a single row or all rows as a list of tuples__  &rarr;

<pre><code data-trim contenteditable>
result = cur.fetchone()
print(result)
</code></pre>
{:.fragment}

* {:.fragment} Note that `fetchone` _remembers_ where it was from previous calls 
* {:.fragment} (so you can continue to call it to retrieve more rows from your result set)
* {:.fragment} if you want all rows as a `list` of `tuple`s:

<pre><code data-trim contenteditable>
result = cur.fetchall()
print(result)
</code></pre>
{:.fragment}

Calling `fetchone` with no more rows results in `None`; `fetchall` gives empty list
{:.fragment}
</section>

<section markdown="block">
## Commit

__By default, PyMySQL creates a transaction before executing commands...__ &rarr;

1. {:.fragment} which means that you'll have to `commit` or `rollback`
2. {:.fragment} (not apparent when simply using select statements)
3. {:.fragment} to persist changes, call `commit` on the `connection` object

__⚠️ Make sure to commit after INSERT, UPDATE, and DELETE!__
{:.fragment}


<pre><code data-trim contenteditable>
q = """
insert into artist (name, bio)
values ('joe', 'v')
"""
cur.execute(q)
conn.commit()
</code></pre>
{:.fragment}

</section>
<section markdown="block">
## Close


__You can close the connection to the database by calling `close` on the `connection` objects.__

* {:.fragment} `conn.close()`
* {:.fragment} `cur.close()` is available as well to close a cursor, but not connection 
* {:.fragment} note that once closed, a `cursor` or `connection` can no longer be used
</section>


<section markdown="block">
## Tuples, Ugh

__What's kind of annoying about the row representation when iterating over the results of a query... or when using `fetchone` or `fetchall`?__ &rarr;

We have to use indexes to get at columns!
{:.fragment}

__Dictionaries FTW__
{:.fragment}

An alternative is to use a cursor that gives back dictionaries:
{:.fragment}


<pre><code data-trim contenteditable>
conn = pymysql.connect(.., cursorclass=pymysql.cursors.DictCursor)
</code></pre>
{:.fragment}

Now we'll have column names as dictionary keys 👍
{:.fragment}
</section>

<section markdown="block">
## BAD STUFF HERE

__⚠️ Do not use this code!!!! (why?) ⚠️__ &rarr;

(note that the `input` function returns user input as a string)
{:.fragment}
<pre><code data-trim contenteditable>
import pymysql

conn = pymysql.connect(..., client_flag=pymysql.constants.CLIENT.MULTI_STATEMENTS)
cur = conn.cursor()

artist_name = input('Give me an artist name to search for\n> ')
q = f"select * from artist where name like '%{artist_name}%'"

cur.execute(q)
conn.commit()
for row in cur:
    print(row)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## So, What was Bad About That?

__Let's try to search for this artist__ &rarr;

<pre><code data-trim contenteditable>
Georgia O'Keeffe
</code></pre>
{:.fragment}

Oh no... `'` is a special character in SQL. 😮
{:.fragment}

Or how about _this artist_???
{:.fragment}

<pre><code data-trim contenteditable>
jack%'; insert into artist (name, bio) values ('joe', 'hello'); select '% 
</code></pre>
{:.fragment}

Yes, SQL 💉. Now we have __big__ problem. 😱 ([see xkcd](https://xkcd.com/327/))
{:.fragment}
</section>

<section markdown="block">
## Lesson?

__So, what have we learned?__ &rarr;

__DO NOT USE....__

* {:.fragment} concatenation
* {:.fragment} format
* {:.fragment} % operator
* {:.fragment} format strings

...to construct queries 🚫
{:.fragment}

__Otherwise, your application will be vulnerable to SQL Injection__
{:.fragment}

</section>

<section markdown="block">
## Parameterized Queries

__Instead of using concatenation, etc. ... use parameterized queries__ &rarr;

* {:.fragment} `execute` actually takes two arguments:
	* {:.fragment} a string with `%s` as placeholders
	* {:.fragment} a tuple of values
* {:.fragment} the values will be placed into the `%s` placeholders with the proper SQL syntax corresponding to the Python type
	* {:.fragment} for example: `str`s will be quoted with `'` and `'` characters will be escaped
	* {:.fragment} `int`s won't be quoted at all...
</section>

<section markdown="block">
## Parameterized Query Example

__As a contrived example... the following pymysql execute__

<pre><code data-trim contenteditable>
q = """
INSERT INTO student_exam (last_name, exam_date, score) 
VALUES (%s, %s, %s)"""

vals = ("D'Arras", datetime.date(2018, 10, 15), 85)
cur.execute(q, vals)
</code></pre>
{:.fragment}

... will be translated into this SQL (notice: appropriate quoting, escaped apostrophes, etc.)
{:.fragment}

<pre><code data-trim contenteditable>
INSERT INTO student_exam (netid, exam_date, score)
VALUES ('D''Arras', '2018-10-15', 85);
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Fixing Our Previous Code

__After retrieving the first name input from the user..__ &rarr;

__Surround with % for LIKE search__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
artist_name = f'%{artist_name}%'
</code></pre>
{:.fragment}

Modify the query so that `%s` is used as a placeholder for incoming value(s)
{:.fragment}

<pre><code data-trim contenteditable>
q = f"select * from artist where name like %s"
</code></pre>
{:.fragment}

Run the query by passing two arguments to `execute`!
{:.fragment}

<pre><code data-trim contenteditable>
cur.execute(q, (artist_name,))
</code></pre>
{:.fragment}

</section>


{% comment %}
<section markdown="block">
## psycopg2 Quick Start

Check out the [psycopg2 module usage section from the official docs](http://initd.org/psycopg/docs/usage.html) for more info. __It details:__ &rarr;

* exact Python to SQL conversions
* transactions
	* with
	* commit
	* rollback
* server side cursors (to avoid client having to deal with large amounts of data)
* handling multiple threads and one connection
* etc.
{:.fragment}

</section>
{% endcomment %}
