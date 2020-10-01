---
layout: slides
title: Commandline
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>
<section markdown="block" class="title-slide">
## What's a Command Line Interface (CLI)

It's a way of __interacting with your computer__ &rarr;

* {:.fragment} you give it __instructions by typing a command__ 
* {:.fragment} a __command__ is some sequence of characters
* {:.fragment} after you press &lt;ENTER&gt;, the computer does _stuff_!
* {:.fragment} you usually (not always, tho!) get some feedback or output
</section>

<section markdown="block">
## Motivation

__[This is hard! Let's go shopping!](http://snowclones.org/2008/02/19/x-is-hard-let%E2%80%99s-go-shopping/) _Why_ are we learning this? &rarr;__

<div class="incremental" markdown="block">
* {:.fragment} many tools require use of the command line
	* {:.fragment} the sqlite3 is started using commandline
	* {:.fragment} we'll be working with mysql on a remote server that has no graphical user interface
* {:.fragment} server administration
* {:.fragment} automation
* {:.fragment} experience different platforms / tools
* {:.fragment} lookin' [1337](http://en.wikipedia.org/wiki/Leet)
</div>
</section>

<section markdown="block">
## Terminal, cmd.exe, PowerShell

__Both MaxOS and Windows 10 have commandline interfaces (Windows even having two!)__ &rarr;

* {:.fragment} On MacOS, we access the command line interface using an application called __Terminal__. 
	* {:.fragment} You can probably find it under Applications &rarr; Utilities. &rarr; (or use spotlight to search for it)
* {:.fragment} On Windows 10, you can use __cmd.exe__ or __Powershell__
	* {:.fragment} press the windows key to search
	* {:.fragment} alternatively, download "Windows Terminal" from the Microsoft Store
	* {:.fragment} you can also run a Linux in a virtual machine

</section>

<section markdown="block">
## Commandline vs GUI

* {:.fragment} this is basically an alternative interface to your computer
* {:.fragment} you can do a lot of things in the commandline that you can do by clicking through folders, windows, and applications with your trackpad/mouse
* {:.fragment} it's text based input and output 
	* {:.fragment} depending on OS and terminal application, you may also get sound
	* {:.fragment} there may also be bindings to launch graphical programs from the commandline 
</section>

<section markdown="block">
## __Demo__: A Quick Tour

__How do you?__ &rarr;

* create, copy, edit, and list files 
	* {:.fragment} MacOS: finder, TextEditor... in Windows 10: File Explorer, notepad)
* see processes, stop processes 
	* {:.fragment} (in MacOS: Activity Monitor... in Windows 10: Task Manager)
* find files 
	* {:.fragment} (in MacOS: finder, spotlight... in Windows 10: File Explorer, Windows Search)

__Welllllll... you can do all of that through the terminal!__
{:.fragment}
</section>

<section markdown="block">
## Focus on "Unix" - Like Commandline

__I'll be focusing on commands that work with MacOS and Linux because the remote server we're using is Linux based__

* this means the commands I show you will be applicable directly to your work when we use MySQL on a remote server
* I'll discuss cmd.exe/DOS equivalents briefly as well

</section>

{% comment %}
cat ... type
ls ... dir
ls -ltr ... dir /O:D
ps ... tasklist
{% endcomment %}
