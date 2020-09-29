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
## MySQL vs MariaDB

</section>

<section markdown="block">
## Client Server

</section>

<section markdown="block">
## Courant, Client Server

client - mysql commandline client on i6.cims.nyu.edu
server - mariadb on warehouse.cims.nyu.edu

</section>
<section markdown="block">
## Creating a Database


1. make a database; use netid and password to login
	[database manager](https://cims.nyu.edu/webapps/databases)
2. hit reset password if you don't know / have a database password
3. log in to i6 with i6 account
	```
ssh your_net_id@i6.cims.nyu.edu
```
4. connect to database
	```
mysql -h warehouse.cims.nyu.edu -u YOUR_USERNAME -p
```

https://cims.nyu.edu/webapps/content/systems/userservices/databases

</section>

<section markdown="block">
## MySQL Client Commands

```
show databases;
use DATABASE_NAME;
show tables;
describe TABLE_NAME;
```

</section>
