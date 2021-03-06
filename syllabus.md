---
layout: default
nav-state: syllabus
---


Syllabus
=====

Course Information
-----

* __Course Number__: {{ site.vars.course_number }}
* __Course Section__: {{ site.vars.course_section }}
* __Course Name__: {{ site.vars.course_name }}
* __Course Semester__: {{ site.vars.course_semester }}
* __Course Time__: {{ site.vars.course_time }}
* __Course Room__: {{ site.vars.course_room }}
* __Course Site__: {{ site.vars.course_site }}
* __Required Courses__: CSCI-UA.0002/CSCI-UA.0003

This course may fulfill a requirement for students in:

1. {:.fragment} the data science minor
2. {:.fragment} the web minor

Format
-----

This course is __fully remote__

* The class will meet twice-a-week week for 1.25 hours
* Students are encouraged to attend lectures through online meeting software during specified course times, and weekly reviews will be held by the class tutor for students that have timezone conflicts 
* Some classes __will involve hands-on work during class time__ (timezone differences will be accommodated)
* There will be weekly office hours available, as well as weekly tutoring sessions with the course classroom assistant or tutor
* A platform will be provided for asking questions online as well as moderating discussions among students


Topics
-----

* Manipulating Data (using Python)
* SQL and Relational Database with Single Tables (using SQLite) 
* Relational Database with Multiple Tables (with MySQL)
* Relational Database Design
* Database Driven Web Site
* Consuming APIs
* Data Visualization
* Document Database (with MongoDB)
* Manipulating Date with a Library (using pandas)
* (Optional) Other Database Paradigms

Course work
-----


__The final percentage allotted to each category below is at the instructor’s discretion.__ 

{% comment %} * __10%__: 5 x in-class interactive workshops {% endcomment %}

* __10%__: 4-6 x "in-class"\*  workshops, quizzes, and participation
* __10%__: 6-8 x at-home general quizzes
* __30%__: 7-9 x homework assignments
* __25%__: 1 x midterm exam
* __25%__: 1 x final exam

\* accommodations will be made for students with timezone conflicts

👀 A survey will be sent out to students to determine which students will need support due to time zone 🕛 differences.

Generally ⚠️  __all work should be your own__ (unless specified explicitly in assignment or workshop directions).  Do not copy , clone, distribute, etc. your work. See below for details.


{% comment %}
__Interactive Workshops__

* Completed during class time (exceptions made for students in time zones where class cannot be attended)
* Workshops will demonstrate practical application of previous lecture material
* Group submissions may be permitted for some workshops; this will be announced prior to each workshop
* Significant support provided by instructor(s)
{% endcomment %}


__In-Class Coding Quizzes, Workshops, and Participation__

* Participation 
	* Polls, surveys and forms to be filled out during in-class lecture
* Quizzes
	* Short, timed (30 minutes to an hour) coding quizzes taken during class 
	* Quizzes will be announced during class on day that quiz will be given
	* Coding quizzes will allow students to assess their understanding of the course material
* Workshops
	* Small project to be submitted during class time
	* Workshops will be announced prior to class
* Late submissions are not accepted, with the following exceptions (with documentation and request via online form)
	* Illness
	* Religious observance
	* Quiz platform is unavailable
	* This policy may be revised by the instructor to accommodate special circumstances.
* All work must be your own:
	* Do not copy (clone, download, etc.) anyone else's code
	* Do not distribute/publish your code (including publishing to a public git repository or posting in a forum)
	* Please see the department's page on academic integrity for full policy and potential disciplinary action: [https://cs.nyu.edu/home/undergrad/policy.html](https://cs.nyu.edu/home/undergrad/policy.html)
* You may use your own notes, course materials posted by your instructor (slides, videos, example code, etc.) or books

__At-Home General Quizzes__

* Quizzes composed of short answer questions, multiple choice, etc. to be taken online from home
* These quizzes will reinforce readings, videos and may provide background material for future workshops or lectures
* Late submissions are not accepted, with the following exceptions (with documentation and request via online form)
	* Illness
	* Religious observance
	* Quiz platform is unavailable
	* This policy may be revised by the instructor to accommodate special circumstances.
* All work must be your own:
	* Do not copy (clone, download, etc.) anyone else's code
	* Do not distribute/publish your code (including publishing to a public git repository or posting in a forum)
	* Please see the department's page on academic integrity for full policy and potential disciplinary action: [https://cs.nyu.edu/home/undergrad/policy.html](https://cs.nyu.edu/home/undergrad/policy.html)
* You may use your own notes, course materials posted by your instructor (slides, videos, example code, etc.) or books

__Homework Assignments__

* Small projects assigned approximately every 1-2 weeks
* Late submissions are not accepted, with the following exceptions (with documentation and request via online form)
	* Illness
	* Religious observance
	* Quiz platform is unavailable
	* This policy may be revised by the instructor to accommodate special circumstances.
