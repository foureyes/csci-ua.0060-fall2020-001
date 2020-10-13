---
layout: homework
title: "Workshop #3"
---

# Workshop #3 - Joins

## Overview

#### Goals

* Use the MySQL client on i6 to connect to MariaDB
* Import data with `.sql` scripts
* Use joins to combine data across tables

#### Grading

* `50%` - completing and submitting the form by the end of class
* `30%` - attempted most queries
* `10%` - queries are correct / close to being correct
* `10%` - answered non query questions

## Instructions

#### `5 min` PART 1: form, introductions and roles

* __open the [workshop form](https://forms.gle/JJNL71zES8KkHGmD9)__: fill this out as your progress through the workshop
	* you must be logged in to your NYU Google account to do this
	* __each group member must submit an individual form__
	* it's ok if the answers for each group member are very similar / the same
* __group roles__: two group members should volunteer to fill the following roles:
	1. "leader" / screen sharer - responsible for sharing their screen and IDE / text editor
		* everyone else should follow along by writing code on their own editor as well
	2. time keeper - responsible for keeping track of time; notifies group when there are only 5 minutes left

#### `40 min` PART 2: import and work with the data set

1. if you need a refresher, review the [original documentation](https://www.fda.gov/media/97035/download)
	* the data for the sql import was sourced from a csv downloaded in early 2020
	* it was broken up into multiple mysql/mariadb tables
	* the exercises in part 4 will help you infer the relationships between tables 
	* from the documentation link, the following are relevant to the queries you'll write:
		* a single __report__ of an adverse reaction event may be associated with more than one product
		* for __product_type__, __suspect__ is the product that may have caused the adverse reaction and  __concomitant__ is a product that is in the patient's system at the time of the event
		* __product_code__ determines a product's __description__
		* examples of "terms" / symptoms include rash, vomiting, etc.
2. [download the data set](lab03/caers-tables.zip)
3. upload the zip file to `i6.cims.nyu.edu` using scp (on MacOS or Linux) or [winscp](https://winscp.net/eng/index.php) (on Windows) 
	* if using winscp, fill out the host name with `i6.cims.nyu.edu` in the [login form](https://winscp.net/eng/docs/ui_login)
		* drag and drop the file to your home folder
	* if using scp: `scp caers-tables.zip YOUR_USERNAME@i6.cims.nyu.edu:~
		* this will upload the zip file to your home folder
4. answer questions about the reports of adverse reactions by using joins and/or subqueries
	1. [download `lab03_queries.sql`](lab03/lab03_queries.sql)
	2. open it with a text editor of your choice (right click, open with)
	3. `lab03_queries.sql` contains instructions and questions as SQL comments
	4. write SQL and comments below each question within the text file itself
	5. 👀 __suggestion__: write your queries in a _local_ text editor first, and then copy and paste to the mysql client
	6. ✏️ when time is up __upload__ the file using the file upload functionality on the google form
	7. (you can finish the remainder for homework... submitted via git, and you can collaborate with the students in your group for this file only)

#### `10 min` PART 4: closing

* ✏️ fill out the remaining questions in the [submission form](https://forms.gle/ftbNcZpuxNBK6VsP7):
	* as a group, write a question about the data set that can be answered by sql
	* as an individual, write a general question about MySQL/MariaDB, along with its answer
	* fill out feedback regarding your group work
* ⚠️ __remember to submit your form!__

__At the end of the workshop, everyone will be brought back to the main room__

<br>
<br>
<br>
<br>

