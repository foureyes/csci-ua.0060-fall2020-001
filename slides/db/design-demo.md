---
layout: slides
title: "Database Design Demo"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Review Entities and Attributes

* {:.fragment} __Entity__
	* {:.fragment} a _thing_ that we store data about
* {:.fragment} __Attribute__
	* {:.fragment} data that describes an entity
</section>

<section markdown="block">
## Review Documenting Entities and Attributes

__Entity Relationship (ER) Diagrams__ &rarr;

* {:.fragment} Chen
* {:.fragment} Crow's Foot / IE

</section>

<section markdown="block">
## Chen

__Demo__ &rarr;

1. Entities in boxes
2. No attributes or attributes in circles
3. Relationships:
	* names in diamonds or (to read both ways) written adjacent to relationship line
	* either arrows or numbers to note cardinality

</section>


<section markdown="block">
## Crow's Feet / IE

__Demo__ &rarr;

1. Entities in boxes
2. Attributes listed in boxes
3. Relationships:
	* name adjacent to relationship line
	* `||` one and only one (mandatory)
	* `O|` zero or one (optional) 
	* `|<` one or many (mandatory)
	* `O<` zero or many (optional)

</section>

<section markdown="block">
## Review Database Design

__Creating a data model__ &rarr;

1. {:.fragment} conceptual model (_what is stored?_)
	* {:.fragment} entities, relationships
	* {:.fragment} maybe attributes
	* {:.fragment} DBMS / platform agnostic
2. {:.fragment} logical model (_also what?_)
	* {:.fragment} attributes and their types
	* {:.fragment} maybe unique identifiers (primary keys)
	* {:.fragment} DBMS / platform agnostic
3. {:.fragment} physical model (_how is it stored?_)
	* {:.fragment} more exact types
	* {:.fragment} constraints: not nullable, foreign key, etc.
	* {:.fragment} create with specific DBMS in mind
</section>
<section markdown="block">
## Design Album Review Site

In the next few slides... create a conceptual design and logical design for an album review site. For example:

* [Review #1](https://pitchfork.com/reviews/albums/future-juice-wrld-wrld-on-drugs/)
* [Review #2](https://pitchfork.com/reviews/albums/100-gecs-1000-gecs/)
</section>

<section markdown="block">
## Motivation for Conceptual Model 

1. entities
2. relationships
3. possibly attributes
4. not DBMS specific
5. high level 
</section>

<section markdown="block">
## Motivation for Logical Model 

1. attributes
2. types
3. unique identifiers
</section>

<section markdown="block">
## DDL

How to create DDL?

Is there an easier way?
</section>


