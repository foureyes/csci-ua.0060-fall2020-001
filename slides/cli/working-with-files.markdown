---
layout: slides
title: Working With Files
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

## {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## touch

__Create a new file or change the modified date of an existing file&rarr;.__

* think - record the last time you've _touched_ the file.
* takes one argument, the path of the file name that you're modifying/creating
* __if the file already exists__ touch changes the modified date &rarr;
* __if the file does not exist__ it creates it &rarr;


```
touch filename.txt
```
</section>

<section markdown="block">
## cp

__Copy file to a path&rarr;__

* think: _copy_ (obv!)
* requires two arguments - pathnames for both source and destination
* can take a flag, -r, to copy _recursively_

```
cp filename1.txt filename2.txt
```

In cmd.exe

```
copy filename1.txt filename2.txt
```

```
# use -r to copy recursively (for example, all nested directories and files)

cp -r dir1 dir2
```

</section>

<section markdown="block">
## mv

__Move file to a different location. &rarr;__

* think: _move_.
* requires two arguments - pathnames for both source and destination

```
# renaming 
mv filename1.txt filename2.txt

# moving
mv filename.txt dir
```
</section>

<section markdown="block">
## less

__Show the contents of a file with pagination. &rarr;__

* requires a single argument, the path to the file


```
less filename1.txt

# use <SPACE> to page down
# use <b> to page up
# use <UP>,<DOWN> to navigate by line
# use <q> to quit
# use </> to search
```
</section>

<section markdown="block">
## more

__Show the contents of a file with pagination. &rarr;__

* requires a single argument, the path to the file

```
more filename1.txt
```
</section>

<section markdown="block">
## cat

__Show all of the contents of a file &rarr;__

* requires a single argument, the path to the file

```
cat filename1.txt
```

In cmd.exe:

```
type filename.txt
```
</section>

<section markdown="block">
## head

__Show the contents of the start of a file. &rarr;__

* think __head is the beginning / top__ of the file 
* requires a single argument, the path to the file

```
head filename1.txt
```
</section>

<section markdown="block">
## tail

__Show the contents of the end of a file. &rarr;__

* think __tail is the end of the file__
* requires a single argument, the path to the file
* can be used with flags: -f (realtime) and -n (how many lines should be displayed?)


```
tail filename1.txt

# show changes realtime!
tail -f filename.txt

# display last 5 lines
tail -n5  filename.txt
```
</section>

<section markdown="block">
## rm

__Remove a file. &rarr;__

* think: _remove_
* requires a single argument, the path to the file
* has an optional flag, -r, for removing recursively
* has an optional flag, -f, for skipping confirmation

```
rm filename1.txt

# also... to remove everything recursively (and ignore
# confirmation)... use this (be careful with it!)

rm -rf filename1.txt
```

In cmd.exe, `del filename1.txt`
</section>
<section markdown="block">
## Wildcard Matching

* you can work on a set of files by using wildcard matching
* the \* (asterisk) represents _anything_
* so, \*.gif represents all files with a .gif extension
* you can use wildcard matching with some of the commands that we've seen

```
# copy all gifs into the archive folder
cp *.gif archive

# move all gifs into the archive folder
mv *.gif archive
```

</section>

<section markdown="block">
## wc

__Count the number of words or lines in a file. &rarr;__

* think: _word count_
* requires a single argument, the path to the file
* displays lines, words, bytes

```
# count the number of words in a file
wc filename.txt

# count the number of lines in a file
wc -l filename.txt
```

</section>
