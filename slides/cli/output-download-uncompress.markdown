---
layout: slides
title: MTEC1002 - Output, Download, and Uncompress
---

<section markdown="block" class="title-slide">
# Output, Download, and Uncompress
{% include title-slide-footer.html %}
</section>

<section markdown="block">
### For Part 2 of This Lab...

We're going to download a file and uncompress it.  To do that, we'll learn a few commands related to:

* your terminal (displaying text, clearing the screen, stopping a command)
* downlading files from a url
* archiving and unarchiving files
* uncompressing files
</section>

<section markdown="block">
### echo

__Print to display &rarr;.__

Think: an _echo_ repeats what you say

{% highlight  bash %}
echo say this again
{% endhighlight %}
</section>


<section markdown="block">
### clear

__Clear screen &rarr;__

(obvs).  Bring prompt up to top so that it looks like you have a clear screen (you can still scroll up).

{% highlight  bash %}
clear
{% endhighlight %}
</section>

<section markdown="block">
### control-c (interrupt a command)

__Interrupt or stop a running command &rarr;__

Think _cancel_.  It's the control key __and__ the lowercase c key together.

[CONTROL] + [c]
</section>


<section markdown="block">
### curl

__Download a file and display file. &rarr;__

(Requires one argument, the URL of the page you'd like to display.)

{% highlight  bash %}
curl http://someurl.com
{% endhighlight %}

__Download a file and save it. &rarr;__

{% highlight  bash %}
curl -o filename.txt http://someurl.com
{% endhighlight %}

(the -o flag should be followed by the name of the file you want the URL to be saved as)
</section>

<section markdown="block">
## Don't forget the -o flag!  That's the name of the file that the URL is downloaded as!

curl __-o filename.txt__ http://someurl.com
</section>


<section markdown="block">
### unzip

__Uncompress a zip file. Works on files with a .zip extension. &rarr;__

{% highlight  bash %}
unzip filename1.zip
{% endhighlight %}

(Requires one argument - the name of the file you want to uncompress)
</section>

<section markdown="block">
### tar (archive)

__Archive directories and files. &rarr;__

Think: _T-archive_, _compress_

{% highlight bash %}
tar -cvf archivename.tar directory_to_compress
{% endhighlight %}

(tar requires one argument, the directory to compress... and the -f flag requires the name of the resulting archive)
</section>

<section markdown="block">
### tar (extract)

__Uncompress and unarchive a tarball. Works on files with a .tar.gz extension.  &rarr;__

Think: _t-archive_, _xtract_

{% highlight bash %}
tar -xvf archivename.tar.gz 
{% endhighlight %}

(exactly one argument, the name of the files to unarchive)
</section>

<section markdown="block">
### gzip

__Compress a file. &rarr;__

Think: _zip_

{% highlight bash %}
gzip filename.txt
{% endhighlight %}

(exactly one argument, the name of the files to compress)
</section>

<section markdown="block">
## tar and unzip are different!

</section>

<section markdown="block">
### tar vs unzip

* use tar -xvf myfile.tar.gz to uncompress .tar.gz files
* use unzip myfile.zip to uncompress .zip files
</section>

<section markdown="block">
### __Activity__: Drills!

Entering commands _flash cards_ x 5 (use set 2)

We'll do this together, then try downloading it yourself:

1. Download [drills.py](drills.py) to the home directory
2. Type python drills.py
3. When prompted for a number, enter 2
4. CTRL-C quits
</section>

<section markdown="block">
### __Lab__

[Output, Download and Uncompress](lab-02-part-02-output-download-uncompress.txt)

* Type each command (with arguments and flags) exactly
* Only press &lt;ENTER&gt; when instructed...
* &lt;TAB&gt;, &lt;ENTER&gt;, &lt;UP&gt;, &lt;DOWN&gt; are the actual keys!
* Paste answer or output below the dashed line (------------)

</section>

<section markdown="block">
### __Activity__: Drills!

Entering commands _flash cards_ x 3 (use set 12)

We'll do this together, then try downloading it yourself:

1. Download [drills.py](drills.py) to the home directory
2. Type python drills.py
3. When prompted for a number, enter 12
4. CTRL-C quits
</section>
