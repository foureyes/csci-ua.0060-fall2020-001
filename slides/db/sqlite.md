---
layout: slides
title: "SQLite"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}


### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## SQLite

Now that we know about different _kinds_ of databases (or really, database management systems), __let's see where <span class="hl">SQLite</span> fits in__ &rarr;

__SQLite is a <span class="hl">relational</span> database.__ However, there are a few features that make it very different from other relational databases:
{:.fragment}

* {:.fragment} it's serverless 
* {:.fragment} no configuration is required
* {:.fragment} single file or in memory database
* {:.fragment} allows multiple databases on one connection


</section>

<section markdown="block">
## Serverless

__Because SQLite is <span class="hl">serverless</span>, the DBMS itself is embedded into the program / application that it's used in__

* {:.fragment} there's no need to deal with complexities of client / server
* {:.fragment} consequently, fewer resources are consumed
* {:.fragment} although serverless, terminology from the client / server model is borrowed
	* {:.fragment} the _term_ __client__ is still used, but it's to refer to the sqlite library or module
	* {:.fragment} the _term_ connection is still used to describe opening and working with a database

</section>

<section markdown="block">
## Single File

__The entirety of a SQLite database fits into a single file__ &rarr;

* {:.fragment} the [single file is in a specific format](https://www.sqlite.org/fileformat.html), and the filename typically has an extension `.db`
* {:.fragment} sharing or backing up a database is as simple copying one file!
* {:.fragment} this file can be hundreds of terabytes large 😮
	* {:.fragment} the size of your system's storage is typically the limiting factor
	* {:.fragment} the size of the result of a query is limited by your system's RAM

</section>
<section markdown="block">
## No Configuration

__Because SQLite is _serverless_ AND it stores a database in a single file__... &rarr;

* {:.fragment} SQLite requires almost <span class="hl">no configuration</span>
* {:.fragment} it simply needs the path to the database file
* {:.fragment} for example, the cli tool for sqlite can be run immediately after download
	* without having to set up users
	* without configuring access controls
	* without starting / restarting a service

</section>

<section markdown="block">
## Connecting to Multiple Databases

A typical feature for a DBMS is to be able to manage multiple databases, as well as multiple connections. However, a single connection is limited to single database. 

__SQLite is different__ &rarr;

* {:.fragment} it allows for a __single connection__ to open __multiple databases__ at once.
* {:.fragment} this allows queries to utilize tables in more than just one database; an uncommon feature in other relational databases

</section>

<section markdown="block">
## Y THO?

__We'll be using sqlite as our first DBMS because__ &rarr;

* {:.fragment} it's <span class="hl">easy</span> to start using right away!
	* {:.fragment} no configuration
	* {:.fragment} cross platform
	* {:.fragment} file based
* {:.fragment} light on resources
* {:.fragment} a great straightforward solution for many _kinds_ of applications from simple web applications to embedded persistent storage for a desktop application
* {:.fragment} usually offers significant advantages over directly working with text files

</section>
<section markdown="block">
## You've Been Secretly Using It!

__Where you may have [encountered SQLite](https://sqlite.org/famous.html)__

* {:.fragment} Adobe uses it as a file format in Light Room
* {:.fragment} Apple uses it throughout its ecosystem, such as iPhoto
browsers, like Chrome
* {:.fragment} Google Chrome uses it to store cookies (on windows: `%localappdata%\Google\Chrome\User Data\Default\Cookies`)
* {:.fragment} [Library of Congress recommended storage format for data sets](https://www.loc.gov/preservation/resources/rfs/data.html#datasets)

</section>

<section markdown="block">
## Y NOT?

🙅 🙅 🙅 🙅 🙅

* {:.fragment} u need access control / users
* {:.fragment} u def want client server
	* {:.fragment} data files accessed via network
	* {:.fragment} clients access database via network

(_maybe ok for the web_ if web server and database files are on same _machine_)
{:.fragment}

</section>



<section markdown="block">
## Dynamically Typed 

⚠️ SQLite has a __dynamic type system__ (kind of like Python):

* {:.fragment} types do exist!
* {:.fragment} but __any value can go into any column__ 🤯
* {:.fragment} this is in stark contrast to other popular relational database management systems that require:
	* column types and the types of the values in _that column_ have to match
	* __not so with SQLite, though!__
</section>

<section markdown="block">
## Manifest Typing

This <span class="hl">dynamic type system</span> is implemented by <span class="hl">manifest typing</span>. __Um... what does that mean?__ &rarr;

* {:.fragment} a value in a column is _not just_ the value; the data type is stored along with the value!
* {:.fragment} consequently, a value of any type can be stored in any column, yet still retain its own independent type

</section>
<section markdown="block">
## Storage Classes

__In SQLite, data types a referred to as <span class="hl">Storage Classes</span>__ &rarr;

These storage classes represent how data is stored on disk:


1. {:.fragment} __NULL__ - `NULL` no value
2. {:.fragment} __INTEGER__ - positive or negative whole numbers stored in a variable length of bytes
3. {:.fragment} __REAL__ - floating point number stored in 8 bytes
4. {:.fragment} __TEXT__ - a string stored using the database encoding (UTF-8 by default)
5. {:.fragment} __BLOB__ - variable length of raw bytes

</section>

<section markdown="block">
## Am I Missing Something? 🔎

__Seems like there are some important types missing... what do you think!?__ &rarr;

There are no storage classes for the following:
{:.fragment}

* {:.fragment} boolean... <span class="fragment">what should we use, though?</span>
	* {:.fragment} boolean values are stored as integers `0` and `1` (false and true respectively)
* {:.fragment} dates and times...
	* {:.fragment} stored as text ('2020-01-01'), integers (seconds since Jan 1st, 1970), and even real ([???](https://simple.wikipedia.org/wiki/Julian_day#:~:text=The%20Julian%20day%20or%20Julian,multiples%20of%207%20are%20Mondays.))
	* {:.fragment} with [date and time](https://sqlite.org/lang_datefunc.html) functions to pick up the slack of any translating to and from these types to a date or time

</section>


<section markdown="block">
## Type Affinity

__It seems kind of useless specifying a type of a column if any value -- regardless of type -- can go in any column__

This is particularly tricky if you want SQL written for SQLite to work with other databases.
{:.fragment}

Consequently, SQLite allows the declaration of a <span class="hl">type affinity</span> for columns:

* {:.fragment} this is the recommended type for data in a column (it's not required, though)
* the affinities are similar to the types, but without `NULL`: TEXT, NUMERIC, INTEGER, REAL
</section>

<section markdown="block">
##  Type Affinity Continued

__Type affinities and their behavior:__ &rarr;

* {:.fragment} __Text__ - stores `NULL`, `TEXT` or `BLOB`, but if given numeric data, it is coerced to `text` when stored
* {:.fragment} __Integer or Real__ - store all types _as is_ with the exception of text, which will be converted to an integer or real, if possible... otherwise left as text 
* {:.fragment} __Integer__ - A column with an integer affinity works essentially the same as a numeric affinity (
* {:.fragment} __Blob__ - does not prefer one storage class over another; no attempt is made to convert to a preferred type

Finally, a [stackoverflow question](https://dba.stackexchange.com/questions/203220/sqlite-what-is-the-use-of-specifying-data-types) about SQLite column types, and a [tutorial](https://www.sqlitetutorial.net/sqlite-data-types/)
{:.fragment}
</section>
