---
layout: slides
title: "HTTP"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## http

__Protocol that dictates how computers communicate over the world wide web__

* {:.fragment} request / response protocol
* {:.fragment} text based (version 2, binary, but same semantics)
* {:.fragment} client sends request
* {:.fragment} server sends back response
* {:.fragment} covers: semantics, message format, server and client behavior, etc.
</section>


<section markdown="block">
## HTTP Request

```
GET /some/path HTTP/1.1
User-Agent: my amazing browser
Host: localhost:5000
```

```
POST /another/path HTTP/1.1
User-Agent: my amazing browser
Host: localhost:5000

optional body here
```
</section>


<section markdown="block">
##  HTTP Request Format

```
(the action that the 
client wants to perform)
  |
  |
[http request method] [path] [http version]
[header name]:[value]
[blank line]
[body]
\r\n <--- windows style new line
```
* each line in our request is separated by \r\n
* so for example for blank line and body:

```
\r\n
\r\n
body
```
</section>

<section markdown="block">
## Request Methods

__These methods, or _http verbs_  describe the desired action to be performed on a resource__ &rarr;

* GET - retrieving data / "resources"
* POST - adding 
* PUT - updating
* DELETE - deleting

[More details on mdn](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
</section>

<section markdown="block">
## How to Make Requests

__What are some clients that can make requests?__

* {:.fragment} browser
* {:.fragment} _some library_ (for example `urlib` in Python)
* {:.fragment} some commandline tools

</section>
<section markdown="block">
## The Browser

__How do we use the browser to make GET or POST requests__ &rarr;

* {:.fragment} to use GET
    * simply enter a url into url bar <-- always a GET
    * use a form that uses GET <-- like a search form (say google search)
    * we could use a browser extension to specify request method, (postman)
* {:.fragment} to use POST
    * find a form that uses POST <-- like home.nyu.edu
    * we could use a browser extension to specify request method, (postman)
</section>

<section markdown="block">
## Some Commandline Tools

__curl__

* `-i` - this tells curl to give us both the headers and the body
    * without it just the body
    * with `-I` ... we get just headers
* `curl -i -d ''  localhost:5000` - issues a POST (use -d flag, and then data after it) 
* `curl -i loclahost:5000` - issues a POST

__nc__

* `nc host port`
* type everything yourself

</section>


<section markdown="block">
## What Does a Client Receive from the Server?

We saw the request part of the protocol. __Now let's see what a response looks like__ 

* remember, the client makes the request
* the server sends back a response to the client
	* that response may include a body... such as... _what do you think?_
	* {:.fragment} html
	* {:.fragment} an image
	* {:.fragment} css
	* {:.fragment} etc.

</section>

<section markdown="block">
## HTTP Response

Example HTTP Response
```
HTTP/1.1 200 OK
Date: Wed, 06 Apr 2016 14:03:36 GMT
Server: Apache/2.2.15 (Red Hat)
Accept-Ranges: bytes
Content-Length: 163
Content-Type: text/html; charset=UTF-8
Set-Cookie: STATICSERVERID=s4; path=/

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html>
<body>response... </body>
</html>
```

</section>

<section markdown="block">
## Response Codes

* {:.fragment} 200 - OK (all 2xx are success)
* {:.fragment} 301, 302, etc. - various types of redirects (all 3xx are redirects)
* {:.fragment} 404 - PAGE NOT FOUND, 400 - BAD REQUEST (all 4xx ... basically means don't make this exact same request again... client error)
* {:.fragment} 500 - SERVER ERROR (all 5xx are server errors... but you can try again)
</section>
