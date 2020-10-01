---
layout: slides
title: Entering Commands
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Commands

__Commands__ are __verbs__; they tell the computer to do something.
</section>

<section markdown="block">
## Entering a Command 

Once you have Terminal open, you should see a string of characters that ends with `$` (or `>`).  This is called the __command prompt__.  A __prompt__ looks something like this.

* {:.fragment} MacOS: `walsh:~ joe$`
* {:.fragment} Windows 10: `c:\Users\Joe>`
* {:.fragment} BTW, when we log in to a remote system running Linux...
	```
username@hostname:~$
```
{:.fragment}

Whenever you see a line in these slides prefixed with a $, that means that we're typing something in at the __prompt__.
{:.fragment}
</section>

<section markdown="block">
## Executing a Command

In terminal, type in the name of the command, and press &lt;ENTER&gt;.  __Let's try using ls, a command to list files and directories__ &rarr; 

* open Terminal (Applications &rarr; Utilities &rarr; Terminal
* type __ls__
* press &lt;ENTER&gt;

```
$ ls
```

In cmd.exe, use `dir`:

```
> dir
```
</section>

<section markdown="block">
## Where Are You?

👀 When you're at the prompt, __you're always running commands in the context of some location on your computer__.  

* This location corresponds to an actual directory.  
* You can change _where you are_ using various commands.  We'll see that later.
</section>

<section markdown="block">
## Let's Repeat That

## ⚠️ At the prompt, you're running commands in the context of some location (think folder/directory) on your computer ⚠️ 

</section>

<section markdown="block">
## What Was That Again? 

__When using the commandline...__ &rarr;

* {:.fragment} and you're at the prompt (`$`)
* {:.fragment} and you type in a command
* {:.fragment} you're doing so while you're in a particular folder/directory
* {:.fragment} __you're always _located_ somewhere on your file system__

</section>

<section markdown="block">
## Arguments

__Arguments__ are the thing or things that a command acts on; they're like __nouns__ (or more formally, __direct objects__).
</section>

<section markdown="block">
## Commands and Arguments

Some commands can optionally have __arguments__:  

* {:.fragment} they go after the command name
* {:.fragment} a command may potentially be able to take 0 or more arguments

__Try this, assuming you're in your home folder (list files in Desktop):__
{:.fragment}

```
$ ls Desktop
```
{:.fragment}

In cmd.exe
{:.fragment}

```
$ dir Desktop
```
{:.fragment}
</section>

<section markdown="block">
## Flags / Options

__Flags__ are like __adverbs__.  They specify how a command is run.

(sometimes they're also called _options_)
</section>

<section markdown="block">
## Commands and Flags

You can run a __command__ with __flags__; typically (but not always), these flags are optional...

* {:.fragment} they go after the command name, but usually before arguments
* {:.fragment} they are specified with either - or --
* {:.fragment} commands may have 0 or more flags.  
* {:.fragment} in cmd.exe, flags are specified with a forward slash `/`

__Try this (list all, including hidden, files in Desktop):&rarr;__
{:.fragment}

```
$ ls -a Desktop
```
{:.fragment}

In cmd.exe showing files in Downloads folder ordered by date and time, oldest first
{:.fragment}

```
> dir /O:D Downloads 
```
{:.fragment}
</section>

<section markdown="block">
## &lt;TAB&gt; Completion

You can use the &lt;TAB&gt; key to complete commands or file names.  __Try typing the following:&rarr;__

* ls Desk&lt;TAB&gt;
* __What happens? &rarr;__

The argument, Desktop, is automatically completed for you!  __Go ahead and run the command by pressing &lt;ENTER&gt; &rarr;__
{:.fragment}
</section>

<section markdown="block">
## &lt;TAB&gt;&lt;TAB&gt;

What if there are multiple matches?  __Type the letter l and then &lt;TAB&gt;. What happens? &rarr;__

Nothing.  Now try hitting &lt;TAB&gt; one more time.  __What happens? &rarr;__
{:.fragment}

All of the possible commands that start with the letter l are shown.
{:.fragment}
</section>

<section markdown="block">
## Next and Previous Commands

You can use the &lt;UP&gt; or &lt;DOWN&gt; keys to go through previous and next commands.  __Try pressing &lt;UP&gt; twice, and &lt;DOWN&gt; once.  What command is shown?__
{:.fragment}

```
$ ls Desktop
```
{:.fragment}
</section>

<section markdown="block">
## Errors

Type the letter l and press &lt;ENTER&gt;. 
{:.fragment}

```
$ l
```
{:.fragment}

__What happens? &rarr;__
{:.fragment}

```
-bash: l: command not found
```
{:.fragment}
</section>

<section markdown="block">
## More Errors

Type ls foo and press &lt;ENTER&gt;. 
{:.fragment}

```
$ ls foo
```
{:.fragment}

__What happens? &rarr;__
{:.fragment}

```
ls: foo: No such file or directory
```
{:.fragment}
</section>

<section markdown="block">
## Summary

* {:.fragment} what's the difference between an __argument__ and a __flag__?
	* {:.fragment} an argument is the thing ("noun") that a command acts on, while a flag specifies how a command should be run ("adverb")
* {:.fragment} what key do you press to autocomplete a directory or file name (or even a command)
	* `<TAB>`
* {:.fragment} what happens when you press `<TAB>` twice? 
	* auto complete *all* potential commands and directory / files
* {:.fragment} what do up a `<UP>` and `<DOWN>` arrows do?
	* show the next or previous command
* {:.fragment} __lastly, remember that commands are run in the context of the _directory that you're currently in_!__
</section>

