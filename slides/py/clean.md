---
layout: slides
title: "Preparing and Cleaning Data"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Data Munging?!  🤷

Before working with a data set, __there's typically _some_ amount of work necessary to transform it so that it can be more easily and accurately analyzed__

This work -- transforming and pre-processing _raw_ data -- is sometimes referred to as  &rarr;

* {:.fragment} data munging
* {:.fragment} data wrangling 
* {:.fragment} preparing data
* {:.fragment} ETL - extract transform and load
	* {:.fragment} the load step typically refers to inserting data into a database

</section>


<section markdown="block">
## Don't Forget About It!

__⚠️ Be prepared!  🤼 Data wrangling may involve a non-trivial amount of work depending on the state of the original data__ &rarr;

* {:.fragment} data may not come from just a single source (some aggregation may be involved) 
* {:.fragment} the format of the source data may be difficult to map to the target format 🎯
* {:.fragment} the source data may have issues with overall quality and consistency

All of this could lead to _a lot_ of work.
{:.fragment}
</section>

<section markdown="block">
## Data Munging Overview

__Let's look at the following broad categories to see what may be involved in preparing data__ &rarr;

1. {:.fragment} reading the file and the file's format 📁
2. {:.fragment} field validation ✅
3. {:.fragment} appropriate values 🆗
4. {:.fragment} missing values 🔍


</section>

<section markdown="block">
## Reading the File

You may find that simply reading the data is already an obstacle. __What are some issues to watch out for prior to even looking at the actual fields or values in your data?__ &rarr;

1. {:.fragment} __location__ - can the file simply be read from disk? on the web? maybe the data is already in a database?
2. {:.fragment} __encoding!__ - make sure to read the file in the appropriate encoding to ensure no character set issues
3. {:.fragment} __multiple sources__ - ensure that the incoming data set is complete, aggregating from multiple sources if necessary
4. {:.fragment} __size__ - use the appropriate tools -- both libraries and even hardware (for example, pandas loads the entire DataFrame into memory)
5. {:.fragment} __superfluous data__  

</section>

<section markdown="block">
## File Formats

__Great! You've read a file, but what format is it in and what should use to understand that format?__ &rarr;

1. {:.fragment} __file format__ - use the right application / tool / library for the file format
	* {:.fragment} some well-known file formats have non-standard variants or require external documentation for syntax (csv for example!)
	* {:.fragment} problem if non-standard or irregular format &rarr;  manual parsing necessary 😢
2. {:.fragment} __escape characters__

</section>
<section markdown="block">
## Validating Fields / Columns

__You're able to read the data, but what _is_ the data, even?__

__Before working with the data, examine and validate the fields / columns: what are the kinds or types of values that are present__ &rarr;

* {:.fragment} __fields__ - check any documentation that accompanies the data set to determine the meaning of each field
* {:.fragment} __relationships__ - some of the fields may related; spot check values in related fields... is the relationship valid?
* {:.fragment} __types__ - is the field numeric, textual (categorical, nominal, enumerated)?
* {:.fragment} __units__ - don't make assumptions about units; find in the documentation!
* {:.fragment} __alignment__ - if you have tabular data (csv, fixed width), ensure that the columns line up?

</section>
<section markdown="block">
## Validating Values 

__In general some things to look at when examining actual values include:__ &rarr;

* {:.fragment} __domain__ - what are the possible values for this field based on the type? do the values actually fit into this domain / type? (for example, integers greater than 0 or only one of [S, M, L])
* {:.fragment} __referential integrity__ - if two fields are related, check that this relationship is exhibited correctly in the values
* {:.fragment} __frequency__ - does the frequency of the values _make sense_ or does it reveal some insight about the data

</section>
<section markdown="block">
## Examining Numeric Values

__When looking at values for a numeric field__ &rarr;

* what are some characteristics that help describe the values overall? 
* that is, what calculations can you make over a column / field that help you understand the values present at a high level?

* {:.fragment} __min and max__  - do these min and max values make sense in the context of the data?
* {:.fragment} __central tendency__ - where do the values cluster? (mean, median and mode)
* {:.fragment} __dispersion__ - the variability of the data (range, standard deviation)

</section>

<section markdown="block">
## Examining Text:  Enumerable, Categorical, and Nominal Fields 

__What are some issues that may come up when working with nominal (no quantitative value) fields__ &rarr;

* {:.fragment} ensure all values in the field within the set of valid values (domain again)?
* {:.fragment} normalize values in field 
	* multiple names, but same value (New York City vs NYC)
	* casing, spaces

</section>

<section markdown="block">
## Missing Values

As with everything else mentioned above, __is there documentation provided about the significance of or the reason for missing data?__ Some issues that come up when dealing with missing values include:
* {:.fragment} how can we differentiate between valid values and missing values?
	* {:.fragment} what __marker__ is used to denote missing data?
	* {:.fragment} is there collision with legitimate values and the "marker"
* {:.fragment} what role will they play in your calculations / analysis
* {:.fragment} how should the missing values be handled? __what are some options?__ &rarr;
	* {:.fragment} ignore
	* {:.fragment} recollect data
	* {:.fragment} interpolate a value based on other values in the data field
	* {:.fragment} assign a default value
</section>
