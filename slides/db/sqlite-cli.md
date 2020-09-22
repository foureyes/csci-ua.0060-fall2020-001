---
layout: slides
title: "Installation and Commandline Tool"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Installation

__We'll be using SQLite 3__, so you'll have to (maybe) install it... &rarr;

* {:.fragment} if you're on MacOS 🍎 or Linux 🐧, __good news__ 🙌 __SQLite 3 is already installed__
	* open `Terminal` or equivalent
	* type in `sqlite3`
* {:.fragment} if you're on windows
	1. go to the [downloads page for sqlite](https://www.sqlite.org/download.html)
	2. find the `.zip` file that starts with `sqlite-tools-win32-x86-....`
	3. download and __extract__ it into a folder of your choice
	4. double click on `sqlite3.exe` when you want to run it
</section>

<section markdown="block">
## `sqlite3`

__Commandline client: `sqlite3`__ &rarr;


</section>

<section markdown="block">
## `sqlite3` Commands 

__The SQLite commandline tool has [_a lot_ of commands!](https://sqlite.org/cli.html)__ These are some ones we'll use frequently

* `.help`
* `.open file_name` - open an existing database file [docs](https://sqlite.org/cli.html#double_click_startup_on_windows)
* `.databases` - list databases
* `.read file_name` - execute file
* `.save file_name` - if working with in-memory database, save to file
* `.mode mode_name` - output format (`column`, `line`, `csv`, etc.)
* `.header on` - display header
* `.nullvalue some_value` - how should nulls be displayed (default is blank)
</section>

<section markdown="block">
## Controlling Output Format

The default output format is pipe separated values. __If you'd like something closer to a table:__ &rarr;

* {:.fragment} `.mode column` - align values into columns
* {:.fragment} `.header on` - show headers
* {:.fragment} `.nullvalue NULL` - show nulls as `NULL`

Note that you can save these configurations by creating a file called `.sqliterc` in your home folder... and adding each command one line at a time
{:.fragment}

</section>

<section markdown="block">
## Creating a Database

SQLite starts off with an <span class="hl">in-memory</span> database. __If you'd like a persistent database saved on disk:__ &rarr;

* `sqlite3 name_of_db.db` - start sqlite with on-disk database
* `.open /path/to/name_of_db.db` - while in sqlite, open an existing database
* `.save /path/to/name_of_db.db` - if working with in-memory database, save to file
</section>

