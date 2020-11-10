---
layout: slides
title: "Data Formats on the Web"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>


<section markdown="block">
## Markdown, HTML, XML, JSON

We've done _a lot_ of work with `csv` data, and it translates well to tabular data. However you'll find a lot of data on the web that is hierarchical: `html`, `xml`, and `json`. While simple `csv` files can be parsed by hand (or by the `csv` module or `pandas`!)...  

__You don't want to mess with `html`, `xml`, and `json` on your own. It's actually quite difficult to get exactly right.__ &rarr;
{:.fragment}

* {:.fragment} some liken it to dealing with Lovecraftian elder gods!
* {:.fragment} [check out the classic stack overflow answer](http://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags/1732454#1732454)
* {:.fragment} it also likely means you'll have to use lots of complicated regular expressions
* {:.fragment} [...and, of course, regular expressions: now you have two problems](http://blog.codinghorror.com/regular-expressions-now-you-have-two-problems/)

</section>

<section markdown="block">
## Trees!

__Data formats, such as `html` `xml`, and `json` are hierarchical / nested.__ Think of a tree:

```
<html>
<head></head>
<body><h1>hello</h1><p>world</p></body>
</html>
```
{:.fragment}

```
       html 
       / \
   head   body
          /  \
         h1   p
         |    |
     hello   world
```
{:.fragment}

</section>

<section markdown="block">
## So How Do We Even?

__Find someone that already went through the pain of doing it, and use their library__.

* {:.fragment} again, html is difficult to parse
	* data is contained within data
	* finding the start and end of a container is not trivial
* {:.fragment} find an html parser already built for you
* {:.fragment} for example you can use [beautiful soup 4](http://www.crummy.com/software/BeautifulSoup/bs4/doc/) to easily find elements within an html document using some simple methods
* {:.fragment} some other libraries for parsing html:
	* {:.fragment} [scrapy](https://scrapy.org/) - specialized for scraping data off of web-pages
	* {:.fragment} [requests-html](https://html.python-requests.org/) - simple api built by author of popular library, `requests`

</section>

<section markdown="block">
## HTML?

__Before looking at parsing HTML, it's worth revisiting some vocabulary__ &rarr;

An HTML document is composed of elements.
{:.fragment}

```
                an element
+---------------------------------------+
|                                       |
|                         text content  |
|                              |        |
<a href="http://cs.nyu.edu">click me!</a>
|   |                                   |
|   attribute                           |
|                             closing tag
opening tag
```
{:.fragment}


</section>

<section markdown="block">
## Beautiful Soup 4

Here's a quick demonstration of how BeautifulSoup works...

<pre><code data-trim contenteditable>
from bs4 import BeautifulSoup

dom = BeautifulSoup("""
&lt;html&gt;
&lt;body&gt;
&lt;h1&gt;foo&lt;/h1&gt;
&lt;p&gt;bar
&lt;h1 class='even-headier'&gt;baz&lt;/h1&gt;
&lt;/p&gt;
&lt;/body&gt;
&lt;/html&gt;
""", "lxml")
</code></pre>
<pre><code data-trim contenteditable>
print(dom.select('h1'))
print(dom.select('.even-headier'))
</code></pre>
</section>

<section markdown="block">
## Beautiful Soup 4 Installation / Usage

__To get started...__ &rarr;

1. {:.fragment} install the module:
    * use `pip3`, `conda`, PyCharm, etc. to install `beautifulsoup4`
2. {:.fragment} Then... the usual import
    * `from bs4 import BeautifulSoup`

This gives you a __constructor__ that you can use to create an object that represents an __html document__. Just pass an html string to it...
{:.fragment}

</section>

<section markdown="block">
## BeautifulSoup Constructor

__Note the 2nd argument determines what you'll use to _parse_ the html__ (html.parser should be fine) &rarr;

<pre><code data-trim contenteditable>
dom = BeautifulSoup("""
&lt;html&gt;
    &lt;body&gt;
        &lt;h1&gt;foo&lt;/h1&gt;
        &lt;p&gt;bar
            &lt;h1 class='even-headier'&gt;baz&lt;/h1&gt;
            &lt;a href='http://cs.nyu.edu'&gt;cs!&lt;/a&gt;
        &lt;/p&gt;
        &lt;a id='foo' href='http://nyu.edu'&gt;nyu!&lt;/a&gt;
    &lt;/body&gt;
&lt;/html&gt;
""", "html.parser")
</code></pre>


</section>

<section markdown="block">
## Beautiful Soup and CSS

__You can use CSS selectors to retrieve specific html elements... by using the `select` method!__

__Wait, what's a CSS selector?__ &rarr;
{:.fragment}

* {:.fragment} a CSS selector is a way of finding / choosing elements 
* {:.fragment} when used in conjunction with styling elements with CSS rules, it _"selects_ the elements to apply a rule to
* {:.fragment} for example: `h1 {color: red}`...
* {:.fragment} means: find all elements in the document that are `h1`; make them red
* {:.fragment} in BeautifulSoup, we can use just the selector part to find elements 

</section>

<section markdown="block">
## Example CSS Selectors

__Do you know any common CSS selectors?__ &rarr;

* {:.fragment} __class name__: `.foo` ... any element with a class attribute equal to foo (`<p class="foo">`)
* {:.fragment} __id__: `#bar` ... any element an id attribute equal to bar (`<p id="bar">`)
* {:.fragment} __tag name__: `p` ... any paragraph 
* {:.fragment} __descendent__: `h1 p` ... any paragraph contained within an h1, regardless of depth (`<h1><section><p></p></section></h1>`)
* {:.fragment} __direct descendent__: `h1 > p` ... any paragraph that's an immediate descendent / child of an h1 (`<h1><p></p></h1>`)

These can be combined to be more specific. For example: `h1 p.foo` selects any paragraph element with class name `foo` that is contained within an h1.
{:.fragment}
</section>

<section markdown="block">
##  Using Beautiful Soup's `select` and `select_one`

__Finally, let's get to working with the `select` method__ &rarr;

* {:.fragment} The `select` method takes a single argument: the css selector as a string.
* {:.fragment} It returns a list of matching HTML elements, with each element having its own methods or operators to:
	* {:.fragment} get the text content: `element.get_text()`
	* {:.fragment} get the value of an attribute: element.['attribute name']
* {:.fragment} `select_one` returns the first matching element



</section>

<section markdown="block">
## Select Examples 

__A few quick examples using `select`, indexing with attribute names, and using `get_text`__ &rarr;

<pre><code data-trim contenteditable>
# get the elements with class .even-headier
print(dom.select('.even-headier'))

# get all h1's ... show the text of the first one
print(dom.select('h1')[0].get_text())

# show the href attribute of the first link
print(dom.select('a')[0]['href'])
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Some Practice

__Assuming `dom` represents a parsed version of the example html document from the previous slides:__ &rarr;

1. {:.fragment} print the text content of the first element you find that is a link (an anchor / a) within a paragraph
	* {:.fragment} `print(dom.select('p > a')[0].get_text())`
2. {:.fragment} print the url (href) in the link with an id, foo
	* {:.fragment} `print(dom.select_one('#foo')['href'])`

</section>


<section markdown="block">
## JSON

Aaaand. Lastly, __JSON__. __What's JSON again?__ &rarr;

* {:.fragment} It's a data format that represents data such as objects, Arrays (think lists), numbers and strings.
* {:.fragment} objects are collections of name and value pairs
* {:.fragment} names are double quoted strings, and values can be other objects, Arrays, numbers and strings
* {:.fragment} `{"playername": "foo", "stats": {"points": 5, "health": 3}}`
* {:.fragment} __What python type does this remind you of?__ <span class="fragment">a python `dict`</span>

__⚠️ JSON is a data interchange format!  It must be parsed before it can be used as an object or `dict`__
{:.fragment}

</section>
<section markdown="block">
## Working with JSON

 __Use the <code>json</code> module to convert to and from Python dictionaries and JSON strings__ &rarr;

<pre><code data-trim contenteditable>
import json
# dumps <-- creates a string from a python dict... as json format
# loads <-- reads a string into a python dict (assuming string is json)

s = '{"first":"joe", "last":"versoza"}'
d = json.loads(s)
print(d)
</code></pre>
{:.fragment}

Remember to parse with `loads` first! Otherwise, you just have a string!
{:.fragment} 

<pre><code data-trim contenteditable>
s = '{"first":"joe", "last":"versoza"}'
print(s["first"]) # ERROR (not yet a dict)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Pandas and JSON

__You can also use `pandas` -- a module we'll look at later --  to work with `json`:__ &rarr;

To create a `DataFrame` from a `json` string:
{:.fragment}

<pre><code data-trim contenteditable>pd.read_json('[{"city": "Ithaca", "state": "NY"}, 
	{"city": "Atlanta", "state": "GA"}]')
</code></pre>
{:.fragment}

Keys are columns, but they can be adjusted using the `orient` keyword argument 
{:.fragment}

* {:.fragment} [check the docs for _sooo many options_](https://pandas.pydata.org/pandas-docs/stable/generated/pandas.read_json.html) 
* {:.fragment} (for example, `orient=split` will expect separate keys for `index`, `columns` and `data`)
</section>

{% comment %}
<section markdown="block">
## Nested JSON

__What do you think will happen here?__ &rarr;

<pre><code data-trim contenteditable>
s = '''
  [{"title": "Dune", 
    "author": {"first": "Frank", "last": "Herbert"}}, 
   {"title": "Handmaid\'s Tale", 
    "author": {"first": "Margaret", "last": "Atwood"}}]
'''
pd.read_json(s)
</code></pre>
{:.fragment}

<pre><code data-trim contenteditable>
                                    author            title
0    {'first': 'Frank', 'Last': 'Herbert'}             Dune
1  {'first': 'Margaret', 'last': 'Atwood'}  Handmaid's Tale
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Nested JSON Continued

__How do we _flatten_ the json?__ &rarr;

* {:.fragment} by hand (this. is. going. to. be. ugly.):
	<pre class="fragment"><code data-trim contenteditable>
[{'title': d['title'], 
  'first': d['author']['first'], 
  'last': d['author']['last']} for d in json.loads(s)]
</code></pre>
* {:.fragment} oh yeah, pandas can do that
	<pre class="fragment"><code data-trim contenteditable>
from pandas.io.json import json_normalize
json_normalize(json.loads(s))
</code></pre>
	<pre class="fragment"><code data-trim contenteditable>
# ✨
  author.first author.last            title
0        Frank     Herbert             Dune
1     Margaret      Atwood  Handmaid's Tale
</code></pre>
{:.fragment}

</section>
{% endcomment %}



