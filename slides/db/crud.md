---
layout: slides
title: "SQL Basics"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## SQL

__To query (read, update, etc.) and maintain a relational database, a domain specific language called <span class="hl">SQL</span> is used.__ &rarr;

* {:.fragment} it's a <span class="hl">declarative programming language </span>
	* your program describes _what_ you want
	* rather than _how_ you want to achieve it
	* (describe the outcome rather than the algorithm)
* {:.fragment} __SQL has been standardized__ by The American National Standard Institute (ANSI) and the International Standard Organization (ISO)
* {:.fragment} despite the standardization, there are still __many dialects of SQL specific to the database platform being used__ (and are consequently _non portable_)
* {:.fragment} SQL's theoretical foundation is [relational algebra](https://en.wikipedia.org/wiki/Relational_algebra) (which we'll discuss later in this course)

</section>

<section markdown="block">
## Declarative Programming

__Remember, <span class="hl">SQL is declarative</span>, so it describes what you want the outcome of your program to be, not how to get to the outcome__ &rarr;
```
# we're describing _how_ in this Python code
millenials = []
for user in users:
	if user.birthday > '1990-01-01':
		millenials.append(user)
```
{:.fragment}

```
--we're explaining _what_ in this SQL query
SELECT first, last 
	FROM user 
	WHERE birthday > '1990-01-01';
```
{:.fragment}

</section>


<section markdown="block">
## Command Language


SQL commands implement actions such as creating, reading, updating and deleting

* {:.fragment} executed one-at-a-time
* {:.fragment} be careful - _destructive_ commands, such as `UPDATE`, do not issue a warning, so:
	* double check before hitting enter 
	* use transactions to allow rollback

</section>

<section markdown="block">
## Types of Commands

__SQL commands (statements) can be broken up into sub-categories__:

* {:.fragment} __DDL__: data definition language (`CREATE`)
* {:.fragment} __DQL__: data query language (`SELECT`)
* {:.fragment} __DML__: data manipulation language (`UPDATE`, `DELETE`)
* {:.fragment} __DCL__: data control language (access control)
* {:.fragment} __TCL__: transaction control language (`BEGIN`, `COMMIT`)
</section>

<section markdown="block">
## About SQL Syntax

__Whitespace (newlines, tabs) is ok within a statement, so formatting code with line breaks and indentation for readibility is encouraged!__

* {:.fragment} end statements with `;`
* {:.fragment} single line comments start with `--`
* {:.fragment} mult-line comments are wrapped with `/* comment goes here */`
* {:.fragment} SQL keywords can be written in upper or lower case
	* but it's common practice to see uppercase keywords 
	* at the very least, remain consistent

</section>

<section markdown="block">
## Strings, Numbers, NULL 

__Syntax for literal values__ &rarr;

* ⚠️ __Delimit strings with single quotes `'` (single quotes)__ &rarr;
	* escape with extra `'` (`'` --> `''`)
