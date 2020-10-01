---
layout: slides
title: File System
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Navigating the File System

<aside>In Three Parts</aside>

* Review definitions
* A little bit about pathnames
* How to get around using the commandline
</section>

<section markdown="block">
## Let's Look at OSX's Directory Structure
</section>

<section markdown="block">
## First, Some Definitions

What's a __directory__? &rarr;

<div class="incremental" markdown="block">
* a __directory__ is a cataloging structure on a file system that references other files (and directories)
* we can think of it as _a thing that contains files_ (it's a little more complex than that, though)
* they're usually used to organize files
* (technically, on OSX, a directory is a file itself! it's a file that lists the names of items on a disk or other piece of storage media)
</div>
</section>

<section markdown="block">
## More Definitions

What's a __folder__? &rarr;

<div class="incremental" markdown="block">
* it's essentially the same thing as a directory
* but it's the graphical representation (like the little folder icons in finder)
</div>
</section>

<section markdown="block">
## Even More Definitions

What's a __pathname__? &rarr;

* {:.fragment} a __pathname__ is the general form of the name of a file or directory; it specifies a unique location in a file system
* {:.fragment} for example, you can use a graphical tool like finder or file explorer to locate a file or folder, to follow a particular path - __let's check this out__ &rarr;. 
</section>

<section markdown="block">
## Path Separator

A __path separator__ is a character that's used to join together each directory in a pathname that contains nested directories (for example, Desktop was located under Users and username...  there was a character that separated each directory).  

__What character represents the path separator on MacOS and Linux?__ &rarr;

* {:.fragment} it's a __forward slash__, __/__
* {:.fragment} (sometimes just called __slash__ when referencing directories) 
* {:.fragment} on windows, it's the backslash `\`
</section>


<section markdown="block">
## Absolute vs Relative Paths

* __absolute paths__ are paths expressed as starting from root
	* example: /Users/username/Desktop
* __relative paths__ are paths expressed as relative from the current working directory
	* example (if you're starting from /Users/username): Desktop

We'll look at this a little bit more in the next class.
</section>

<section markdown="block">
## Windows Paths

__There's a few things to remember when working with paths in windows:__

* root is typically `c:\`
* use backslash as a path separator
* in some cases (such as when in the sqlite3 commandline tool):
	* __in SQLite__ single quoting the entire path `> .read 'c:\Users\Joe\create.sql'` is necessary
	* or optionally, _escaping the backslashes_ will work too: `c:\\Users\\Joe\\create.sql`

</section>

<section markdown="block">
## Some Special Paths

There are shortcuts to represent specific paths:

* __~ (tilde)__ is _your_ home directory
* __/ (slash)__ is root directory

The following paths are relative to the directory _that you're in_:

* __. (dot)__ is the current directory
* __.. (dot dot)__ is the parent directory
* __../.. (dot dot slash dot dot)__ is the parent of the parent directory

</section>

<section markdown="block">
## Now That We Know About Pathnames, We Can Navigate the File System Using the Commandline! (EXCITED YET!?)

<aside>Let's learn some commands</aside>
</section>

<section markdown="block">
## ls

__List all of the files (and directories) in the current directory. &rarr;__ 

Think: _list_. 
{:.fragment}

```
$ ls
mydropbox  projects  win-home
```
{:.fragment}

In cmd.exe, use `dir`:
{:.fragment}

```
dir
```
{:.fragment}
</section>

<section markdown="block">
## ls pathname

__List all of the files (and directories) in the directory specified by the pathname. &rarr;__ 

```
~$ ls projects
ait-0480  archived  db-60  py-0003  repo-closer-cli
```
{:.fragment}
</section>

<section markdown="block">
## ls -l

__The -l flag gives detailed output about each file in the directory &rarr;__ 

Think: _l for long version_.
{:.fragment}

```
$ ls -l
total 8
drwxr-xr-x 2 joe joe 4096 Aug  7 20:38 mydropbox
drwxr-xr-x 7 joe joe 4096 Sep 27 18:31 projects
lrwxrwxrwx 1 joe joe   17 Oct  1 07:44 win-home -> /mnt/c/Users/Joe/
```
{:.fragment}
</section>

<section markdown="block">
## ls -a

__The -a flag lists all files, including hidden ones &rarr;__ 

Think: _a for all_.
{:.fragment}

```
$ ls -a
.              .bashrc  .gitconfig  
```
{:.fragment}
</section>

<section markdown="block">
## ls -al

__You can combine flags by placing them one after the other.  This outputs a detailed list of all files. &rarr;__ 

```
$ ls -al
drwxr-xr-x 16 joe  joe   4096 Oct  1 07:44 .
drwxr-xr-x  3 root root  4096 Aug  7 20:08 ..
-rw-------  1 joe  joe  25097 Oct  1 07:42 .bash_history
-rw-r--r--  1 joe  joe    220 Aug  7 20:08 .bash_logout
-rw-r--r--  1 joe  joe   3826 Aug  7 21:14 .bashrc
```
{:.fragment}
</section>

<section markdown="block">
## ls -t

__The -t flag sorts by time. &rarr;__ 

```
$ ls -lt
total 8
lrwxrwxrwx 1 joe joe   17 Oct  1 07:44 win-home -> /mnt/c/Users/Joe/
drwxr-xr-x 7 joe joe 4096 Sep 27 18:31 projects
drwxr-xr-x 2 joe joe 4096 Aug  7 20:38 mydropbox
```
{:.fragment}
</section>

<section markdown="block">
## Combining Flags and Arguments

You can use multiple flags... and combine them with an argument as well. __What do you think this does?__ &rarr;

```
$ ls -alt projects
```

It lists all of the files in project (if there's a projects folder present in the directory you're in), ordered by time, including hidden files and showing extra information.
{:.fragment}

```
$ ls -alt projects/
total 28
drwxr-xr-x  7 joe joe 4096 Oct  1 08:38 .
-rw-r--r--  1 joe joe    0 Oct  1 08:38 .hidden
drwxr-xr-x 16 joe joe 4096 Oct  1 07:44 ..
drwxr-xr-x  4 joe joe 4096 Oct  1 07:06 archived
drwxr-xr-x  6 joe joe 4096 Sep 29 12:07 db-60
drwxr-xr-x  4 joe joe 4096 Sep 27 18:31 py-0003
drwxr-xr-x  6 joe joe 4096 Sep 21 01:51 ait-0480
drwxr-xr-x  4 joe joe 4096 Sep 20 10:02 repo-closer-cli
```
{:.fragment}

</section>

<section markdown="block">
## pwd

__Shows the directory that you're currently in.__ &rarr;

Think: _print working directory_.
{:.fragment}

```
$ pwd
/home/joe
```
{:.fragment}
</section>

<section markdown="block">
## hostname

__Prints out the name of your computer &rarr;__

```
$ hostname
```
</section>

<section markdown="block">
## mkdir

__Creates a directory with the name of the argument supplied. &rarr;__

Think: _make directory_
{:.fragment}

One argument is _required_: the name of the directory to create.
{:.fragment}

```
$ mkdir my_animated_gifs
```
{:.fragment}
</section>

<section markdown="block">
## mkdir dir1/dir2/dir3

__This attempts to create 3 directories nested within eachother. &rarr;__

Forward slash (/) shows that a directory is within the directory preceding it.  dir1/dir2 means dir2 in dir1.
{:.fragment}

However, nested directories don't work as an argument for mkdir. (Unless...)
{:.fragment}

```
$ mkdir dir1/dir2
mkdir: dir1: No such file or directory
```
{:.fragment}
</section>

<section markdown="block">
## mkdir -p dir1/dir2

__The -p flag allows you to create multiple directories nested within eachother. &rarr;__


```
mkdir -p dir1/dir2
$ ls
dir1
$ ls dir1
dir2
```
{:.fragment}
</section>

<section markdown="block">
## cd

__Changes current directory to the directory specified in the argument. &rarr;__

Think: _change directory_
{:.fragment}

One argument is _required_: the name of the directory to change to.
{:.fragment}

```
$ cd Desktop
$ pwd
/Users/joe/Desktop
```
{:.fragment}
</section>

<section markdown="block">
## A Reminder About Special Paths

* . (dot) is current directory
* .. (dot dot) is parent directory
* ../.. (dot dot slash dot dot) is parent of parent directory
* / (slash) is root directory
* ~ (tilde) is home directory

</section>

<section markdown="block">
## Using Special Paths 

Let's use special paths with cd &rarr;

```
$ pwd
/Users/joe
$ cd ../
$ pwd
/Users
$ ls
Shared	joe
$ cd ~
$ pwd
/Users/joe
$ cd /
$ pwd
/
```
</section>

<section markdown="block">
## Back to Directory 

__Pass - (dash) as an argument to cd to go back to the directory you just changed from. &rarr;__

```
$ pwd
/Users/joe
$ cd /tmp
$ pwd
/tmp
$ cd -
/Users/joe
```
</section>

<section markdown="block">
## rmdir

__Removes a directory with the name of the argument supplied. &rarr;__

Think: _remove directory_
{:.fragment}

One argument is _required_: the name of the directory to remove.
{:.fragment}

```
$ mkdir foo
$ ls
foo
$ rmdir foo
$ ls
```
{:.fragment}
</section>

<section markdown="block">
## Summary

__What do the following commands and paths do or reprsent?__ &rarr;

* {:.fragment} `pwd`
* {:.fragment} `hostname`
* {:.fragment} `mkdir`
* {:.fragment} `cd`
* {:.fragment} `  . (dot)`
* {:.fragment} `  ..  (dot dot)`
* {:.fragment} `  ../..  (dot dot slash dot dot) `
* {:.fragment} `  /  (slash)`
* {:.fragment} `  ~  (tilde)`
* {:.fragment} `  -  (dash)`
* {:.fragment} `ls`
* {:.fragment} `rmdir`

</section>