* All work must be your own:
	* Do not copy (clone, download, etc.) anyone else's code
	* Do not distribute/publish your code (including publishing to a public git repository or posting in a forum)
	* Please see the department's page on academic integrity for full policy and potential disciplinary action: [https://cs.nyu.edu/home/undergrad/policy.html](https://cs.nyu.edu/home/undergrad/policy.html)
* You may use your own notes, course materials posted by your instructor (slides, videos, example code, etc.) or books

__Exams__

* Administered online during specified time
* An alternate time will be provided for students in a time zone where attending the exam time is not possible
* All work must be your own:
	* Do not copy (clone, download, etc.) anyone else's code
	* Do not distribute/publish your code (including publishing to a public git repository or posting in a forum)
	* Please see the department's page on academic integrity for full policy and potential disciplinary action: [https://cs.nyu.edu/home/undergrad/policy.html](https://cs.nyu.edu/home/undergrad/policy.html)
* You may use your own notes, course materials posted by your instructor (slides, videos, example code, etc.) or books

Required Software
-----

Programming Environment

* [Python 3.x](https://www.python.org/downloads/)
	* [sqlite3](https://docs.python.org/2/library/sqlite3.html) (installed with Python 3.x)
* [PyMySQL](https://pymysql.readthedocs.io/en/latest/) (install with pip or conda)
* [matplotlib](https://matplotlib.org/) (install with pip or preinstalled with Anaconda)
* [pandas](https://pandas.pydata.org/) (install with pip or preinstalled with Anaconda)


Database Management Systems

* [SQLite](https://www.sqlite.org/index.html)
* MySQL - provided on i6
* MongoDB - provided on i6

Tools 

* git client (commandline or graphical)
* text editor

Books
-----

All books are available online:

* via "Online Access" through NYU Libraries / O'Reilly Safari
* free html / ebook versions supplied by author or publisher
* database platform's documentation

Readings will be selected from the following books

1. [{{ site.vars.book_python_full }}{% if site.vars.book_python_author %} by {{ site.vars.book_python_author }}{% endif %}]({{ site.vars.book_python_link }}) {% unless site.vars.book_python_full == site.vars.book_python %} ({{ site.vars.book_python }}) {% endunless %}
2. [{{ site.vars.book_data_full  }}{% if site.vars.book_data_author %} by {{ site.vars.book_data_author }}{% endif %}]({{ site.vars.book_data_link }}) {% unless site.vars.book_data_full == site.vars.book_data %} ({{ site.vars.book_data }}) {% endunless %}
3. [{{ site.vars.book_sqlite_full  }}{% if site.vars.book_sqlite_author %} by {{ site.vars.book_sqlite_author }}{% endif %}]({{ site.vars.book_sqlite_link }}) {% unless site.vars.book_sqlite_full == site.vars.book_sqlite %} ({{ site.vars.book_sqlite }}) {% endunless %}
4. [{{ site.vars.book_db_design_full  }}{% if site.vars.book_db_design_author %} by {{ site.vars.book_db_design_author }}{% endif %}]({{ site.vars.book_db_design_link }}) {% unless site.vars.book_db_design_full == site.vars.book_db_design %} ({{ site.vars.book_db_design }}) {% endunless %}
5. [{{ site.vars.book_mysql_full  }}{% if site.vars.book_mysql_author %} by {{ site.vars.book_mysql_author }}{% endif %}]({{ site.vars.book_mysql_link }}) {% unless site.vars.book_mysql_full == site.vars.book_mysql %} ({{ site.vars.book_mysql }}) {% endunless %}
6. [{{ site.vars.book_mongodb_full  }}{% if site.vars.book_mongodb_author %} by {{ site.vars.book_mongodb_author }}{% endif %}]({{ site.vars.book_mongodb_link }}) {% unless site.vars.book_mongodb_full == site.vars.book_mongodb %} ({{ site.vars.book_mongodb }}) {% endunless %}


<!--

* Using Python to prepare datafiles; explorations of "data in the wild"
* Using Python for data anlysis.
* Introduction to data visualization; using Python to build charts and graphs.
* Introduction to SQL with SQLite
* Relational database Design
* Server-side SQL: We will use MySQL in class and also discuss Oracle and PostGreSQL
* NoSQL: Introduction to MongoDB
* Discussion of other database paradigms such as Graph databases [Time-permitting]




1. intro
2. python + data cleansing  x 3
3. sqlite + single table x 3
4. python with SQLite
5. design x 4
6. mysql / multiple table x 4
7. database management
8. mongodb x 2
9. viz 
10. pandas
11. optional x 2
12. review x 2

1. intro
2. spreadsheets
3. python + data cleansing  x 2
4. sqlite / sql single table x 3
5. next gen db
6. mongodb x 3
7. web / server side x 2
8. mysql / multiple tables x 2
9. html review
10. pandas x 2
11. viz 
12. apis
13. optional x 2
14. review x 2
-->
