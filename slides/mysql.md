---
layout: slides
title: "MySQL"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Number Types 

__Check the docs on [numeric data types](https://www.postgresql.org/docs/current/static/datatype-numeric.html)__ &rarr;

* {:.fragment} `serial` (auto incrementing, pk if no "natural pk" apparent, called artificial / surrogate)
* {:.fragment} `integer` - typical choice for integer, 4 bytes
* {:.fragment} `smallint` - 2 bytes, signed
* {:.fragment} `bigint` - 8 bytes, signed
* {:.fragment} `decimal` / `numeric` - user specified precision numbers
* {:.fragment} `real` / `double precision` - variable-precision numbers

</section>

<section markdown="block">
## Precision and Scale of Numeric / Decimal

__`numeric` and `decimal` types can be used to store values that contain a _very large number_ of digits.__ &rarr; 

* {:.fragment} calculations (such as addition, subtraction and multiplication) with these types <span class="hl">give back exact results</span>, but slower than using floating point types! 
* {:.fragment} the __precision__ and __scale__ of these types can be set
	* {:.fragment} __precision__: total count of significant digits
	* {:.fragment} __scale__: the number of decimal digits
	* {:.fragment} specified when declaring type: `numeric(4, 2)`
	* {:.fragment} precision first, then scale (alternatively, only precision)
	* {:.fragment} without precision or scale, precision and scale only limited by current implementation

</section>


<section markdown="block">
## Floating Point Numbers

__`real` and `double precision` are floating point types__ &rarr;

* {:.fragment} these types are <span class="hl">inexact</span>
* {:.fragment} you may be familiar with this already ... try this with regular floating point or number types in Python, Java or JavaScript:
	* {:.fragment} `0.1 + 0.2` 
	* {:.fragment} yields `0.30000000000000004`
* {:.fragment} if exact storage and calculations is necessary, use numeric 
* {:.fragment} `SELECT 0.15::numeric < 0.15::real -- WAT!?`

</section>


<section markdown="block">
## Strings

__See docs on [character data types](https://www.postgresql.org/docs/current/static/datatype-character.html)__ &rarr;

* {:.fragment} `text` - unlimited length
* {:.fragment} `varchar(n)` - where `n` is num of characters (character varying)

⚠️If casting to lesser length, string will be truncated to fit!
{:.fragment}

</section>

<section markdown="block">
## Dates and Times

See [docs on Date/Time types](https://www.postgresql.org/docs/current/static/datatype-datetime.html)

* {:.fragment} `timestamptz` (timestamp __with timezone__, __use this__!)
	* {:.fragment} stored as UTC (universal coordinated time, sometimes GMT is synonym), queried, shown in local time zone
* {:.fragment} `timestamp` (no timezone)
* {:.fragment} `date`
* {:.fragment} `time`

It's sometimes useful to store date or time date in a regular `integer` field. For example, year can be represented by:
{:.fragment}

* {:.fragment} a `timestamptz` or `date` but with consistent values for month, day etc.
* {:.fragment} ...as an `integer` (or even `smallint`) 

</section>

<section markdown="block">
## Booleans

__Boolean literals can be represented multiple ways!__ &rarr;

* {:.fragment} `true`
* {:.fragment} `'t'`
* {:.fragment} even `'yes'`, `'y'`, quoted true, etc...

However, when querying, the representation can depend on the client - for example, psql shows `t` or `f`, but datagrip shows a check box
{:.fragment}

</section>
<section markdown="block">
## Many Others!

__Check out this [table of all data types](https://www.postgresql.org/docs/10/static/datatype.html#DATATYPE-TABLE)!__ &rarr;

* {:.fragment} currency (`money` 💰)
	* will use the currency based on os-level localization settings
	* will format appropriately (commas, currency symbol, dots, etc.)
	* internally stores as `int` (think: cents)
* {:.fragment} shapes (`circle`, `polygon`)
* {:.fragment} documents (`xml`, `json` / `jsonb`)
* {:.fragment} networking (`inet` for ipv4 and ipv6, `cidr` for ip ranges)


</section>

<section markdown="block">
## Aside on Storing Money

__Some considerations when storing currency:__  &rarr;

* __exactness__ and rounding
* multi-currency support
* performance
{:.fragment}

</section>

<section markdown="block">
## Storing Money Continued

__What are some potential options for storing money?__:
{:.fragment}

* {:.fragment} `integer` - store cents manually, convert in application code (how to handle fractional cents, though!)
* {:.fragment} `numeric` - exact, but slow... (choose `scale` carefully; 2 likely not adequate!)
* {:.fragment} `money` - stores as cents, so exact for addition, subtraction, multiplication... but converts to floating point type for division 
	* handles input in different formats, but does not deal with conversion / multi-currency
	* _fast_ (basically int operations since dealing with cents)

Any rounding, conversion logic for either should be handled by application code
{:.fragment}

</section>

