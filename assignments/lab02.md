---
layout: homework
title: "Workshop #1"
---

# Workshop #2 - Dog Bytes

## Overview

#### Goals

* Use the SQLite commandline tool to create a database
* Create / design a table
* Import data into SQLite
* Use SQL to answer questions about the data
* Transform data with SQL

#### Description

* [DOHMH Dog Bite Data](https://data.cityofnewyork.us/Health/DOHMH-Dog-Bite-Data/rsgh-akpg)
* Note, there is no clear license - we will:
	* not redistribute this data
	* only use the data for educational purposes
	* not reproduce the data; only interpret / analyze it

For this workshop you will:

1. get to know / re-familiarize yourself with your group 
2. [download the data set](https://data.cityofnewyork.us/Health/DOHMH-Dog-Bite-Data/rsgh-akpg); click on the export button and choose `csv`
3. create a table in SQLite to store the data
4. import the data into SQLite
5. answer questions about the data by formulating queries
6. alter / transform the data by running queries
7. submit the google form (each group member must submit their own form, but queries _should_ be the same)

#### Grading

* `50%` - completing and submitting the form by the end of class
* `30%` - attempted most queries
* `10%` - queries are correct / close to being correct
* `10%` - answered non query questions

## Instructions

The entire workshop should be approximately 55 minutes

#### `5-10 min` PART 1: form, introductions and roles

* __open the [workshop form](https://forms.gle/ftbNcZpuxNBK6VsP7)__: fill this out as your progress through the workshop
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

#### `35-40 min` PART 2: import and work with the data set

0. if you haven't already done so, ["install" the SQLite commandline tool](../slides/db/sqlite-cli.html#1) (if you're on MacOS, you likely will already have it installed)
1. review the [documentation regarding the name, description and type of each column for the dog bite data](https://data.cityofnewyork.us/Health/DOHMH-Dog-Bite-Data/rsgh-akpg) (find this under "Columns in this Dataset")
2. construct a table for the dog bite data called `dogbite`
	* create or download the starter file, [dogbite_table.sql](lab02/dogbite_table.sql), using a text editor of your choice
	* within the file write an SQL DDL command to construct a table called `dogbite`
	* use the __ideal__ [type affinity](https://sqlite.org/datatype3.html#affinity_name_examples) for each column based on:
		1. the documentation about the columns
		2. the type affinities SQLite supports
		3. the use of the `Age` column in numeric calculations such as `AVG`, `MAX`, etc.
		4. naming columns using lowercase and underscore (`like_this`) rather than camelcase (`likeThis`)
		5. avoiding string data when a more appropriate type could be used
	* ✏️ __write the DDL command you created for your table into the form__
	* start your sqlite commandline tool in `Terminal.app` on MacOS or by double-clicking on the `exe` file on windows: 
		```
sqlite3
```
	* this should result in a prompt, `>`, waiting for SQL or commands
	* run the SQL from `dogbite_table.sql` in the sqlite3 commandline tool by using the `.read` command: 
		```
.read dogbite_table.sql
```
		* you may have to include the absolute path if you recieve an error: `Can't open name_of_file`
		* for example, if your sql file is in the Downloads folder on windows 10: `c:\Users\your_username\Downloads\dogbite_table.sql` ([see wikipedia's article on the filesystem hierarchy](https://en.wikipedia.org/wiki/Directory_structure#Windows,_DOS_and_OS/2))
		* on MacOS, if your sql file is on your Desktop, it may be: `/Users/your_username/Desktop/dogbite_table.sql` ([see the docs](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/art/mosx_fs_layout_2x.png))
	* ensure that your table exists by running the `.tables` command: 
		```
.tables
```
		* this should show the single table that was made by reading your sql, `dogbite`
	* verify the columns and types by using the `.schema` command to view them:
		```
.schema dogbite
```
		* this should show the columns and types of your table
	* save you new table into a new database file called `dogbite.db`
		```
.save dogbite.db
```
		* note that you may want to use an absolute path as you did with `dogbite_table.sql`
	* ensure that your new database was saved by quitting the sqlite3 commandline tool: 
		```
ctrl + d
```
	* then start the tool again: 
		```
sqlite3
```
	* open the database file with:
		```
.open dogbite.db
```
		* alternatively, you can start the commandline tool with your db immediately by running `sqlite3 dogbite.db`
	* once again, check that your table, `dogbite` exists and make sure its column names and type affinities are correct
3. import data into your new table
	* prepare your incoming data by first removing the header; save this as a different file, `dogbites_no_header.csv`
		* you can open the file in a text editor
		* ...and delete the first line
	* using the `.import` command below with an existing table requires that the headers are removed
		* change to csv mode priot to import: 
			```
.mode csv
```
		* bring in file into the table you just created: 
			```
.import dogbites_no_header.csv dogbite
```
		* if this fails, it's likely because:
			* the file wasn't found (check the name of the file or use an absolute path)
			* csv mode wasn't turned on yet
4. format the output as columns with headers and check that the import worked
	* use column mode and turn headers on
		```
.mode column
.headers on
```
	* run a query to see the imported data
		* `SELECT * FROM dogbite`
5. answer questions about the dog bite data set using SQL
	1. [download `lab02_queries.sql`](lab02/lab02_queries.sql)
	2. open it with a text editor of your choice (right click, open with)
	3. `lab02_queries.sql` contains instructions and questions as SQL comments
	4. write SQL and comments below each question within the text file itself
	5. ✏️ when you're done (or mostly done) __upload__ the file using the file upload functionality on the google form

#### `5 - 10 min` PART 4: closing

* fill out the remaining questions in the [submission form](https://forms.gle/ftbNcZpuxNBK6VsP7):
	* as a group, write a question about the data set that can be answered by sql
	* as an individual, write a general question about SQL or SQLite, along with its answer
	* fill out feedback regarding your group work
* ⚠️ __remember to submit your form!__

__At the end of the workshop, everyone will be brought back to the main room__

<br>
<br>
<br>
<br>

