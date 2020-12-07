---
layout: homework
title: "datasets"
---

# Dataset for Final Exam

## [nyc_properties_sold.csv](final/nyc_properties_sold.csv) ⬇️

This dataset is based off of the [NYC Citywide Rolling Calendar Sales](https://data.cityofnewyork.us/dataset/NYC-Citywide-Rolling-Calendar-Sales/usep-8jbt) data set from New York City's Department of Finance. It lists properties sold in the last twelve-month period in New York City.

An explanation of the fields in this csv [can be found in the Glossary of Terms for Property Sales Files pdf](https://www1.nyc.gov/assets/finance/downloads/pdf/07pdf/glossary_rsf071607.pdf).

To import this .csv into MongoDB on i6:

1. if you haven't already done so, initialize and retrieve a password for your database here: [https://cims.nyu.edu/class-mongodb/manage](https://cims.nyu.edu/class-mongodb/manage)
2. download the csv file, [nyc_properties_sold.csv](final/nyc_properties_sold.csv), and then __upload it to `i6` using `scp` or winscp__
3. log in to `i6`, substituting `YOURUSERNAME` with your actual username: `ssh YOURUSERNAME@i6.cims.nyu.edu`
4. on i6, set up environment variables before using commandline tools, such as `mongo` or `mongoimport`; note that this must be done every time you log in to i6
	* `export LC_ALL=en_US.UTF-8`
	* `module load mongodb-3.2.0`
	*  if `module load` fails with an error due to `mongodb-3.2.0` not being found, rerun the command using the full path to the module instead: `/usr/local/etc/modulefiles/mongodb-3.2.0`
5. to run the import, run the line below in the same directory that you uploaded the csv in, substituting `YOURUSERNAME` and `YOURPASSWORD` appropriately
	```
mongoimport --headerline --type=csv --file=nyc_properties_sold.csv --db=YOURUSERNAME --collection=sales --username=YOURUSERNAME --host=class-mongodb.cims.nyu.edu --password YOURPASSWORD
```
6. start the `mongo` client by running this command, again substituting `YOURUSERNAME` with your actual username:
	```
mongo YOURUSERNAME --host class-mongodb.cims.nyu.edu -u YOURUSERNAME -p
```
7. convert the data types of two columns by running this code __while connected to mongodb within the mongo client__
	```
db.sales.find().forEach(function(data) {
    db.sales.update({
        "_id": data._id,
        "gross_square_feet": data.gross_square_feet
    }, {
        "$set": {
            "gross_square_feet": parseInt(data.gross_square_feet)
        }
    });
})
```
	```
db.sales.find().forEach(function(data) {
    db.sales.update({
        "_id": data._id,
        "land_square_feet": data.land_square_feet
    }, {
        "$set": {
            "land_square_feet": parseInt(data.land_square_feet)
        }
    });
})
```
