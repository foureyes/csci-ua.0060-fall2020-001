---
layout: slides
title: Working on a Remote Server
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## A Server 🐧

__Um. What _even is a server_?__ &rarr;

* {:.fragment} it's just a computer
* {:.fragment} that offers some sort of _service_ of course! what kind of services, tho? &rarr;
	* {:.fragment} sharing files: __file server__
	* {:.fragment} serving web pages: __web server__
	* {:.fragment} hosts multiplayer games: __game server__
	* {:.fragment} or, u no, access to data in a database: __database server__
	* {:.fragment} etc.
</section>

<section markdown="block">
## Do One Thing and Do It Well

__Servers typically do just one _thing_!__ &rarr;

* {:.fragment} that is, all other functionality is removed aside from the _actual_ service
* {:.fragment} so usually, __no graphical user interface__ 🚫 💻
* {:.fragment} note that a server may look like a single computer, but it may actually be:
	* {:.fragment} just one service of many on a single computer
	* {:.fragment} or a service that's distributed on many computers!
	* {:.fragment} (other permutations exist too, such as servers in various configurations of containers and virtual machines)

</section>

<section markdown="block">
## Client

__Ok... so we know what a server is. What's a _client_?__ &rarr;

* {:.fragment} a <span class="hl">client</span> is the _thing_ (application / program / etc.) consuming the service provided from a server
* {:.fragment} __what are some examples of clients and the service they consume?__ &rarr;
	* {:.fragment} Firefox, Safari, Edge, Chrome - request resources from a web server
	* {:.fragment} FileZilla, CyberDuck, sftp and ftp commandline clients - access files on an ftp / file server
	* {:.fragment} git commandline client, GitHub Desktop, Git Kraken - access a remote git repository

</section>

<section markdown="block">
## Client Server

1. {:.fragment} a <span class="hl">server</span> may _serve_ multiple <span class="hl">clients</span>
2. {:.fragment} typically, this interaction is over a network...  
3. {:.fragment} the client and server are usually on different "computers"

(note... a server and client interaction can be on the same computer, such as running a web server on your laptop and using a browser to connect to it)
{:.fragment}
</section>

<section markdown="block">
## Accessing Remote Servers

__Some servers offer remote access for administration and simple file manipulation. This can be done through__ &rarr;

* {:.fragment} ssh - issue commands to a remote server a shell / commandline 
	* {:.fragment} on windows, use [putty](https://www.putty.org/)
	* {:.fragment} on MacOS or Linux, use commandline (terminal.app or terminal emulator of your choice) and the `ssh` command
		* `ssh yourusername@hostname`
		* you'll be promted for a password
* scp / [winscp](https://winscp.net/eng/index.php) - copy files to a remote server
* graphical sftp clients such as [CyberDuck](https://cyberduck.io/) or [FileZilla](https://filezilla-project.org/) - allows transfer of files to and from an sftp server
</section>

<section markdown="block">
## Demo

## Let's Try `ssh`, scp, and sftp! &rarr;
</section>
