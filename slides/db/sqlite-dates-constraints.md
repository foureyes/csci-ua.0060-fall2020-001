---
layout: slides
title: "Constraints, Conventions, Dates"
---


<section markdown="block">
## Naming Considerations

__This goes without saying, but....__

1. make sure names are descriptive 
	* sometimes being verbose is better to enhance readability
	* use underscore `_` for word separator; `-` is interpreted as subtraction!
2. as mentioned in an earlier set of slides, be consistent with pluralization for table names (I tend to use singular)

</section>


<section markdown="block">
## Constraints

__Sometimes we want more fine-grained control over what's considered valid data__ &rarr;

We can add additional rules for valid values by creating __constraints__. Constraints limit the kind of data that can go into:
{:.fragment}

1. {:.fragment} individual columns (column constraint)
2. {:.fragment} or the entire table (table constraint)


Constraints help ensure data integrity (consistency, accuracy, and general quality) in our tables (and even _across_ tables). 👍
{:.fragment}
</section>

<section markdown="block">
## List of Constraints

Some constraints include:

* {:.fragment} Check Constraints
* {:.fragment} Not-Null Constraints
* {:.fragment} Unique Constraints
* {:.fragment} Primary Keys (for SQLite, does not imply NOT NULL)
* {:.fragment} Foreign Keys (Optional)

</section>

<section markdown="block">
## Check Constraints

__A check constraint is a generic constraint type.__ &rarr;

