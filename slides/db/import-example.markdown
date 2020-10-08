---
layout: slides
title: "Importing Data, Modifying Tables, Dates"
---

<script src="../../resources/js/table.js"></script>
<link rel="stylesheet" href="../../resources/css/data-table.css" type="text/css" media="screen" title="no title" charset="utf-8">
<section markdown="block" class="intro-slide">

# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## Data Source

We'll use the _adverse_ food events data: [CAERS](https://www.fda.gov/food/compliance-enforcement-food/cfsan-adverse-event-reporting-system-caers) ...for most of our examples

1. these slides use a version of the reports containing data between 2014-2019; the available reports may differ 
2. although no common license is used [the fda.gov website policies outlines usage of site content](https://www.fda.gov/about-fda/about-website/website-policies#web)
2. [documentation of fields](https://www.fda.gov/media/97035/download)
</section>

<section markdown="block">
## Sample Data

* {:.header} Report ID, CAERS Created Date, Date of Event, Product Type, Product, Product Code, Description, Patient Age, Age Units, Sex, MedDRA Preferred Terms, Outcomes
* 172940, 1/1/2014, , SUSPECT, DANNON DANNON LITE & FIT GREEK YOGURT CHERRY, 09,  Milk/Butter/Dried Milk Prod, , , , NAUSEA, Other Outcome
* 175277, 4/7/2014, 3/15/2013, SUSPECT, CHIA PLUS COCONUT CHIA GRANOLA, 05,  Cereal Prep/Breakfast Food, 15, year(s), F, BURNING SENSATION, Other Outcome
{:.table}

Based on the example above and the [field documentation](https://www.fda.gov/media/97035/download), how might we design are table?

</section>

<section markdown="block">
## Quick Table Layout

<pre><code data-trim contenteditable>
drop table if exists caers_event;
create table caers_event (
    report_id varchar(15),
    created_date_raw varchar(10),
    event_date_raw varchar(10),
    product_type text,
    product text,
    product_code varchar(10),
    description text,
    patient_age integer,
    age_units varchar(10),
    sex char(1),
    terms text,
    outcomes text
);
</code></pre>
</section>


<section markdown="block">
## Importing Data

__Use `load data local infile` to import data assuming download is in /tmp folder__ &rarr;


<pre><code data-trim contenteditable>
load data local infile '/tmp/CAERSASCII 2014-20190331.csv'
into table caers_event
fields terminated by ',' 
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
</code></pre>
{:.fragment}


</section>

<section markdown="block">
## Load Data Details

__A few things to point out regarding our `load data` command__ &rarr;

* {:.fragment} we use `local` in our command
	* it specifies that the file is on the file system that the client is on 
	* (without this, the file is read from the server's file system)
* {:.fragment} the single quotes around the file name can be omitted of there are no spaces
* {:.fragment} `,` and `"` specify the delimiter and escape character respectively
* {:.fragment} `\r\n` ([carriage return line feed or cr lf](https://en.wikipedia.org/wiki/Newline#Representation)) is the newline character in windows; some editors can display this

</section>

<section markdown="block">
## Examining Initial Data Load

__A quick check...__ &rarr;

<pre><code data-trim contenteditable>
select * from caers_event limit 10;
</code></pre>

__BTW, can we change report id to primary key? How can we determine this?__
{:.fragment}

<pre><code data-trim contenteditable>
select report_id, count(report_id) as c 
from caers_event 
group by report_id 
having count(report_id) > 1 
order by c desc;
</code></pre>
{:.fragment}



</section>

<section markdown="block">
## Some Minor Clean Up

__We may want to__ &rarr;

1. {:.fragment} add an artificial primary key
2. {:.fragment} add actual date fields
	* {:.fragment} y tho?
	* {:.fragment} we can use those fields as dates for sorting
	* {:.fragment} we can use [date and time functions](https://mariadb.com/kb/en/date-time-functions/) (for date arithmetic, like calculating a new date, determining the difference between dates, etc.)
</section>

<section markdown="block">
## Adding a key



In MySQL/MariaDB, __`ALTER TABLE` contains options ranging from adding contraints to modifying the type of a column__

__For our purposes, we'll an `ALTER TABLE ... ADD ...` statement to add a new column, our primary key__ &rarr;

<pre><code data-trim contenteditable>
alter table caers_event add caers_event_id int auto_increment primary key;
</code></pre>

</section>

<section markdown="block">
## Examining Results

__Let's write a few quick queries to show first few and last few ids with product names__ &rarr;

<pre><code data-trim contenteditable>
select caers_event_id, report_id, product from caers_event limit 10;
select caers_event_id, report_id, product from caers_event 
order by caers_event_id desc limit 10;
</code></pre>
{:.fragment}

If we want, we can compare these ids and counts to the results from other tools (such as loading into spreadsheet or using commandline tools)
{:.fragment}

For demonstration purposes, here are a couple of tools to count lines, and count lines that have specific characters in them:
{:.fragment}

```
wc -l CFS caers-2018-2020.csv 
grep CFS caers-2018-2020.csv | wc -l
grep -v CFS caers-2018-2020.csv
```
{:.fragment}

</section>
<section markdown="block">
## Fixing Dates

__Let's use `str_to_date` ([see the docs](https://mariadb.com/kb/en/str_to_date/)) to convert a string in a regular format to an actual `date` type!__ &rarr;

`str_to_date` has two arguments:

* the string to convert
* the format that the string is in (as a string!)

[Using the table in the docs](https://mariadb.com/kb/en/str_to_date/), you can specify the pattern that `str_to_date` will use to _parse_ out the date components.
{:.fragment}

To match a date in the format of 1/10/2020, use `'%c/%e/%Y'`
{:.fragment}

<pre><code data-trim contenteditable>
select str_to_date(event_date_raw, '%c/%e/%Y') 
from caers_event limit 10;
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Adding New Date Columns

__Let's add two new columns (assuming that we're interested in keeping the old ones, and we have the time and space to add new columns)__ &rarr;

<pre><code data-trim contenteditable>
alter table caers_event add event_date date;
alter table caers_event add created_date date;
</code></pre>
{:.fragment}

And convert the _raw_ string dates to fill in the new columns...
{:.fragment}

<pre><code data-trim contenteditable>
update caers_event 
set event_date = str_to_date(event_date_raw, '%c/%e/%Y')
where event_date_raw <> '';
update caers_event 
set created_date = str_to_date(created_date_raw, '%c/%e/%Y')  
where created_date_raw <> '';
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Checking Our New Dates

__Let's view the original columns and the new columns__ &rarr;

<pre><code data-trim contenteditable>
select 
	caers_event_id, 
	report_id, 
	event_date_raw, 
	created_date_raw, 
	event_date, 
	created_date 
from caers_event limit 10;
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## 📆🤷Now What?

__We can use dates for sorting / ordering (let's compare using `max` with the original and new date fields__

<pre><code data-trim contenteditable>
select max(event_date_raw) from caers_event;
select max(event_date) from caers_event;
</code></pre>
{:.fragment}

We can also use date time functions... &rarr; 
{:.fragment}


</section>

<section markdown="block">
## Using Date and Time Functions

__MySQL/MariaDB has several built-in date and time functions__

For example, `SELECT NOW();`, to get the current date and time as a timestamp

__How can compute the difference between the created date and event date (the lag between when the event ocurred and when it was finally reported__ &rarr;
{:.fragment}

* {:.fragment} let's [consult the documentation](https://mariadb.com/kb/en/date-time-functions/) what function(s) may help here?
* {:.fragment} let's try to construct a query!

<pre><code data-trim contenteditable>
select created_date, event_date, datediff(created_date, event_date) as log from caers_event limit 10;
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## We'll Be Using This Data for Future Slides

</section>
{% comment %}

## 2010 Census Data

Geography, by school district

School Districts Unified

https://www.census.gov/geo/maps-data/data/gazetteer2010.html


## What's in There

Read about fields:

https://www.census.gov/geo/maps-data/data/gazetteer2010.html



## What Are Some Questions we Can Answer?


* which state has the most school districts
* which school district is the most densely populated
* which school district is the least populated
* which school district probably has the _best sailing team_
* population density on state level?g

## Single Table Design

Which types to use?


## Aside on Primary Keys

Can also be tacked on at end as:

PRIMARY KEY(fips)

Ooh... composite primary key

PRIMARY KEY(question_id, tag_id)

## How about this?

DROP TABLE IF EXISTS sd;
CREATE TABLE school_districts (
	state text,
	fips text,
	name text,
	low_grade text,
	high_grade text,
	population integer,
	housing_units integer,
	land_area_meters real,
	water_area_meters real,
	land_area_miles real,
	water_area_miles real,
	lat real,
	lon real,
	PRIMARY KEY(fips)
);


## Import

How?

COPY table FROM '/file/name';
* format?
* has header?
* delimiter?
* null value?


COPY sd FROM '/tmp/sd-utf-8.txt' csv HEADER DELIMITER AS E'\t';

-- uh oh!

##  Uh Now What?

file Gaz_unsd_national.txt
man iconv
iconv -t UTF-8 Gaz_unsd_national.txt
iconv -f ISO-8859-1 -t UTF-8 Gaz_unsd_national.txt

whew!

## Cleaning

* remove some columns (some could be calculated maybe?)
* distinct values / counts - for example sd_name?
* strange to have population 0
* delete - no WAIT

## Add deleted column?

common columns:

* deleted
* modified
* created

## How Would That Look?

Transactions:

* BEGIN
* COMMIT
* ROLLBACK



## Views

CREATE VIEW sd_active AS SELECT * FROM school_districts WHERE deleted = FALSE;

{% endcomment %}
