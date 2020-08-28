---
layout: homework
title: "Homework #1"
---

To be posted

{% comment %}
Chonky

Write a function that takes a list and creates a new list composed of chunks

Chonky with function as parameter

Покемон
Write a function that takes a string and a dictionary of characters...

Write a program that asks the user for a mapping

Write a simple class 

BitList
{% endcomment %}
{% comment %}

1. simple plain python exercises
	* chunk / chonkie list items
	* get code points for each character
	* get character for list of code points
	* transliteration using dictionary
	Покемон
	https://en.wikipedia.org/wiki/Scientific_transliteration_of_Cyrillic
	https://www.google.com/search?q=pokemon+in+cyrillic&rlz=1C1CHBF_enUS913US913&oq=pokemon+in+cyrillic&aqs=chrome..69i57j33l2.4450j0j7&sourceid=chrome&ie=UTF-8
	https://programminghistorian.org/en/lessons/transliterating#what-is-transliteration-and-for-whom-is-it-useful
	* tuples
	* sets
	* given these two authors and there works, here's a piece of text, who is it most likely written by?  Kilgariff’s Chi-Squared
		* https://programminghistorian.org/en/lessons/introduction-to-stylometry-with-python#introduction
	* linked list?
2. simple class
Matrix Class	
3. bits module
bits modules

how to read bits from a file: https://stackoverflow.com/questions/10689748/how-to-read-bits-from-a-file
bitstring: https://bitstring.readthedocs.io/en/latest/walkthrough.html
from string
decode based on bits without using bytes.bit
ba = BitList("0b00001010")
ba = BitList("0x00001010")
ba = BitList.from_ints(0, 0, 0, 0, 1, 0, 1, 0)
note re: staticmethod... https://stackoverflow.com/questions/43587044/do-we-really-need-staticmethod-decorator-in-python-to-declare-static-method
https://www.programiz.com/article/python-self-why
static vs class - class method implicit class is passed in (like implicit self when calling instance method)

class, function or callable https://treyhunner.com/2019/04/is-it-a-class-or-a-function-its-a-callable/
ba.decode('utf8')
ba.decode('utf16')
ba.decode('utf32')
ba.as_list
ba.as_byte_list
str(ba) # default as utf8
throw exceptions


cache with dictionary


removing tags
https://programminghistorian.org/en/lessons/from-html-to-list-of-words-2#the-striptags-routine
{% endcomment %}
