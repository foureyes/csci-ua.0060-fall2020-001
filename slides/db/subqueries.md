---
layout: slides
title: "Subqueries"
---

<script src="../../resources/js/table.js"></script>
<link rel="stylesheet" href="../../resources/css/data-table.css" type="text/css" media="screen" title="no title" charset="utf-8">



<section markdown="block">
## Data for Examples

## 👇👇👇👇

In this set of slides, __we'll continue using the [CAERS](https://www.fda.gov/food/compliance-enforcement-food/cfsan-adverse-event-reporting-system-caers) that we brought in and cleaned from [the importing data slides](import-example.html)__

</section>

<section markdown="block">
## A Challenge

Let's __find the event date, reported date, _lag_ (days between actual occurrence and reporting), product, and terms of the event that had the longest lag__ &rarr;

First, let's find the longest lag:

<pre><code data-trim contenteditable>
select max(datediff(created_date, event_date)) 
from caers_event;
</code></pre>
{:.fragment}

Now lets try to add the other fields...
{:.fragment}

<pre><code data-trim contenteditable>
select created_date, event_date, max(datediff(created_date, event_date)) as lag, product, terms
from caers_event;
</code></pre>
{:.fragment}

🤔🐟... hm, there's something fishy about that.
{:.fragment}
</section>

<section markdown="block">
## A Problem With Aggregate Functions

__What are some issues with the previous query?__ &rarr;

* {:.fragment} when we use an aggregate function without an explicit group by, all the rows are treated as one big group... and _it's tricky_ using ungrouped columns in the select list
* {:.fragment} (which row do we get those details from?)
* {:.fragment} another way to think of it: what if there are multiple rows that share the same max lag... which row will the dates, product name and terms come from? should we show all rows that match? __we can in two steps__ &rarr;


<pre><code data-trim contenteditable>
select created_date, event_date, product, terms
from caers_event
where datediff(created_date, event_date) = 23446;
</code></pre>
{:.fragment}

Would order by work? 
{:.fragment}

Sort of, maybe? Only if we don't care about getting more results than we want.
{:.fragment}

But maybe we can use...
{:.fragment}
</section>

<section markdown="block">
## Queryception

Yes. __U can have queries within queries__ 🤯: &rarr;

* {:.fragment} the inner queries are called __subqueries__
* {:.fragment} subqueries are nested within another query, the main or outer query
* {:.fragment} subqueries are surrounded by parentheses `()` (and in some cases require an alias)
* {:.fragment} there can be more than one level of nesting (in practice, you'll likely only have one or two levels of subqueries)
* {:.fragment} __subqueries are executed first__; their results are passed along for use by the outer query
* {:.fragment} a subquery can result in:
	1. {:.fragment} a single value
	2. {:.fragment} a row or rows (can essentially be treated as another table!)

</section>


<section markdown="block">
## A Subquery as a Single Value

__We another alternative for finding the details of all rows with the max lag: __a subquery__! Our subquery will return a single value for use in our `WHERE` clause...__ &rarr;

<pre><code data-trim contenteditable>
select created_date, event_date, datediff(created_date, event_date) as lag, product, terms
from caers_event
where datediff(created_date, event_date) =
      (select max(datediff(created_date, event_date)) from caers_event);
</code></pre>
</section>

<section markdown="block">
## Another Quick Example

We can use single value subqueries in the `SELECT` list as well. 

__Let's try to compare the counts of non-null `created_date` to non-null `event_date` in a query with subqueries__ &rarr;

<pre><code data-trim contenteditable>
select
       (select count(*) from caers_event where created_date is not null) as created_count,
       (select count(*) from caers_event where event_date is not null) as event_count;
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Subqueries as Tables

We'll use the following question to motivate our use of a subquery as a table:

__What are all of the products' names and the year of the event involving them... in the year with the most events reported?__ &rarr;

</section>

<section markdown="block">
## Start with an Aggregate Report


First, lets see the counts by year (of `event_date`)... &rarr;

<pre><code data-trim contenteditable>
-- note, nonstandard sql allowed by mysql/mariadb
-- alias in having!
select year(event_date) as year, count(*) as c
from caers_event
group by year(event_date) 
having year is not null
order by c desc;
</code></pre>
{:.fragment}

</section>

{% comment %}
(\*)
{% endcomment %}


<section markdown="block">
## Subqueries as a Table!

We can _see_ 👀 the max year here... but if we want to use that as a variable value in an expression, one option we have is using a subquery.  (nested aggregate functions are not allowed)

<pre><code data-trim contenteditable>
select max(c) from
(select year(event_date) as year, count(*) as c
from caers_event
group by year(event_date)
having year is not null
order by c desc) as year_counts;
</code></pre> 
{:.fragment}

Note that when using a subquery as a table, you must alias is with `AS`.
{:.fragment}
</section>

{% comment %}
(\*)
{% endcomment %}

<!--
<section markdown="block">
## Common Table Expression

Alternatively, you can use a __common table expression__ (CTE) to make a temporary table. Use `WITH table_name(column_list) AS query` query to create a CTE:

* the `table_name` and `column_list` specify the table and columns you can use to query the CTE
* the `query` part populates the temporary table and columns
* it's essentially a subquery as a table
	* typically used for _maybe_ nicer syntax
	* (though, apparently, CTEs have some features that subqueries don't, such as being able to refer to itself recursively)
* the CTE only exists for the execution of your _actual_ query, which appears after the CTE itself

</section>

<section markdown="block">
## Rewriting the Subquery as a CTE


`year_counts` is a table with two columns, `y` and `c` &rarr;

<pre><code data-trim contenteditable>
WITH 
    year_counts(y, c)
AS (
    select date_part('year', event_date) as year, count(*) as c
    from caers_event
    group by date_part('year', event_date)
    having date_part('year', event_date) is not null
    order by c desc
)
select max(c) from year_counts;
</code></pre>
{:.fragment}

</section>

{% comment %}
(\*)
{% endcomment %}

<section markdown="block">
## With Limit

__Of course, this is all contrived; a limit and a select list would have worked too (and we can use that in a subquery to get our desired result)__ &rarr;
<pre><code data-trim contenteditable>
select product,  date_part('year', event_date) as year
from caers_event
where date_part('year', event_date) =
(select date_part('year', event_date) as year
 from caers_event
 group by date_part('year', event_date)
 having date_part('year', event_date) is not null
 order by count(*) desc
limit 1);

</code></pre>
</section>
{% comment %}
(\*)
{% endcomment %}
-->
<section markdown="block">
## Subquery in Insert

__It's also possible to use a subquery in an insert statement... using the results of the query to fill another table__ &rarr;

<pre><code data-trim contenteditable>
insert into table_name (col_name_1, col_name_2)
(select a, b from other_table);
</code></pre>
</section>