* __Numbers are just numeric literals: `5`, `1.23`__
* __`NULL` means no value or missing value__
* [see details for exponents, hex, blob, etc. in the docs](https://sqlite.org/lang_expr.html#literal_values_constants_)


</section>

<section markdown="block">
## Expressions and Names

__Syntax for using table names, column names, functions and expressions:__ &rarr;

* {:.fragment} expressions can be used wherever a literal value is required: `5 + 5`
* {:.fragment} names, such as column names, can be used in these expressions: `my_column * 2`
* {:.fragment} column names can be prefixed with a table name and `.` to avoid ambiguity: `my_table.my_column * 2`
* {:.fragment} functions can be called using the name of the function, followed by parentheses with optional arguments enclosed: `some_func(my_column)`
* {:.fragment} and, of course, the result of a function call can be used in an expression: `some_func(my_column) * 2`

</section>


<section markdown="block">
## DDL

__<span class="hl">DDL</span> or Data Definition Language__ consists of commands for creating a database schema, such as:

* {:.fragment} `CREATE`
* {:.fragment} `ALTER`
* {:.fragment} `DROP` 

These can be used on:
{:.fragment}

* {:.fragment} tables
* {:.fragment} views
* {:.fragment} indexes

Typically, commands for creating the database's structure are stored in separate external text file ending in `.sql`.
{:.fragment}
</section>

<section markdown="block">
## Creating a Table Background Info

See [CREATE TABLE](https://sqlite.org/lang_createtable.html) doc

* `CREATE TABLE`
* followed by table name
* in parens...
	* comma separated list of column names and their type separated by space:
	* `first_name` text
* can specify some constraints after type, such as:
	* `NOT NULL`
	* `UNIQUE`
	* `PRIMARY KEY` (unique and _indexed_
* default value specified with:
	* `DEFAULT value_to_default_to`
</section>

<section markdown="block">
## Primary Key

If `PRIMARY KEY` is added to a column, then the primary key _is that single column_. The <span class="hl">primary key</span> of a table is the __column containing the value that uniquely identify a row__.

* {:.fragment} only a single `PRIMARY KEY` may be defined (though the primary key can be composed of multiple columns!)
* {:.fragment} if the primary key is an integer for SQLite, then entering null will result in an increasing numeric id
* {:.fragment} alternatively `AUTOINCREMENT` can be added: `INTEGER PRIMARY KEY AUTOINCREMENT` to have an increasing number as the unique identifier (with deleted keys left unused)

__We'll discuss primary keys and choosing primary keys in more detail as the course progresses...__
{:.fragment}

</section>

<section markdown="block">
## PRIMARY KEY BUG

⚠️ __In SQLite, primary keys do not imply not null, which is different from the SQL standard!__

From [the docs](https://sqlite.org/lang_createtable.html#the_primary_key), in some cases NULL is allowed in a PRIMARY KEY column:
{:.fragment}

> Unfortunately, due to a bug in some early versions, this is not the case in SQLite. Unless the column is an INTEGER PRIMARY KEY or the table is a WITHOUT ROWID table or the column is declared NOT NULL, <span class="hl">SQLite allows NULL values in a PRIMARY KEY column</span>. 
{:.fragment}

The docs continue to say that this will not be changed: 
{:.fragment}

> SQLite could be fixed to conform to the standard, but doing so might break legacy applications. Hence, it has been decided to merely document the fact that SQLite allowing NULLs in most PRIMARY KEY columns.
{:.fragment}
</section>


<section markdown="block">
## Creating a Table Example

__Create a student table with 5 fields: netid first, last, midterm and on_campus__ &rarr;

<pre><code data-trim contenteditable>
CREATE TABLE student(
	-- unique id (um... is this a good choice?)
	netid TEXT PRIMARY KEY NOT NULL, 

	first TEXT NOT NULL,

	last TEXT NOT NULL,

	-- midterm score
	midterm INTEGER,
	
	-- no boolean, use 0 or 1
	on_campus INTEGER DEFAULT 0
);
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Aside on Booleans


Again, despite the fact that SQLite does not support a storage class for boolean, __you can still define a column with a type affinity of boolean__ as well as __use `TRUE` and `FALSE` as aliases for 0 and 1__ &rarr;

This means that, for clarity the `on_campus` field can be defined as:
{:.fragment}


```
on_campus BOOLEAN DEFAULT FALSE
```
{:.fragment}

Which means that `on_campus` will default to 0
{:.fragment}


</section>

<section markdown="block">
## Not Only Booleans

Although __SQLite has a small set of type affinities__, it accepts __many data type specifications__ in a `CREATE` statement.

Check out the table of [various types and their mappings to type affinities](https://sqlite.org/datatype3.html#affinity_name_examples)

</section>

<section markdown="block">
## Create (INSERT)

__To add a new row to a table, use an <span class="hl">INSERT</span> statement__ &rarr;

<pre><code data-trim contenteditable>
-- values in order of field names 
INSERT INTO student 
	VALUES ('fb123', 'foo', 'bar', 90, 1);
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
-- specify columns and matching values (does not have 
-- to follow same order of columns in CREATE TABLE)
INSERT INTO student 
	(first, last, midterm, netid) 
	VALUES ('baz', 'qux', 70, 'bq789');
</code></pre>
{:.fragment}

* {:.fragment} insert multiple rows: add commas to after each "tuple" of values
* {:.fragment} [See docs on INSERT](https://sqlite.org/lang_insert.html)

</section>

<section markdown="block">
## Reading with DQL: SELECT

__Use a <span class="hl">SELECT</span> statement to _read_ data__ &rarr;

1. {:.fragment} start with `SELECT`
2. {:.fragment}  followed by a comma separated list of columns or calculated values you'd like to see (the `SELECT list`)
	* {:.fragment} you can use `AS some_alias` to alias column names or name calculations
	* {:.fragment} `*` means all columns
	* {:.fragment} arithmetic operators and functions / expressions can be used here 
	* {:.fragment} `DISTINCT` for only unique values
3. {:.fragment} then, optionally, keyword `FROM tablename` ...to specify which table to query 
4. {:.fragment} optionally `WHERE cond` to specify how to filter rows
5. {:.fragment} optionally `ORDER BY ordering` for sorting
6. {:.fragment} optionally `LIMIT num` to restrict the number of rows returned

</section>

<section markdown="block">
## An Example SELECT Query

<pre><code data-trim contenteditable>
-- give me col1, col2, and new_col only
-- new_col is a calculated field
-- this is the 'SELECT list'
SELECT col1, col2, col3 * 2 as new_col    

	-- from table, some_Table
	FROM some_table

	-- the value in col1 must be > 1
	-- for the row to be returned
	WHERE col1 > 1

	-- sort by col2 ascending
	ORDER BY col2

	-- only give back, at most, 5 rows
	LIMIT 5;
</code></pre>

</section>
<section markdown="block">
## SELECT Background

(From [the official docs](https://sqlite.org/lang_select.html)) __SELECT retrieves rows from <span class="hl">zero or more</span> tables.__ &rarr;

Using the parts of a `SELECT` statement from the previous slide, what order might the parts of a `SELECT` query be processed in? 
{:.fragment}

1. {:.fragment} `FROM` to determine set of all possible rows to return!
2. {:.fragment} `WHERE` to filter out rows that don't match criteria
3. {:.fragment} `SELECT list` to determine the  actual values of the resulting rows by evaluating expressions, resolving column names, etc.
4. {:.fragment} `DISTINCT` to eliminate duplicate rows in the output
5. {:.fragment} `ORDER BY` to sort the output rows
6. {:.fragment} `LIMIT` to restrict the output rows to a specific number
</section>

<section markdown="block">
## SQLite SELECT Processing

Note that the process in the previous slide is generic. See 
[the documentation](https://sqlite.org/lang_select.html) for details. 

👀 ⚠️ __One major difference between  SQLite's dialect of SQL  and standard SQL is that  SQLite allows  the use of aliases in the where clause__

* although the original documentation doesn't mention this explicitly, [various mailing list posts and stack overflow reference this, and anecdotal evidence shows that this is possible](https://stackoverflow.com/questions/10923107/using-a-column-alias-in-sqlite3-where-clause)
* even though this is possible (and at times, very convenient), __avoid doing this for more portable SQL__ 🙅 


</section>

<section markdown="block">
## Operators and Functions

__Operators__ &rarr;
{:.fragment}

* {:.fragment} arithmetic: `+`, `-`, `*`, `/`
* {:.fragment} string concatenation: `||` (`'HI' || 'THERE'`)
* {:.fragment} logical operators: `AND`, `OR`, `NOT`
* {:.fragment} check for NULL: `IS NULL` and `IS NOT NULL` (do not use `=`)
* {:.fragment} pattern matching `LIKE`

{% comment %}
__Functions__ &rarr;
{:.fragment}

* {:.fragment} `NOW()` (current date / time), `ROUND(val)`, etc.

{% endcomment %}
</section>

<section markdown="block">
## More `SELECT` Examples

__Using the student table created earlier__ &rarr; 

* {:.fragment} get all students
	<pre class="fragment"><code data-trim contenteditable>
SELECT * FROM student;
</code></pre>
* {:.fragment} get all students, just netid, first, and name last name ... and alias first as fn
	<pre class="fragment"><code data-trim contenteditable>
SELECT netid, first as fn FROM student;
</code></pre>
* {:.fragment} get all students, show net id and midterm grade divided by 100.0
	<pre class="fragment"><code data-trim contenteditable>
SELECT netid, midterm / 100.0 FROM student;
</code></pre>
* {:.fragment} get all students, show first name and last name concatenated with space between
	<pre class="fragment"><code data-trim contenteditable>
SELECT first || ' ' || last FROM student;
</code></pre>

</section>


<section markdown="block">
## Casting!

The previous slide used division by float to induce a floating point result.

__It may be preferrable to explicitlly cast depending on the situation__ &rarr;
{:.fragment}

```
SELECT CAST(colname as storage_class) ...
```
{:.fragment}

```
SELECT CAST(midterm as REAL) FROM student
```
{:.fragment}

Check out the [rules for casting](https://sqlite.org/lang_expr.html#castexpr)
{:.fragment}
</section>

<section markdown="block">
## `SELECT` + `DISTINCT`

__Only show the distinct rows (remove duplicate rows) by using `DISTINCT` with `SELECT`__ &rarr;

Show the distinct first names of students:

<pre><code data-trim contenteditable>
SELECT DISTINCT first 
	FROM student;
</code></pre>

</section>


<section markdown="block">
## `SELECT` with `WHERE` Clause

__Optionally, add a `WHERE` clause to specify _conditions_ (think filtering)__ &rarr;

* conditions can use operators like `=`, `<>` (not equal), `>`, `<`
* you can also use `LIKE` with `%` representing _wildcards_ to match on substrings
* add `COLLATE NOCASE` at end for case insensitive search
* use `col_name IS NULL` to check for a `NULL` value
* multiple conditions can be put together with `AND`, `OR`, `NOT`
* parentheses can be added to specify precedence
</section>

<section markdown="block">
## Ordering with Comparison Operators


__When comparing values of mixed storage classes, [sort order is as follows (as specified by the linked documentation)](https://www.sqlite.org/datatype3.html#sort_order)__:

From greatest to least
{:.fragment}

* {:.fragment} `BLOB`
* {:.fragment} `TEXT`
* {:.fragment} numeric (`INTEGER` or `REAL`) 
* {:.fragment} `NULL` 

This means that for ordering purposes, `NULL` is less than any other storage class;
{:.fragment}

</section>

<section markdown="block">
## `SELECT` + `WHERE`

__Filter your `SELECT` statement results with a `WHERE` clause__ &rarr;

* {:.fragment} only students with midterm > 80
	<pre class="fragment"><code data-trim contenteditable>
SELECT * FROM student WHERE midterm > 80;
</code></pre>
* {:.fragment} only students with between 70 and 90
	<pre class="fragment"><code data-trim contenteditable>
SELECT * FROM student 
	WHERE midterm > 70	
	AND midterm < 90;
</code></pre>
* {:.fragment} btw, also `BETWEEN 71 and 89`
	* (inclusive)

</section>

<section markdown="block">
## `SELECT` + `WHERE` Continued

* {:.fragment} students that have no midterm score
	<pre class="fragment"><code data-trim contenteditable>
SELECT * FROM student WHERE midterm IS NULL;
</code></pre>
* {:.fragment} get the netid and first name of students with that have a netid that has `jv` in it or starts with `Jo`, case insensitive
	<pre class="fragment"><code data-trim contenteditable>
SELECT netid, first FROM student 
	WHERE netid LIKE '%jv%' 
	OR first LIKE 'Jo%' COLLATE NOCASE;
</code></pre>

</section>

<section markdown="block">
## Ordering

__Add an `ORDER BY` clause at the end of your `SELECT` to specify ascending ordering__ &rarr;

<pre><code data-trim contenteditable>
SELECT * FROM student 
	WHERE midterm < 60
	ORDER BY midterm;
</code></pre>
{:.fragment}

__Add `DESC` to order in descending order__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
SELECT netid FROM student 
	ORDER BY midterm desc;
</code></pre>
{:.fragment}

__Separate multiple column names to order by multiple columns__ &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
SELECT * FROM student ORDER BY last, first;
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## `LIMIT`

__A <span class="hl">LIMIT</span> clause can be added at the end of a `SELECT` statement (after `ORDER BY`) to contrain the number of results of the query__ &rarr;

Only show 10 results:

<pre><code data-trim contenteditable>
SELECT netid, first, last
	FROM student
	ORDER BY netid
	LIMIT 10;
</code></pre>

</section>

<section markdown="block">
## Update (`UPDATE`)

__Use an `UPDATE` statement to set the value of a column for a row / rows__ &rarr;

* start with keyword, `UPDATE`
* then name of table to update
* followed by keyword `SET`
* finally column name = some value
* (see [docs on `UPDATE`](https://sqlite.org/lang_select.html)

<pre><code data-trim contenteditable>
-- set all students' on_campus field to 1
UPDATE student SET on_campus = 1;
</code></pre>
</section>

<section markdown="block">
## `UPDATE`, Expressions, and `WHERE`

__Add a `WHERE` clause to `UPDATE` (after `SET`) to specify which rows to change__ &rarr;

<pre><code data-trim contenteditable>
-- only set midterm score for rows that
-- have netid fb123
UPDATE student 
	SET midterm = 80 
	WHERE netid = 'fb123';
</code></pre>

__Remember the value in `SET` can be an expression__ &rarr;

<pre><code data-trim contenteditable>
UPDATE student SET midterm = midterm + 10;
</code></pre>

<pre><code data-trim contenteditable>
-- probz a bad idea to set pk to this, but...
-- set netid to concatenation of first and last
UPDATE student SET netid = first || last;
</code></pre>

</section>

<section markdown="block">
## Delete / Remove Rows (`DELETE`) 

__To remove rows from a table use the `DELETE` statement__ &rarr;

<pre><code data-trim contenteditable>
DELETE FROM student WHERE midterm > 90;
</code></pre>

Again, note the `WHERE` clause specifying which rows to take action on.

(See the [documentation on `DELETE`](https://sqlite.org/lang_delete.html))
</section>

<section markdown="block">
## Add / Remove Column 

__Use `ALTER TABLE` to add / remove columns__ &rarr;

* {:.fragment} add a new column
	<pre class="fragment"><code data-trim contenteditable>
ALTER TABLE student 
	ADD COLUMN final_exam_score;
</code></pre>
* {:.fragment} add a new column with a default value
	<pre class="fragment"><code data-trim contenteditable>
ALTER TABLE student 
	ADD COLUMN final_exam_score numeric DEFAULT 80;
</code></pre>
* {:.fragment} remove a column
	<pre class="fragment"><code data-trim contenteditable>
ALTER TABLE student DROP COLUMN final_exam_score;
</code></pre>
</section>

<section markdown="block">
## Modifying Columns

__`ALTER TABLE` can also be used to modify columns names__ &rarr;


<pre><code data-trim contenteditable>
-- rename column
ALTER TABLE student 
	RENAME COLUMN midterm TO midterm_score;
</code></pre>

Note - modifying type affinity is not supported

See [full documentation on `ALTER TABLE`](https://sqlite.org/lang_altertable.html)


</section>


<section markdown="block">
## `ROUND` 

__`ROUND` rounds a numeric value to a specified number of decimal places__

<pre><code data-trim contenteditable>
-- round to one decimal place
SELECT netid, ROUND(midterm/100.0, 1)
	FROM student;
</code></pre>

</section>

<section markdown="block">
## Removing Tables 

__Use the `DROP` command to remove databases or tables__ &rarr;

* `DROP TABLE table_name;`


{% comment %}
<section markdown="block">
## Running SQL Scripts

</section>
<section markdown="block">
## import


```
DROP TABLE IF EXISTS sd;
CREATE TABLE sd (
	sd_state text,
	sd_geoid text,
	sd_name text,
	sd_lowestGrade text,
	sd_highestGrade text,
	sd_pop_2010 integer,
	sd_hu_2010 integer,
	sd_aland real,
	sd_awater real,
	sd_aland_sqmi real,
	sd_awater_sqmi real,
	sd_intptlat real,
	sd_intptlong real,
	PRIMARY KEY(sd_geoid)
);
```
```
copy sd from '/tmp/Gaz_elsd_national.txt' delimiter E'\t' CSV header;
```
</section>



<section markdown="block">
## 

<pre><code data-trim contenteditable>

select count(*) as movie_count, director, round(avg(budget::numeric), 2)::money as avg_budget 
	from movie 
	group by director 
	having count(*) > 1 
	order by movie_count desc;

</code></pre>

</section>

{% endcomment %}







