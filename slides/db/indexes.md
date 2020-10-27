---
layout: slides
title: "Explain / Analyze, Indexes"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## Y SO SLOW?

__So far, we've been dealing with relatively small data sets (10K rows max, right?), and just a handful of tables at most__ &rarr;

* {:.fragment} as our data increases...
* {:.fragment} as we add more tables...
* {:.fragment} ... and as our queries get more and more complex

Our queries will take longer to complete 😮! Oh, _what to do about performance issues_?...
{:.fragment}

</section>


<section markdown="block">
## Executing a Query

__A given SQL query can _actually_ be executed in different ways, but still result in the same set of rows__ &rarr;

* {:.fragment} for example, inner joins are commutative
* {:.fragment} ...or using different ways to find data (sequentially scanning or using an index)

MaraiDB/MySQL's query planner will _try_ to look at each possible execution plan and use the fastest one! 👟
{:.fragment}

(there are some queries, such as ones with several joins,  where it's not possible to examine every plan)
{:.fragment}

</section>
<section markdown="block">
## Plz Explain


__If you'd like to get a peek into what the query planner is going to do, you can use `EXPLAIN`__ &rarr;

* {:.fragment} simply prefix your query with `EXPLAIN`
* {:.fragment} `EXPLAIN SELECT * FROM foo;`

(Note that `EXPLAIN` is not part of standard SQL, so not all platforms may support it, or they may use a different syntax for examining a query plan)
{:.fragment}

</section>

<section markdown="block">
## EXPLAIN Explained

__Using `EXPLAIN` on a query breaks down how MySQL/MariaDB will process the query (without actually executing it)__ &rarr;

The output is a table containing information such as:
{:.fragment}

* `rows` - an estimate of how many rows will be retrieved in order to execute query
* `key` - the name of the key used (or `NULL` if no key) for retrieving rows

[Check out the docs](https://mariadb.com/kb/en/explain/) for full details... 
{:.fragment}

</section>


<section markdown="block">
## EXPLAIN Example

__Example query plan:__

Using [270,000 generated rows of data](../sql/subscriber.sql.gz) containing email address and a couple of dates....

<pre><code data-trim contenteditable>
explain select * 
from subscriber 
where email = 'jarod.herman@example.org';
</code></pre>

<pre><code data-trim contenteditable>
-- some columns removed
+------------+------+---------------+------+------+--------+-------------+
| table      | type | possible_keys | key  | ref  | rows   | Extra       |
+------------+------+---------------+------+------+--------+-------------+
| subscriber | ALL  | NULL          | NULL | NULL | 270646 | Using where |
+------------+------+---------------+------+------+--------+-------------+
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## WAT? / Timings

__What does this tell us?__ &rarr;

This tells us that we needed to look through _a lot_ of rows to produce just one result! There are also no _keys_ involved (no primary key, no index... which we'll see later)
{:.fragment}

If you run the query, you should get a timing at the end of the displayed result:
{:.fragment}

```
1 row in set (0.16 sec)
```
{:.fragment}

NOTE - in newer versions of MySQL/MariaDB, `ANALYZE FORMAT=JSON SELECT ...` will give details on the execution of the query.
{:.fragment}

</section>


<section markdown="block">
## MAKE IT FASTER

__A simple way to get some performance gains is to add indexes to columns__ &rarr;

* {:.fragment} `CREATE INDEX indexname ON tablename (columnname);`
* {:.fragment} __Let's try it!__ &rarr;
	* {:.fragment} `create index email_idx on subscriber (email);`

__Was it faster?__ &rarr;
{:.fragment}

* {:.fragment} ✅OH YES, it was....
* {:.fragment} but how? _magic_? 🧙✨
	* {:.fragment} (no, B-Trees 🌲🌳)

</section>

<section markdown="block">
## What's an Index

__So really, what's an index then, and how does it make things faster?__ &rarr;

* {:.fragment} it's a structure in your database that contains indexed table data
* {:.fragment} which means that _it takes up space_, so that you can locate data faster
* {:.fragment} it also has to be created (and updated) based on the data in the table and the changes that occur

</section>

<section markdown="block">
## Index Analogy

__Think of a database index as if it were an index in a book 📖__ &rarr;

* {:.fragment} it helps you locate something in the book
* {:.fragment} it takes up space at the end of the book
* {:.fragment} if the contents of the book were changed, you'd have to change the index too

</section>

<section markdown="block">
## How?

The data in a table is not stored sequentially in physical storage...

* {:.fragment} so, one way to deal with this is to use __doubly linked lists__ for logical ordering
* {:.fragment} and a [B-Tree](https://en.wikipedia.org/wiki/B-tree) (binary search tree that can have more than two nodes) to quickly find one these nodes (which are leaf nodes in the tree)

[see Use the Index, Luke](https://use-the-index-luke.com/sql/anatomy/the-tree)
{:.fragment}

</section>



<section markdown="block">
## No Index?

__What are some drawbacks to using indexes?__ &rarr;

* {:.fragment} take up more space
* {:.fragment} operations that change data may take longer (insert, update, delete)
* {:.fragment} query planner might not actually use it (????)
	* {:.fragment} if your queries return large result sets, then sequential scan is actually more efficient

</section>
