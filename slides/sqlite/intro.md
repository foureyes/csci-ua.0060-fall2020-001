---
layout: slides
title: "sqlite intro"
---

<section markdown="block">
## 

hw00 - install python, fill out survey, github, prove that you know how to use it by: clone, add, commit, and push
hw01 - write a bunch of functions working with lists, text manipulation, or make a turtle game????




1. file io to motivate loops, conditionals
1. spreadsheets for:
	* show/hide columns
	* filter
	* sort
	* "map" / calculate columns
	* aggregation
	* tbh, just go with spreadsheet first! i mean really
	* otherwise, next 27 classes is the same as above (not really: case study, analysis, data cleaning, etc.)
3. regular expressions to make parsing easier?
4. classes to abstract above
5. just user a library, csv
6. try to show/hide columns, filter, sort, map, aggregate
7. sqlite data format
7. uh, this is annoying, let's write a language... select x, y, z, from ..., where...
8. examples: write game that saves data to file? sensor data and query????
9. this is kind of limited


from talk:

https://www.youtube.com/watch?v=Jib2AmRb_rk&feature=youtu.be

* pronounce it however, but talk sql aight
* sqlite "edge" of network
	* you may want database engine close as possible to application
* not client server
	* experiment:
* where is it used? EVERYWHERE!
	* maybe most deployed library / piece of software
* large limits
* dynamic typing? suggestions, will coerce
* diff cookies!!! (from talk)
* check out contacts (from talk)
	* https://wiki.genexus.com/commwiki/servlet/wiki?31044,How+To%3A+Query+SQLite+database+from+an+iOS+Offline+App
* check out chrome's db (from talk)
	* https://stackoverflow.com/questions/8936878/where-does-chrome-save-its-sqlite-database-to
* when to choose sqlite
	* is data somewhere else from app?
	* big data (too big to fit in file, but theoretical is 140 tb????)
		* https://www.sqlite.org/fileformat.html
	* multiple concurrent writers
* vs direct file access or "pile" of files
	* atomic
	* cross platform, encoding
	* performance
	* concurrency control
	* incremental update
	* uses sql
		* sql - data abstraction
		* sql - declarative
* why use?
	* low volume web app (400k hits?)
	* more than one machine... then no
	* quick data analysis on data set
	* portable
	* embedded in applications (desktop, mobile)

</section>