* {:.fragment} as a _column-level_ constraint, add `CHECK expression` 
* {:.fragment} example: `enrollment_cap INTEGER CHECK (enrollment_cap > 0)` 
* {:.fragment} note that you can have arbitrarily complex expressions using logical operators (`AND`, `OR`)
* {:.fragment} [see more details in the docs](https://sqlite.org/lang_createtable.html#check_constraints)

</section>

<section markdown="block">
## Not Null and Unique

__These work as you'd expect__ &rarr;

As column constraints...

* `NOT NULL` - no missing values in this column
* `UNIQUE` - all values in this column are unique
</section>

<section markdown="block">
## Primary Keys

A table's __primary key__ 🔑 is a column (or columns) that uniquely identify a row in that table.  

As a constraint, it __should__ provide the following guarantees (this not true of SQLite, though!):
{:.fragment}

1. {:.fragment} the column or columns are unique in the table
2. {:.fragment} the column or columns will always have a value (not null)

⚠️  __There is a quirk with SQLite...__
{:.fragment}

> Unfortunately, due to a bug in some early versions, this is not the case in SQLite. Unless the column is an INTEGER PRIMARY KEY or the table is a WITHOUT ROWID table or the column is declared NOT NULL, <span class="hl">SQLite allows NULL values in a PRIMARY KEY column</span>. 
{:.fragment}

</section>


<section markdown="block">
## Autoincrement

__We've gone over this already, but to reiterate__:

If a column is `INTEGER PRIMARY KEY`, attempting to insert a null value for that column results in an integer generated that's one more than the largest id.
{:.fragment}

* {:.fragment} this means that if a row is deleted, a primary key value may be recycled
* {:.fragment} if you want behavior where primary key values are not recycled, use `AUTOINCREMENT`:
 `INTEGER PRIMARY KEY AUTOINCREMENT`

</section>

<section markdown="block">
## Primary Key Syntax (Table Constraint) 

__A primary key can be declared on the table level (rather than just on a single column):__ &rarr;

(Why might this be useful? <span class="fragment">...a primary key may depend on more than just one column</span>)
{:.fragment}

Yes, that's right, primary key can consist of multiple columns! This is called a __composite primary key__.
{:.fragment}

<pre><code data-trim contenteditable>
CREATE TABLE course (
	course_num TEXT NOT NULL,
	section TEXT NOT NULL,
	name TEXT,
	PRIMARY KEY (course_num, section)
);
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Choosing a Primary Key

__A primary key can be created by using existing column(s) (natural) or creating a new column (articial)__ &rarr;

A __natural key__ is an existing column that is used as a primary key
{:.fragment}

* {:.fragment} __if this column exists and already has data in it, what are some characteristics about it that make it a valid candidate for a primary key?__ &rarr;
	* {:.fragment} the existing column cannot (_should_ not) have any null values
	* {:.fragment} the existing column must be unique
	* {:.fragment} the key should probably be mostly _stable_ (that is, it shouldn't change!)
* {:.fragment} example: course number and section columns
* {:.fragment} can you think of other examples of _naturally_ potential occurring keys in other domains?
	* {:.fragment} netid, isbn, ssn (but _should_ you use this?), etc.


</section>

<section markdown="block">
## Primary Keys for People

__Values like ssn, license number, or even email address may seem like good primary keys at first... but they do introduce some problems__ &rarr;

* {:.fragment} these values can _actually_ change
* {:.fragment} some of this data, like ssn, is sensitive information, and should not be used as an id
	* that id will be seen by those that have access to the database (even if not intentional)
* {:.fragment} an artificial key is _likely_ the best solution for a unique identifier for a person
</section>

<section markdown="block">
##  Primary Key Continued

A __surrogate key__ or __artifical key__, on the other hand, is a new column added with the purpose of serving as a primary key. 

__What type is this typically implemented as?__ &rarr; <span class="fragment">`INTEGER`</span>
{:.fragment}

</section>

<section markdown="block">
## Natural Key vs Surrogate/Artificial Key

__What are some reasons to use/not use one key type over another?__ &rarr;

Natural keys
{:.fragment}

* {:.fragment} no extra column needs to be added
* {:.fragment} column is _meaningful_

Surrogate / Artificial Keys
{:.fragment}

* {:.fragment} _real world_, natural keys typically can change... (for example, someone may want to change their `netid` or a course number and section may be modified)!
* {:.fragment} natural keys may take up more space
{:.fragment}
</section>

<section markdown="block">
## Foreign Keys

__Foreign keys__ ensure integrity between related tables. For example, if could guarantee that a column in the first table that references a column in the second table actually has matching value in the second table.

We'll look at related table and foreign keys in more detail later, using a different DBMS

However, as a quick note, SQLite _does_ support foreign keys, but it __must be turned on explicitly__
</section>
<section markdown="block">
## Foreign Keys Continued

__So what does this get you?__

An example:

* {:.fragment} A `genre` table has a primary key, `id`, a `name`, and a `description`
* {:.fragment} A `movie` table has a `genre_id` that references a row in the `genre` table
* {:.fragment} One `genre` _can have many_ movies!
* {:.fragment} Note that this can be checked as a constraint: does the `genre_id` reference a row in `genre` with that same value in `id`?
</section>

<section markdown="block">
## Where Does Your "Business Logic" Live

__This sounds a lot like app logic?__ &rarr;

This logic can be implemented in the database...

* {:.fragment} more likely to change application stack or have multiple application stacks
* {:.fragment} but _no one knows_ database programming anymore (less trendy, smaller pool, not a common skillset)
* {:.fragment} database migrations happen, but definitely less common than other parts of a technology stack
</section>



<section markdown="block">
## No Storage Class for Date and Time 

__From the docs, the storage class to use for dates and times can vary:__ &rarr;

* `TEXT` as ISO8601 strings ("YYYY-MM-DD HH:MM:SS.SSS").
* `REAL` as Julian day numbers
* `INTEGER` as Unix Time, the number of seconds since 1970-01-01 00:00:00 UTC.

</section>

<section markdown="block">
##  Date and Time Functions

Although there's no date, datetime or time storage class, __SQLite does over several functions for working with dates and times__ [See the docs in SQLite date/time functions](https://www.sqlite.org/lang_datefunc.html)

Some examples include:

* {:.fragment} `date`, `time`, `datetime`... all taking a string as an argument, followed by modifiers
	* {:.fragment} they convert a string to a date or time and allows time based calculations, comparisons, etc.
* {:.fragment} `strftime(format, s)` allows formatting of a time string

</section>

<section markdown="block">
## Date Time Functions Starter Data

```
create table login_attempt(username text, created_date text);
insert into login_attempt values 
('alice', '2020-09-02 12:09:00'),
('bob', '2020-09-02 08:02:05'),
('carol', '2020-09-02 14:30:31'),
('alice', '2020-09-05 18:01:22'),
('bob', '2020-09-05 01:20:52'),
('eve', '2020-07-02 09:30:30');
```
</section>



<section markdown="block">
##  Example Queries

__The following queries show how these date and time functions may be used__ &rarr;

```
-- increment the day for or all created_date
select username, date(created_date, '+1 day') 
from login_attempt;
```
```
-- group by MM-DD and count
select strftime('%m-%d', created_date) as month_day, count(*) 
from login_attempt group by strftime('%m-%d', created_date);
```
</section>




