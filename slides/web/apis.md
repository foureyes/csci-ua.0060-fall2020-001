---
layout: slides
title: "Making Web Requests, Using APIs"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Web Primer

__A quick review from our previous class__... let's talk about:  &rarr; 

* {:.fragment} client / server
	* {:.fragment} common clients
	* {:.fragment} request and response
* {:.fragment} http request
	* {:.fragment} GET/POST, other methods
	* {:.fragment} what does an actual request look like?
* {:.fragment} http response
	* {:.fragment} status 
	* {:.fragment} body and possible format / type of body
	* {:.fragment} what does an actual response look like?
</section>

<section markdown="block">
## URL 

__What's a URL?__ &rarr;

* {:.fragment}  URL is like an _address_ for a resource on the web
* {:.fragment} think of it as a way of identifying or locating a web page, image, etc.

</section>

<section markdown="block">
## Parts of a URL

A URL is composed of several parts; __what are they?__ &rarr;

* {:.fragment} __protocol__: how to retrieve resource, `http`, `https`
* {:.fragment} __domain__: the name of a computer / server / service on the web, 'foo.bar.baz'
* {:.fragment} __path__: the location of the resource to retrieve from the server, `/foo/bar.baz`
* {:.fragment} __query string__: name and value pairs associated with URL, `?foo=bar`
* {:.fragment} there are other parts port, fragment, etc.
* {:.fragment} can you label the parts of this url? `https://www.google.com/search?q=bubble+tea`
</section>

<section markdown="block">
## Getting Data from a URL

Using `urllib` to __retrieve a resource from a url__

