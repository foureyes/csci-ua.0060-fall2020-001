---
layout: slides
title: "MySQL Intro, Commandline"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## MySQL

__MySQL is a relational database management system. It features__ &rarr;

* {:.fragment} client - server based access
* {:.fragment} role based access control (users can have roles that determine what they can and annot do)
* {:.fragment} a rich set of built-in functions for working with string, date and time manipulation, etc.
* {:.fragment} a wide variety of data types

</section>
<section markdown="block">
## MySQL == MariaDB?


MariaDB is _fork_ of MySQL. __Um, what's a fork__ 🍴?

In the context of software, it's a copy of a program/library that is independently developed from the original so that it becomes its own distinct version of the original software.
{:.fragment}

* {:.fragment} for the purpose of this class, MySQL and MariaDB are functionally equivalent 
* {:.fragment} [in common usage, MariaDB can be used to seamlessly replace MySQL (as claimed by the MariaDB documentation](https://mariadb.com/kb/en/mariadb-vs-mysql-compatibility/)
* {:.fragment} consequently, a lot of what you'll find online regarding mysql is _likely_ relevant to mariadb
* {:.fragment} we'll <span class="hl">actually be using MariaDB</span>

</section>

<section markdown="block">
## MySQL vs MariaDB

__So what makes MySQL and MariaDB different?__ &rarr;

* the intention of MariaDB is to remain free (as in the ability to study, modify, etc.) and open source.
* MySQL is owned by Oracle 
* while a community version of MySQL is available under a similar license to MariaDB, this can change in the future

</section>

<section markdown="block">
## Types

* [numeric types](https://mariadb.com/kb/en/numeric-data-type-overview/)
	* note that there are multiple types for ints and floats
	* most of these are based on the size (for example, `TINYINT` is 1 byte)
* [string types](https://mariadb.com/kb/en/string-data-types/)
	* we'll use `varchar(num_characters)` and `text` (but text can't be part of a primary key)
	* note that `LIKE` is case insensitive!
* [dates and times](https://mariadb.com/kb/en/date-and-time-data-types/)

</section>


<section markdown="block">
## Courant, Client Server

* client - mysql commandline client on i6.cims.nyu.edu
* server - mariadb on warehouse.cims.nyu.edu

[see the docs on database services](https://cims.nyu.edu/webapps/content/systems/userservices/databases)
</section>

<section markdown="block">
## Creating a Database


1. make a database; use netid and password to login
	[database manager](https://cims.nyu.edu/webapps/databases)
2. hit reset password if you don't know / have a database password
3. log in to i6 with i6 account [see the docs for more details on i6 accounts, password resets, etc.](https://cims.nyu.edu/webapps/content/systems/resources/i6)
	```
ssh your_net_id@i6.cims.nyu.edu
```
4. connect to database
	```
mysql -h warehouse.cims.nyu.edu -u YOUR_USERNAME -p
```

[The full instructions can be found on this page](https://cims.nyu.edu/webapps/content/systems/userservices/databases)

</section>

<section markdown="block">
## Managing Databases and Tables

The MySQL commandline client (which you can use with either a MySQL or MariaDB server) supports the following commands:

```
CREATE DATABASE [DATABASE_NAME]; *
SHOW DATABASES;
USE [DATABASE_NAME];
SHOW TABLES;
SHOW CREATE TABLE [TABLE_NAME];
DESCRIBE [TABLE_NAME];
```

\* can only be done through on initial database setup through the [database management tool](https://cims.nyu.edu/webapps/databases) or through [web admin](https://cims.nyu.edu/phpMyAdmin/) on Courant's systems.
</section>

