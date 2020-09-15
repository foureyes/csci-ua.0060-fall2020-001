---
layout: homework
title: "Workshop #1 (Alternate)"
---

# Workshop #1 - File IO (Alternate)

## Overview

#### Goals

* Read and write files with Python
* Use plain Python to transform and clean data

#### Description

In this workshop, you'll use a data set from nasa.gov that contains global monthly means of temperature anomalies. What does that even mean?  🤔 Check out the home page and FAQ for the data set here:

* [GISS Surface Temperature Analysis Home page](https://data.giss.nasa.gov/gistemp/)
* [FAQ](https://data.giss.nasa.gov/gistemp/faq/#q101)

For this workshop:

1. get to know your group
2. using the home page and FAQ, answer questions about the data set
3. [download the most recent global-mean monthly data set of temperature anomalies](https://data.giss.nasa.gov/gistemp/tabledata_v4/GLB.Ts+dSST.txt).
4. read and transform the data from the data set above
5. submit the google form (each group member must submit their own form, but the answers can be the same)

#### Grading

* `60%` - completing and submitting the form by the end of class
* `10%` - answering short answers correctly
* `5%` - reasonable amount of code is present in form
* `5%` - code is runnable
* `5%` - code results in new file written file
* `5%` - file contains data based on original data set
* `10%` - resulting file is _mostly_ correct

## Instructions

The entire workshop should be approximately 45 minutes

1. `5-10 min`: form, introductions and roles
	* __open the [workshop form](https://forms.gle/fy2WKFZV9M25aSDK8)__: fill this out as your progress through the workshop
		* you must be logged in to your NYU Google account to do this
		* each group member must submit an individual form
		* it's ok if the answers for each group member are very similar / the same
    * __introductions__: in alphabetical order by first name, introduce yourselves by saying your:
        * name
        * year
        * major
    * __group roles__: two group members should volunteer to fill the following roles:
        1. "leader" / screen sharer - responsible for sharing their screen and IDE / text editor
			* everyone else should follow along by writing code on their own editor as well
        2. time keeper - responsible for keeping track of time; notifies group when there are only 5 minutes left
	* __ice breakers__:
		* everyone take turns answering this question: "What's one of your most embarrassing moments?" 
			* leader starts and chooses the next person to answer by saying that person's name
			* that person, in turn, picks the next person to go
		* group vote: what's the _best_ breakfast food? waffles and ice cream? ramen? something else? idk 🤷
			* come to a consensus!
			* __add your answer to the form__
2. `30-35 min`: work with the data set
	1. what do the values in the file represent?
		* the accompanying data set documentation identifies these values are  _temperature anomalies_ 
		* go through the [FAQ](https://data.giss.nasa.gov/gistemp/faq/#q101) to answer: what _are_ temperature anomalies?
		* add this answer to the workshop form
	2. write code in [workshop_01.py (download)](workshop_01.py) to read and transform the downloaded data set 
		* use plain Python to do this (no `pandas` or `csv` module)
		* if one person seems to be dictating all of the code...
			1. give others a chance to contribute (take turns suggesting what to write next)
			2. take a moment to make sure everyone understands
		* assume that the data file is in the same directory that your program is running from
		* find the maxiumum and minimum temperature anomaly for each year
		* convert these values to degrees celsius (values in data file are in 0.01 degrees celsius)
		* write out a new version of file, and call the file `workshop01_output.txt`
			* there should be three columns: `year`, `min`, and `max`
			* there should be a single row at the top of the file that contains these header names
			* each row should be pipe `|` delimited
			* each subsequent row should contain your calculated data
			* format the results so that there's two decimal places (use [format](https://docs.python.org/3/library/functions.html#format) with `.2f` as the second argument)
		* the content of the new file, `workshop01_output.txt` should look like this (`.`s represent additional data not shown in example output)... though ⚠️  __some values may be slighty different depending on when you download the original data file__:
			```
year|min|max
1880|-0.23|-0.08
1881|-0.20|0.07
.
.
2006|0.48|0.79
2007|0.50|1.02
.
. 
```
3. `5 min`: closing
	* fill out the remaining questions in the [submission form](https://forms.gle/fy2WKFZV9M25aSDK8):
		* list 3 things that made extracting data from / working with the file challenging
		* fill out feedback regarding your group work
    * remember to submit your form! 
4. At the end of the workshop, everyone will be brought back to the main room

<br>
<br>
<br>
<br>

{% comment %}
workshop
1. coding
	* convert to celsius 
	* on average, which months are warmer - write the results out to the file
2. questions
		* which month and year had the highest temperatur anomaly
----what's one thing that you had trouble with?
{% endcomment %}
