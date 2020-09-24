---
layout: slides
title: "Aggregation / Group By"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

	

<section markdown="block">
## `GROUP BY` and Aggregate Functions

__Adding a `GROUP BY` clause allows the grouping of rows and the application of aggregate functions on each groups__ &rarr;

* {:.fragment} the `GROUP BY` clause goes after `FROM` and `WHERE`, and must be followed by the column name(s) to form groups with
* {:.fragment} it's used to group the rows __after__ rows are filtered out by `WHERE`
* {:.fragment} an aggregate function can be applied to each group
* {:.fragment} not the same as `DISTINCT` (which only gives back unique values, no aggregation)


See the [documentation for `GROUP BY`](https://www.postgresql.org/docs/10/static/sql-select.html#SQL-GROUPBY)
{:.fragment}
</section>

<section markdown="block">
## Aggregate Functions

__When grouping rows with `GROUP BY`, an aggregate function can be be applied to each group (in other parts of the query such as the `SELECT` list or `ORDER BY` clause)__ &rarr;

* {:.fragment} `AVG(col_name)`
* {:.fragment} `SUM(col_name)`
* {:.fragment} `MAX(col_name)`
* {:.fragment} `MIN(col_name)`
* {:.fragment} `COUNT(col_name or *)`

`col_nam` can be an expression
{:.fragment}

`AVG`, `SUM`, and `COUNT` work on non `NULL` values. `MAX` and `Min` will only return `NULL` if there are no non-NULL values.
{:.fragment}

</section>

<section markdown="block">
## Aggregate Functions Continued

__SQLite has a couple of additional aggregate functions ([see the docs for a complete list](https://www.sqlite.org/lang_aggfunc.html)):__ &rarr;

* {:.fragment} `GROUP_CONCAT(col_name)` - concatenates all values in `col_name` with comma
* {:.fragment} `TOTAL(col_name)` - results in real (rather than integer from `SUM`)

</section>

<section markdown="block">
## When Does Group By Happen?

__Reviewing the processing order of a `SELECT`, let's see where `GROUP BY` fits in__ &rarr;

1. {:.fragment} `FROM` to determine set of all possible rows to return!
2. {:.fragment} `WHERE` to filter out rows that don't match criteria
3. {:.fragment} <span class="hl">GROUP BY</span> combines rows into groups, and results of aggregate functions are computed (`HAVING` can be used to filter out groups)
4. {:.fragment} `SELECT list` to determine the  actual values of the resulting rows by evaluating expressions, resolving column names, etc.
5. {:.fragment} `DISTINCT` to eliminate duplicate rows in the output
6. {:.fragment} `ORDER BY` to sort the output rows
7. {:.fragment} `LIMIT` to restrict the output rows to a specific number

</section>

<section markdown="block">
## Example Table

__The following slides assume the following table is present with some data__ &rarr;

<pre><code data-trim contenteditable>
CREATE TABLE student(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	netid TEXT NOT NULL,
	first TEXT NOT NULL,
	last TEXT NOT NULL,
	level TEXT,
	midterm INTEGER,
	on_campus INTEGER
);
</code></pre>
</section>

<section markdown="block">
## Initial Data

```
INSERT INTO student VALUES 
(NULL, 'abc123', 'alice', 'chang', 'freshman', 90, 1),
(NULL, 'def456', 'daniel', 'flynn', 'sophomore', 75, 0),
(NULL, 'hij789', 'henry', 'jiminez', 'senior', 83, 0),
(NULL, 'klm0', 'kate', 'monsour', 'freshman', 87, 1),
(NULL, 'nop987', 'narula', 'patel', 'sophomore', 95, 0),
(NULL, 'qrs654', 'quincy', 'sanders', 'freshman', 79, 1),
(NULL, 'tuv321', 'tara', 'venkman', 'freshman', 97, 0);
```

</section>

<section markdown="block">
## `GROUP BY` Examples

__Group by level, show level and counts for each group__ &rarr;

<pre class="fragment"><code data-trim contenteditable>
SELECT LEVEL, COUNT(*) FROM student GROUP BY level;
</code></pre>

Note that it doesn't matter what column name is passed to count (and `*` works too), since we're simply counting
{:.fragment}

__Again, group by level, but this time show the midterm average for students in the same level__ &rarr;
{:.fragment}

<pre class="fragment"><code data-trim contenteditable>
SELECT level, AVG(midterm) FROM student GROUP BY level;
</code></pre>

In this case, the `midterm` column is the argument used for `AVG`
{:.fragment}
</section>

{% comment %} ` {% endcomment %}

<section markdown="block">
## Using Aggregations

__Depending on when a particular clause is processed, a group may be available to use!__ &rarr; 

For example, since `ORDER BY` is processed last, both the `GROUP BY` and `SELECT` list have already been processed, so the aliased column `c` is available in `ORDER BY`...
{:.fragment}

<pre><code data-trim contenteditable>
-- group by level
-- show the highest midterm per level
SELECT level, MAX(midterm) AS max_score 
    FROM student 
    GROUP BY level 
    ORDER BY max_score desc;
</code></pre>
{:.fragment}
</section>


<section markdown="block">
## Multiple Group By Columns

__It's possible to specify multiple columns to group by.__

* groups are formed where values for __both__ columns are equal
* for example, the following query counts the number of students that have the same combination of `level` and `on_campus`
	<pre class="fragment"><code data-trim contenteditable>
SELECT level, on_campus, COUNT(*) FROM student GROUP BY level, on_campus;
</code></pre>
* output may look something like (two people named alice scored a 90 on their midterm):
	<pre><code data-trim contenteditable>
freshman    0           1
freshman    1           3
senior      0           1
sophomore   0           2
</code></pre>

</section>

{% comment %} comment* {% endcomment %}

<section markdown="block">
## Just Aggregates Plz!?

__No `GROUP BY`, no problem! (sort of)__ &rarr;

* {:.fragment} if an aggregate function is used, but no `GROUP BY` is present...
* {:.fragment} all selected rows form a single group... 
* {:.fragment} the aggregate function is applied to that single group

Knowing this, it's possible to to run query that applies an aggregate function on a group that includes all rows:
{:.fragment}

<pre><code data-trim contenteditable>
SELECT MAX(midterm) FROM student;
</code></pre>
{:.fragment}


</section>

<section markdown="block">

## Filtering Groups

__Add a `HAVING` clause after `GROUP BY` to eliminate groups that do not satisfy a condition__ &rarr;


* {:.fragment} `HAVING` filters groups created by the `GROUP BY`
* {:.fragment} on the other hand, `WHERE` filters rows before `GROUP BY`

Only include level groups that have an average score greater than 85:
{:.fragment}

<pre><code data-trim contenteditable>
select level, avg(midterm) from student group by level having avg(midterm) > 85;
</code></pre>
{:.fragment}

The above repeats the avg function in having (rather than use an alias) as the select list is typically processed after group by and having in standard sql. Using an alias is possible in having for SQLite, though.
{:.fragment}

</section>

<section markdown="block">
## GROUP BY Errors

__Although it's possible in SQLite, when using GROUP BY__ &rarr;

* {:.fragment} ⚠️ __avoid referencing columns that don't appear in `GROUP BY` within the select list (unless it appears within an aggregate function__
* {:.fragment} for example, __AVOID THIS__ 🚫
	```
select first, level, avg(midterm) 
	from student 
	group by level;
```
* {:.fragment} __why?__ 🤔
* {:.fragment} otherwise, there could be more than one possible value to return for an ungrouped column... 
* {:.fragment} (which first name do we use????)
</section>

<section markdown="block">
## GROUP BY and SELECT List

__How does that influence how we write queries?__ &rarr;

* {:.fragment} when using `GROUP BY`
* {:.fragment} the `SELECT` list should only have
	* {:.fragment} aggregate functions
	* {:.fragment} or columns that appear in the `GROUP BY` clause

SQLite does not restrict this, while other DBMS's will give an error.
{:.fragment}

* {:.fragment} instead, SQLite chooses a row from the group to populate the value(s) with
* {:.fragment} for example, if using `MAX`, SQLite will take the values from the MAX row for that group


</section>

{% comment %}
<section markdown="block">
## GROUP BY Errors

__(from the docs) when using GROUP BY__ &rarr;

* {:.fragment} it's invalid for the `SELECT` list to reference ungrouped columns (columns that don't appear in `GROUP BY`)
* {:.fragment} ... unless the ungrouped column name appears as an argument to an aggregate function
* {:.fragment} otherwise, there could be more than one possible value to return for an ungrouped column... 
	* {:.fragment} what value would be the same for every member of the group!?
	* {:.fragment} there is an exception though!
	* {:.fragment} an ungrouped column can appear in the `SELECT` when the `GROUP BY` column is a primary key, since that means each group will only have 1 row in it! 😮 (but then, why even 🤔)

</section>
<section markdown="block">
## Foreshadowing

Sometimes we really do want ungrouped columns to appear in our query result. __One way to do this is__ &rarr;

* run the `GROUP BY` and aggregation in one query
* use that query as a subquery ...
* and join it with another query (perhaps itself!) to get the other columns
* of course, we'd have to learn joins and subqueries first... which we'll get to in a few classes


</section>

<section markdown="block">
## GROUP BY Error Example

<pre><code data-trim contenteditable>
-- group by country 
-- note that name doesn't appear in GROUP BY
-- and it's not in an aggregate
SELECT country, name, MAX(concentration) AS c 
    FROM product 
    GROUP BY country 
    ORDER BY c desc;
</code></pre>
</section>


<section markdown="block">
## Foreshadowing

Sometimes we really want ungrouped columns to appear in our query result. __One way to do this is__ &rarr;

* run the `GROUP BY` and aggregation in one query
* use that query as a subquery ...
* and join it with another query (perhaps itself!) to get the other columns
* of course, we'd have to learn joins and subqueries first... which we'll get to in a few classes


</section>

{% endcomment %}