* {:.fragment} `urllib` is built-in to Python3; no need to install
* {:.fragment} to use, import the library, `urllib.request` and call `urlopen` ([more details in the docs too](https://docs.python.org/3/library/urllib.html)):
    <pre><code data-trim contenteditable>
import urllib.request
with urllib.request.urlopen('http://cs.nyu.edu') as response:
   res = response.read()
</code></pre>
	* {:.fragment} `urlopen` takes a single argument, the `url` to send a __GET__ request to
	* {:.fragment} it returns an object representing an http response ([HTTPResponse](https://docs.python.org/3/library/http.client.html#httpresponse-objects))
	* {:.fragment} use [`read`](https://docs.python.org/3/library/http.client.html#http.client.HTTPResponse.read) to retrieve the body of the response (as bytes)

</section>
<section markdown="block">
## Now What?

__Depending on the kind of resource you retrieved (was it html, json, etc.?), you can extract data from it! How?__ &rarr;

* {:.fragment} now we can parse `res` / `BeautifulSoup` or `json`! 
* {:.fragment} in some use cases (eg sending a POST request), you'll have to write some boilerplate code; [check out the extensive list of examples](https://docs.python.org/3/library/urllib.request.html#examples)
* {:.fragment} note that the return value of `read` is a `bytes` object (kind of like a list of integers)
	* {:.fragment} `read` does not assume encoding
	* {:.fragment} if you want a string, you can call `decode("utf-8")` (we did something like this, remember?)
	* {:.fragment} `BeautifulSoup` can be called with a string or bytes
* {:.fragment} you can use additional methods, like `code` (status code) and `headers` 
</section>

<section markdown="block">
## Another Option: `requests`

Using the `requests` module to __retrieve data from a url__ &rarr;

* {:.fragment} `conda`, `easy_install`, or `pip install` `requests` first...
* {:.fragment} Then:
    <pre><code data-trim contenteditable>
import requests
res = requests.get("http://cs.nyu.edu")
print(res.status_code) # http response status code (you want a 200)
print(res.text) # the contents / body of the response
</code></pre>

</section>

<section markdown="block">
## APIs

__API__  stands for __Application Programmer Interface__: basically a set of tools that help you develop an application.

In the context of the web, some sites offer an __API__ to access their data. For example &rarr;

* [tumblr api](https://www.tumblr.com/docs/en/api/v2)
* [nytimes api](https://developer.nytimes.com/)
{:.fragment}

Note that apis usually require some sort of authentication, and that authentication can be as a simple as a unique key assigned to your program
{:.fragment}

</section>

<section markdown="block">
## Using APIs

__The general steps for using an API are__ &rarr;

1. {:.fragment} read documentation
2. {:.fragment} determine if authentication is required, and if so, how is it implemented 
	* usually request a token, a string that gives you access
	* and use that token in your requests
3. {:.fragment} make an http request to the appropriate url to retrieve data
4. {:.fragment} parse the data (usually json, but you'll also see xml... and even plain html!)
</section>


<section markdown="block">
## tumblr + `urllib` Example

Let's try `urllib` with the [tumblr api](https://www.tumblr.com/docs/en/api/v2). Let's read the docs and figure out how we can get some cat 🐈 pics!

__Some setup (your probably don't want to publish your API key as in the working example below; use a config file as we did with databases)__ &rarr;

The tumblr API responds with json, and we'll need to make an http request, so:
{:.fragment}

<pre><code data-trim contenteditable>
import urllib.request, json
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## Reading Docs, Creating a URL


__Now let's formulate a url based on the documentation for__ &rarr;

* [making a request](https://www.tumblr.com/docs/en/api/v2#uri-structure)
* [retrieving posts based on tags](https://www.tumblr.com/docs/en/api/v2#tagged--get-posts-with-tag) 
* [authentication](https://www.tumblr.com/docs/en/api/v2#authentication) 
* pay attention to the parts of the url we'll need, such as 
	* {:.fragment} __domain__
	* {:.fragment} __path__
	* {:.fragment} ...and __query string__


</section>
<section markdown="block">
## URL for Posts Tagged with "CAT"

__Now that we've read the docs, let's put together our url manually and in code__ &rarr;

* {:.fragment} __domain__ is `api.tumblr.com`
* {:.fragment} __path__ is is `/v2/tagged`
* {:.fragment} the __query string__ should contain `api_key` and `tag`
* {:.fragment} first, create the url manually and try it in your browser or use the commandline tool, `curl` (if you're on MacOS or Linux): `curl -I YOUR_URL`
* {:.fragment} then... translate this to code

<pre><code data-trim contenteditable>
tag = 'cat'
api_key = 'XBu4Lke6Cyh2UrLFIZW0jIo79sUT8EwtruJduMAknEUNhccNwY'
url = 'http://api.tumblr.com/v2/tagged?api_key={api_key}&tag={tag}' 
</code></pre>
{:.fragment}
</section>

<section markdown="block">
## Making the Request, Parsing the Response

__Now that we have the URL, how should be make the http request, convert to a string and parse?__ &rarr;

<pre><code data-trim contenteditable>
response = urllib.request.urlopen(url)
body = response.read()
response_text = body.decode('utf-8')
data = json.loads(response)
</code></pre>
{:.fragment}

* {:.fragment} note the chain of methods after `urlopen` to `read` the response as `bytes` and immediately `decode` as `utf-8`
* {:.fragment} because the response is JSON, use the `json` module to convert from a string of text to a `dict`

</section>

<section markdown="block">
## JSON Response Format

__What does our response look like? How do we find out?__ &rarr;

* {:.fragment} [read the docs](https://www.tumblr.com/docs/en/api/v2#response-format)
* {:.fragment} or make a single request with your browser or curl

Use this to inform how to retrieve data from the response. __Let's try to__ &rarr;
{:.fragment}

1. {:.fragment} only retrieve the photo posts
2. {:.fragment} with number of tags more than 2
3. {:.fragment} and only get the url of the images
4. {:.fragment} to create and print out a list of image urls



</section>

<section markdown="block">
## Making a Plan

__Let's figure out the keys and indexes necessary to retrieve the urls of photo posts with more than two tags__


```
{
    "meta":{"status":200,"msg":"OK"},
    "response":[
        {
           "type":"photo",
           "tags":["ben sears","design","illustration","cat","dog"],
           "photos":[
               {
                   "caption":"",
                   "original_size":{"url":"https://64.media.tumblr.com/c3e6fe2d3ffd6429cb37c96a83fd792c/2b3  c7295327a39c3-02/s640x960/955d2f1f2a43f5a8de58f6a87f543a617610d6b2.jpg","width":600,"height":800}
               }
            ]
       }
    ]
}
```
{:.fragment}

</section>

<section markdown="block">
## Making a Plan Continued

__How do we find photo posts with more than 2 tags based on the example doc above?__ &rarr;

Note that you can view a formatted version of json through browser extensions or through a text editor that autoformats json for you. For example [JSONView for Chrome](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc/related?hl=en)
{:.fragment}

* {:.fragment} everything is contained in list within the key, `"response"`
* {:.fragment} each post has the following keys: `type` (we're looking for `photo`), `tags` (a list of tags), and `photos` (a list of photos)
* {:.fragment} in turn, each photo has `original_size` which contains a `url`
</section>

<section markdown="block">
## Processing the Data

__Finally, our code!__ &rarr;

<pre><code data-trim contenteditable>
posts = data['response']
for post in posts:
    if post['type'] == 'photo':
        tags = post['tags']
        photo = post['photos'][0]
        number_of_tags = len(tags)
        if number_of_tags > 2:
            print(tags)
            print(photo['original_size']['url'] + "\n\n")
</code></pre>
</section>

<section markdown="block">
## All Together 

__Here's a version with everything together (along with some shorcuts)__ &rarr;

<pre><code data-trim contenteditable>
import urllib.request, json
tag = 'cat'
api_key = 'XBu4Lke6Cyh2UrLFIZW0jIo79sUT8EwtruJduMAknEUNhccNwY'
domain = 'api.tumblr.com'
url = f'http://{domain}/v2/tagged?api_key={api_key}&tag={tag}'
print(url)
res = urllib.request.urlopen(url).read().decode('utf-8')
posts = json.loads(res)['response']
extract_url = lambda p: p['photos'][0]['original_size']['url']
filter_posts =  lambda p: p['type'] == "photo" and len(p['tags']) > 2
filtered = [extract_url(p) for p in posts if filter_posts(p)]
print(filtered)
</code></pre>
{:.fragment}

</section>

<section markdown="block">
## So Much Work; Can't Someone Else Do This for Me?

__Of course, we can also just use a client that abstracts away all of the details__ &rarr;

Most popular APIs already have some pre-built module that simplifies usage. For example, the tumblr API has:

* {:.fragment} [pytumblr](https://github.com/tumblr/pytumblr)
* {:.fragment} [support for other languages, such as Java, PHP, etc.](https://www.tumblr.com/docs/en/api/v2#official-tumblr-api-client-libraries)
* {:.fragment} prefer using official clients at first rather than writing your own

</section>
<section markdown="block">
## Simple NYT Search + `requests`

__Now let's try `requests`... (use `.get`, `text`, and `json`)__ &rarr;

<pre><code data-trim contenteditable>
import requests
res = requests.get('https://api.nytimes.com/svc/search/v2/articlesearch.json?q=TODO&api-key=TODO');

data = res.json()
docs = data['response']['docs']
for doc in docs:
    print(doc['headline']['main'])
    print(docs[0].keys())
    print(len(docs))
</code></pre>
{:.fragment}

</section>


<section markdown="block">
## Tools That Combine Requests and Scraping


__[scrapy](https://scrapy.org/) - if you want _industrial_ strength screen scraping, this it the tool to use! ... some highlights include__
{:.fragment}

* {:.fragment} "requests are scheduled and processed asynchronously" (⚡️_fast_)
* {:.fragment} but you can also throttle / reduce number of concurrent connections
* {:.fragment} _built_ for making reusable web crawlers!

__[requests-html](https://html.python-requests.org/) - built by the same person that wrote `requests`__
{:.fragment}

* {:.fragment} simple api that plays nicely with `requests`
* {:.fragment} supports rendering of `javascript` page elements! 



</section>
