---
layout: slides
title: MTEC1002 - Permissions, Dates and Time, Shell Scripting
---

<section markdown="block" class="title-slide">
# Permissions, Editing, Date, Time, Shell Scripting
{% include title-slide-footer.html %}
</section>

<section markdown="block">
### permissions

(what command and options did I use to get this output?)

{% highlight bash %}
drwx------+ 18 joe  staff    612 Aug 10  2012 Music
drwx------+ 14 joe  staff    476 Jan 12 10:16 Pictures
drwxr-xr-x+  6 joe  staff    204 Apr 11  2012 Public
drwxr-xr-x+  6 joe  staff    204 Apr 11  2012 Sites
drwxr-xr-x   5 joe  staff    170 Aug 10  2012 VirtualBox VMs
{% endhighlight %}
</section>

<section markdown="block">
### permissions continued

I can get permissions for a single file by using ls -l on a single file...

{% highlight bash %}
$ ls -l filename.txt 
-rw-r--r--  1 joe  wheel  0 Feb 13 17:05 filename.txt
{% endhighlight %}
</section>

<section markdown="block">
### permissions continued
* u - __u__ser permissions
* g - __g__roup permssions
* o - w__o__rld permsissions

{% highlight bash %}
drwxrwxrwx
  |  |  |
 rwx |  | 
  u rwx |
     g rwx
        o
{% endhighlight %}
</section>

<section markdown="block">
### permissions continued

* r - read
* w - write
* x - execute

{% highlight bash %}
drwxrwxrwx
{% endhighlight %}
</section>



<section markdown="block">
### chmod

change permissions

{% highlight bash %}
chmod [user, group or world] [plus or minus] [read, write or execute] [filename.sh]
# allow user to execute
chmod u+x filename.sh
# prevent world from writing
chmod o-w filename.txt
{% endhighlight %}
</section>

<section markdown="block">
### chown

change owner and group

{% highlight bash %}
chown joe:joe filename.txt
{% endhighlight %}
</section>

<section markdown="block">
### nano

start a command line txt editor!

{% highlight bash %}
nano filename.txt

# <CTRL-X> exit
# <CTRL-O> save
# <CTRL-K> cut
# <CTRL-U> paste
# <CTRL-W> search
{% endhighlight %}
</section>

<section markdown="block">
### date

show the current date and time

{% highlight bash %}
date
{% endhighlight %}
</section>

<section markdown="block">
### cal

show the current calendar month
{% highlight bash %}
cal

# for year...
cal 2013
{% endhighlight %}
</section>

<section markdown="block">
### shell scripts

* must be user executable
* can be run using ./shell_script_name.sh
</section>



<section markdown="block">
### __Activity__: Drills!

Entering commands _flash cards_ x 3 (use set 4)

We'll do this together, then try downloading it yourself:

1. Download [drills.py](drills.py) to the home directory
2. Type python drills.py
3. When prompted for a number, enter 4
4. CTRL-C quits
</section>

<section markdown="block">
### __Lab__

[Permissions, Editing, Date, Time](lab-03-part-03-permissions-editing-date-time.txt)

* Type each command (with arguments and flags) exactly
* Only press &lt;ENTER&gt; when instructed...
* &lt;TAB&gt;, &lt;ENTER&gt;, &lt;UP&gt;, &lt;DOWN&gt; are the actual keys!
* Paste answer or output below the dashed line (------------)

</section>

<section markdown="block">
### __Activity__: Drills!

Entering commands _flash cards_ x 3 (use set 1234)

We'll do this together, then try downloading it yourself:

1. Download [drills.py](drills.py) to the home directory
2. Type python drills.py
3. When prompted for a number, enter 1234
4. CTRL-C quits
</section>
