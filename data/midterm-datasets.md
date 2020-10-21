---
layout: homework
title: "datasets"
---

# Datasets for Midterm


## 1. [donations.sql](midterm/donations.sql) ⬇️

This dataset is based off of the [Donations to Not-for-Profit Organizations Affiliated with Elected Officials](https://data.cityofnewyork.us/City-Government/Donations-to-Not-for-Profit-Organizations-Affiliat/dx8z-6nev). It contains data regarding donors, the organization they donated to, and the elected official in New York City that is associated with that organization. The data has been processed from the original csv so that it is contained in multiple tables in a MySQL/MariaDB database. You will have to use joins to query across these tables. Use the following steps to get started:

1. Create a new database called `midterm` (which will be `YOURUSERNAME_midterm` when connecting to MariaDB) through the [database management tool](https://cims.nyu.edu/webapps/databases) (use your i6 password to logged in, sent to you via pdf)
2. Upload [donations.sql](midterm/donations.sql) using `scp` or winSCP
3. Login to i6:
	```ssh YOURUSERNAME@i6.cims.nyu.edu
```
4. Import the data into your new database using the mysql client:
	```mysql -hwarehouse.cims.nyu.edu -p -u YOURDBUSERNAME YOURUSERNAME_midterm < donations.sql
```
5. Connect to the MariaDB server and try some queries
	```mysql -hwarehouse.cims.nyu.edu -p -u YOURDBUSERNAME YOURUSERNAME_midterm
```

* this data shows donations __to organizations__
* every organization is associated with an elected official; two organizations can be associated with the same elected official
* note that there are two kinds of donation amounts: amount and value_in_kind; you can think this as the donor donating either a monetary amount or an item that has some value... so each donation should have one of these fields filled, while the other would be null

UPDATE 10/21: 

Foreign keys were not included in original `.sql` file above. You can run these queries when you're in MariaDB and `use`ing your `username_midterm` database, but it is not required. It is adequate to just read over where the foreign keys are being placed:

```
ALTER TABLE organization ADD FOREIGN KEY (elected_official_id)
    REFERENCES elected_official(elected_official_id);

ALTER TABLE donation ADD FOREIGN KEY (donor_id)
    REFERENCES donor(donor_id);

ALTER TABLE donation ADD FOREIGN KEY (organization_id)
    REFERENCES organization(organization_id);

ALTER TABLE donor_location ADD FOREIGN KEY (donor_id)
    REFERENCES donor(donor_id);

ALTER TABLE donor_location ADD FOREIGN KEY (location_id)
    REFERENCES location(location_id)
```

## 2. [steam-200k.csv](midterm/steam-200k.csv) ⬇️

This dataset contains data about user behaviors on Steam, a gaming platform / website / community. It has been modified to include headers. From the [documentation](https://www.kaggle.com/tamber/steam-video-games):

"This dataset is a list of user behaviors, with columns: user-id, game-title, behavior-name, value. The behaviors included are 'purchase' and 'play'. The value indicates the degree to which the behavior was performed - in the case of 'purchase' the value is always 1, and in the case of 'play' the value represents the number of hours the user has played the game."

The column names are based on the names above, with `-` switched to underscore `_`.

Use the following steps to work with this dataset:

1. Download [steam-200k.csv](midterm/steam-200k.csv) into a directory that is either:
	* easy for you to write an absolute path
	* where you're going to be running `sqlite3`
2. Run sqlite3...
3. Switch mode to csv: `.mode csv`
3. Bring in the data into a table called `user_behaviors` Use `.import PATH_TO_FILE TABLENAME`
	* if you ran sqlite where you downloaded your file, `.import steam-200k.csv user_behaviors`
	* you can also use an absolute path (`/Users/yourusername/Desktop/steam-200k.csv` or `"c:\\Users\\yourusername\\Downloads\\steam-200k.csv"`)
	* if you're on windows, you'll have to quote the value and escape the backslashes
4. Switch back to column mode: `.mode column`
