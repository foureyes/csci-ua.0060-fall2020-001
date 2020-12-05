---
layout: homework
title: "datasets"
---

# Dataset for Final Exam


## 1. [nyc_properties_sold.csv](final/nyc_properties_sold.csv) ⬇️

This dataset is based off of the [NYC Citywide Rolling Calendar Sales](https://data.cityofnewyork.us/dataset/NYC-Citywide-Rolling-Calendar-Sales/usep-8jbt) data set from New York City's Department of Finance. It lists properties sold in the last twelve-month period in New York City.

An explanation of the fields in this csv [can be found in the Glossary of Terms for Property Sales Files pdf](https://www1.nyc.gov/assets/finance/downloads/pdf/07pdf/glossary_rsf071607.pdf).


1. Make sure you've Create a new database called `midterm` (which will be `YOURUSERNAME_midterm` when connecting to MariaDB) through the [database management tool](https://cims.nyu.edu/webapps/databases) (use your i6 password to logged in, sent to you via pdf)
2. Upload [donations.sql](midterm/donations.sql) using `scp` or winSCP


3. Login to i6:
	```ssh YOURUSERNAME@i6.cims.nyu.edu
```
4. Import the data into your new database using the mysql client:
	```
export LC_ALL=en_US.UTF-8
module load mongodb-3.2.0
`mongoimport --headerline --type=csv --db=YOUR_USERNAME --collection=jobs --host=class-mongo db.cims.nyu.edu --file=./NYC_jobs.csv --username=YOUR_USERNAME --password=YOUR_PASSWORD`
```
5. Connect to the MariaDB server and try some queries
	```mysql -hwarehouse.cims.nyu.edu -p -u YOURDBUSERNAME YOURUSERNAME_midterm
```

* this data shows donations __to organizations__
* every organization is associated with an elected official; two organizations can be associated with the same elected official
* note that there are two kinds of donation amounts: amount and value_in_kind; you can think this as the donor donating either a monetary amount or an item that has some value... so each donation should have one of these fields filled, while the other would be null


mongoimport --headerline --type=csv --file=nyc_properties_sold.csv --db=jversoza --collection=sales --username=jversoza --host=class-mongodb.cims.nyu.edu --password evGxByhC
