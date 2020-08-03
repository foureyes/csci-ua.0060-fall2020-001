---
layout: slides
title: "Python Data Types"
---
<section markdown="block" class="intro-slide">
# {{ page.title }}

## {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Types, Values

</section>

<section markdown="block">
## Types

__What are some types that you know?__ &rarr;

* {:.fragment} `int`
* {:.fragment} `float`
* {:.fragment} `str`
* {:.fragment} `list`
* {:.fragment} `dict`

Maybe also...
{:.fragment}

* {:.fragment} `set`
* {:.fragment} `tuple`

</section>


<section markdown="block">
##  Binary, Bits, and Bytes

__What are the possible values that a bit can hold?__ &rarr;

<div class="incremental" markdown="block">

0 and 1

__How many bits are in a byte?__ &rarr;

8

__What is 00001111 in decimal?__ &rarr;

15

__What is 2 in binary _ _ _ _ _ _ _ _ ?__ &rarr;

00000010

</div>
</section>

<section markdown="block">
##  Values and Types
</section>

<section markdown="block">
##  What are Values?

* __values__ are just data
	* it can be stored in a variable 
	* it can be computed in an expression
	* it can't be _evaluated_ further (2 + 3 is not a value, because it can be evaluated further)
* some examples of values:
	* -123456
	* "a string is a value"
	* 1.00000001 
	* True, False
{:.fragment}
</section>

<section markdown="block">
##  Literals

The representation of a bare value in code is sometimes called a __literal__.

* "a string " a __string literal__
* 254 - an __integer literal__
* False - a __bool literal__
</section>

<section markdown="block">
##  Values can be Classified by Data Type

A __data type__ is a set of values.  The type of a value determines how it can be used in expressions.  Sometimes __data type__ is also referred to as just __type__... or __class__.  __Name as many types as you can.__ &rarr;

1. {:.fragment} __str__ (string) - "yup, a string"
2. {:.fragment} __bool__ (boolean value) - True
3. {:.fragment} __int__ (integer) - 12
4. {:.fragment} __float__ (floating point) - 12.121212
5. {:.fragment} {:.fragment} compound types, such as __range__ (an arithmetic sequence of numbers), __list__, and __dict__
6. {:.fragment} and maybe even __tuple__ and __set__

</section>

<section markdown="block">
##  Strings, Integers and Floating Point Numbers
</section>

<section markdown="block">
##  Strings

__What's a string?__ &rarr;

* {:.fragment} a __string__ is a sequence of characters (any characters).
* {:.fragment} including spaces and punctuation
	* and by spaces, I mean spaces, tabs, newlines, etc
	* for example " " is a string!
	* so is "" (this, however, is an _empty_ string)
* {:.fragment} are __delimited__ by quotation marks - must __start and end__ with quotes!
* {:.fragment} (btw, a __delimiter__ is just a character or characters that marks a boundary... or distinguishes a value from other values)
* {:.fragment} for example `"foo"`, `'bar'`, and `"""baz"""` are all strings
</section>


<section markdown="block">
##  Unbalanced Quotes

__I'm sure you know by now what happens if you have an extra quote or a missing quote. &rarr;__ 


```
>>> "oops " I quoted again"
SyntaxError: invalid syntax
```
{:.fragment}

* if you don't have matching start and end quotes (__unbalanced quotes__)
* if you forget to close your quotes (you have a start quote, but no end)
* ... you'll also get a syntax error
{:.fragment}
</div>
</section>

<section markdown="block">
##  There Are Three Ways to Quote Strings

__What are the three ways to quote strings?__

1. {:.fragment} double quotes - `"`
2. {:.fragment} single quotes - `'`
3. {:.fragment} triple double quotes __for multiline strings__ - `"""`

```
"double quoted string"
'single quoted string'
"""more than
```
</section>

<section markdown="block">
##  When Would You Use One Over the Other?

* single or double quotes allow you to put in single or double quotes into a string without needing to __escape__ them
	* "I'm"
	* 'use a " to delimit a string'
* triple double quotes allow you to span multiple lines (you can't span multiple lines with single or double quotes)
{:.fragment}
</section>

<section markdown="block">
##  String Operators

__What are some operators that work with strings?__ &rarr;

* __+__ (concatenation) adds two strings together
	* both arguments must be strings
	* if an operand is not a string, you can convert it to one using __str__
		```
"lucky number " + 9 # syntax error
"lucky number " + str(9) # 🆗
```
* You can also use the __*__ operator to multiply a string by an int (note that this will give an error if you use a float instead of an int!)
	```
s = "aardvark " * 3
print(s) #  prints out: aardvark aardvark aardvark  
```
</section>


<section markdown="block">
##  String Operators at a Glance

These are the string operators that we learned (note - they all return strings, but the types of arguments may vary depending on operator).  __What were they again? &rarr;__

1. {:.fragment} __+__ - concatenation - takes two strings (error otherwise) &rarr; returns a string
2. {:.fragment} __*__ - multiplication - takes a string and int (error otherwise, even if it's another numeric type), repeats the string that number of times &rarr; returns a string
3. {:.fragment} __%__ - formatting - takes a string on the left and a comma separated list of values on the right
</section>

<section markdown="block">
##   One Last Thing Regarding Strings (Escape!)
__What do we do if we need a character that has special meaning in a string, such as a single or double quote?__ &rarr;

* {:.fragment} we can use the backslash character before the special character
* {:.fragment} for quotes, we can use mixed quotes (embed single quotes in a double quoted string)!
* {:.fragment} we can also create newlines using __\n__

<pre><code data-trim contenteditable>
print("escaping using \"backslash\"")
print("single  quotes ''''") 
print("""some "double quotes"""")
</code></pre>
</div>

</section>

<section markdown="block">
##  BTW, Does Anyone Remember Comments?

__What are the two ways that we can write in a comment?__
{:.fragment}


* prefixed with the # token (either before code or on the same line after code
* __or__ surrounded by triple double quotes as a bare string literal
{:.fragment}

These are both comments: &rarr;
{:.fragment}

<pre><code data-trim contenteditable>
counter = 5     # this is a comment that's on the same line as code
"""
this one
is a comment too
"""
</code></pre>
{:.fragment}

</section>




<section markdown="block">
##  ints and floats

Integers and floating point numbers are both numeric types.

* ints and floats are just numbers 
* (no quotes needed... though a decimal point will automatically make a value into a float)
*  __however - Don't use commas!  They don't mean what you expect.__ &rarr;
* sometimes ints and floats can be expressed with scientific notation (though we won't cover this in the exam)
</section>

<section markdown="block">
##  Integers

__int__ - integers

* whole number - negative or positive
* examples: 1751, -95
* "unlimited" (arbitrarily high)
</section>

<section markdown="block">
##  Floating Point Numbers

__float__  - floating point numbers

* real number - contains decimal point
* 10.00, 491.545532111
* may overflow
* small and large numbers expressed in scientific notation (though we won't cover this in the exam)
</section>

<section markdown="block">
##  Operators
* addition, multiplication and subtraction: __+__, __\*__, and __-__
* division: __/__ (results in a float even if two integers - ex 10 / 2 &rarr; 5.0)
* integer division: __//__ (next integer to the left - ex -23 // 3 &rarr; -8)
* modulo: __%__ (ex 10 % 7 &rarr; 3)
* exponentiation: __**__ (ex 2 ** 3 &rarr; 8)
</section>

<section markdown="block">
##  Numeric Operator Precedence

__What order are these numeric operators evaluated in? &rarr;__

<div class="incremental" markdown="block">
* as you would expect - follows PEMDAS 
* (parentheses, exponentiation, multiplication, division, addition, subtraciton)
* __what would (5 + 15) * 2 ** 2 + 20 result in? &rarr;__

{% highlight pycon %}
>>> (5 + 15) * 2 ** 2 + 20
100
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Numeric Operators and Type Compatibility

* most of these numeric operators will only work with numeric types (float, int)
* if you try to add, subtract, divide with an numeric type and a string, you will get an error
* always use __int()__ or __float()__ to convert your string to a numeric type if you're going to do calculations 
</section>

<section markdown="block">
##  Results of the Following Operations

__What are the resulting values and types after evaluating the following expressions? &rarr;__

* 28 / 7
* 28 // 10
* 28 % 10
* 28 / "7"

<div class="incremental" markdown="block">
* 4.0 - float
* 2 - int
* 8 - int
* Error
</div>
</section>

<section markdown="block">
##  Implementing a Formula

An obvious use case for these numeric operations is implementing a formula.  

For example: __find the hypotenuse of a right triangle using this formula... h = &radic;(x&sup2; + y&sup2;), where x is 8 and y is 6 &rarr;__

<div class="incremental" markdown="block">
{% highlight python %}
import math
x, y = 8, 6
#  you can also use (some value) ** 0.5
h = math.sqrt(x ** 2 + y ** 2)
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  A Shortcut

There's a shortcut to add a value to an existing variable (the same exists for subtraction as well).  __What is the syntactic sugar that we use to increment and decrement variables?__ &rarr;

<div class="incremental" markdown="block">
__-=__ and __+=__ are shortcuts for decrementing or incrementing a variable...

{% highlight python %}
a = 0

#  increment a by some value, just set the variable, a, equal to a + 5
a = a + 5

#  or... alternatively, use a shortcut +=:
a += 5
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Bools and Range Objects
</section>

<section markdown="block">
##  The bool Type
Python has a __bool__ type to represent Boolean values.  __Tell me everything you know about the bool type.__ &rarr;

<div class="incremental" markdown="block">
* True or False
* note the uppercase 'T' and 'F'
* just like other values, can be assigned to variables
* bools can be combined into expressions using __logical operators__
</div>
</section>

<section markdown="block">
##  Range Objects
One last type / class / kind of data that we've encountered was a __range__ object. __Describe what a range object is.__ &rarr;

<div class="incremental" markdown="block">
* __range__ objects represent an arithmetic sequence.
* they are __iterable__ and can be used to drive a for loop
* they are created using the __range__ function
</div>
</section>

<section markdown="block">
## A Guessing Game
<aside>After evaluation, what type is it?</aside>

1. __1__
2. __1.0__
3. __"1"__
4. __"""1.0"""__
5. __1.111__
6. __'1,111'__
7. __True__
8. __range(5)__
9. __1 + 5__
10. __"hello" + " my friends!!!"__

</section>

<section markdown="block">
## A Guessing Game (Answers)
<aside>After evaluation, what type is it?</aside>

1. __1__ - int
2. __1.0__ - float
3. __"1"__ - str
4. __"""1.0"""__ - str
5. __1.111__ - float
6. __'1,111'__ - str
7. __True__ - bool
8. __range(5)__ - range object
9. __1 + 5__ - int
10. __"hello" + " my friends!!!"__

</section>


<section markdown="block">
##  Built-in Functions
</section>

<section markdown="block">
##  Conversion Functions

For each type that we learned, there's a function with the same name that will create a value of that type.  They __always__ return their _associated type_!

* __int()__
* __str()__
* __float()__
* __bool()__

__range()__ is special in that it can take 1, 2 or 3 parameters to create a range object.

</section>

<section markdown="block">
##  Conversion Functions Continued

* note that __int()__ and __float()__ will only accept int and float _"like"_ values... "5" will be converted (even with spaces), but "five" will cause an error
* these can be used to avoid errors when using numeric or string operators 
{% highlight python %}
num = 99
print(str(num) + " red balloons")
{% endhighlight %}
* remember - you don't have to convert if your value is already the type you're converting to
{% highlight python %}
num = "99" # no need to convert
print(num + " red balloons")
{% endhighlight %}

</section>

<section markdown="block">
##  Other Built-In Functions

__Name some built-in functions!__ &rarr;

<div class="incremental" markdown="block">
* __print__ - outputs value to screen; returns nothing
* __input__ - prompts user for input; returns a str
* __type__ - returns the type of the value passed in; returns a type object
* __round__ - rounds a number; returns an int (when called with one argument) ...(we used this in a homework)
* __abs__ - absolute value; returns a numeric type
* obv, all of the conversion functions
</div>
</section>

<section markdown="block">
##  A Word About input

* it takes __one argument__... which is what gets displayed to the user (the prompt)
* the program will wait until the user provides input
* input returns a string that represents the user's input
* even if the input looks numeric (say 234)
* __it still returns a string__ (in the previous case "234")
</section>

<section markdown="block">
##  Variables and Variable Naming
</section>

<section markdown="block">
##  Variables

* __variable__ - name that refers to a value
* this terminology is important; very specific... __name__ and __value__
* we can now use that name instead of the explicit value
* the equals sign, __=__ is the __assignment token__ or __assignment operator__ that we use to bind a name to a value
	* name on left
	* value on right

{% highlight python %}
some_variable_name = "a value"
{% endhighlight %}

</section>

<section markdown="block">
##  Assignment vs Equality

Don't confuse the assignment operator with the equality operator! __What's the difference between the two?__ &rarr;

<div class="incremental" markdown="block">
{% highlight pycon %}
#  one equal sign is assignment
a = 1  

#  two equal signs mean test for equality
a == 1
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Reassignment / Rebinding

* you can reassign or rebind
* __let's see that in action__ &rarr;

{% highlight pycon %}
>>> a = 23
>>> a
23
>>> a = "foo"
{% endhighlight %}
</section>

<section markdown="block">
##  While We're on the Subject... Multiple Assignment

You can assign multiple variables in one line.

{% highlight pycon %}
>>> a, b = 50, 60
>>> a
50
>>> b
60
{% endhighlight %}
</section>


<section markdown="block">
##  Naming Variables
* you can make them as long as you want... though I suppose it could crash your computer
* names can only consist of numbers, letters and/or underscores
* the first character has to be a letter or an underscore
* __case sensitive__ - case matters
* the name can't be a keyword or reserved word
</section>

<section markdown="block">
##  Am I a Valid Name?

__Are these valid variable names? &rarr;__

* _foo
* 1_foo
* foo
* 1foo
* $foo
* foo$
</section>

<section markdown="block">
##  Am I a Valid Name (Answers)?

__Are these valid variable names? &rarr;__

* _foo - yes
* 1_foo - no
* foo - yes
* 1foo - no
* $foo - no
* foo$ - no
</section>


<section markdown="block">
##  Comparison Operators, Boolean Operators
</section>

<section markdown="block">
##  Comparison Operators

__Name six comparison operators?&rarr;__

<div class="incremental" markdown="block"> 
* __==__ - equals (can be called logical equivalence or equality operator)
* __!=__ - not equal
* __>__ - greater than
* __<__ - less than
* __>=__ - greater than / equal
* __<=__ - less than / equal
</div>
</section>

<section markdown="block">
##  Comparison Operators Continued
* again - these operators always return a bool
* these operators do what you would expect 
	* __==__ - returns True if both sides are equal &rarr;
	* __!=__ - returns True if both sides are not equal &rarr;
	* __>__, __<__, __>=__, __<=__ - returns True if value on the left is greater than, less than, greater than / equal, or less than equal to the value on the right &rarr;
* remember that the equal sign is always second for these operators &gt;=, &lt;=
</section>

<section markdown="block">
##  Comparison Operators and Different Types
* objects of different types, except different numeric types, are never equal
	* equals (__==__) will always return False for different types &rarr;
	* not equals (__!=__) will always return True for different types &rarr;
* the __<__, __<=__, __>__ and __>=__ operators... 
	* will raise a TypeError if the objects are of different types that cannot be compared &rarr;
	* will happily compare numeric types (for example comparing floats and ints works as you'd expect)! &rarr;
</section>

<section markdown="block">
##  What are Logical Operators?

__Logical Operators are operators that combine Boolean values.__  

* always return another Boolean value.  
* can be used to create more complex Boolean expressions. 
</section>

<section markdown="block">
##   Three Logical Operators:

__Name 3 logical operators, how many operands they take, and what operands they need to return True.__ &rarr;

<div class="incremental" markdown="block">
1. __and__ - 
	* takes two operands, one on each side 
	* to return True, both sides of the operator must evaluate to True &rarr;
2. __or__ - 
	* takes two operands, one on each side
	* to return True,at least one side of the operator must evaluate to True &rarr;
3. __not__ - 
	* only takes one operand to the right
	* to return True, the original value on the right must evaluate to False &rarr;
	* two nots cancel eachother out (fun!) &rarr;
</div>
</section>

<section markdown="block">
##   Logical Operators _in Action_
{% highlight pycon %}
>>> True and False
False
>>> True and True
True
>>> True or False
True
>>> not True
False
>>> not not True
True
{% endhighlight %}
</section>

<section markdown="block">
##  Truth Table - AND

__and__ takes two operands.  Each operand can be True or False (or will evaluate to True or False!).  

__Can you guess how many possible combinations ther are for these two operands?__  __What will the Truth Table look like?__ &rarr;

<div class="incremental" markdown="block"> 
{% highlight python %}
"""
(using p and q to represent the operands
...and t and f for true and false)
 p | q | p and q
----------------
 f | f | f
 f | t | f
 t | f | f
 t | t | t
"""
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Truth Table - OR

Let's fill out a truth table for __or__! &rarr;

<div class="incremental" markdown="block"> 
{% highlight python %}
"""
(using p and q to represent the operands
...and t and f for true and false)
 p | q | p or q
----------------
 f | f | f
 f | t | t
 t | f | t
 t | t | t
"""
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  How About Something More Complicated?

Let's fill out a truth table for __p and not q and r__! &rarr;

<div class="incremental" markdown="block"> 
{% highlight python %}
"""
(using p and q to represent the operands
...and t and f for true and false)
 p | q | r | p and not q and r
-----------------------------
 t | t | t | f
 t | t | f | f
 t | f | t | t
 t | f | f | f
 f | t | t | f
 f | t | f | f
 f | f | t | f
 f | f | f | f
"""
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Let's Evaluate Some Simple Boolean Expressions

* True and False &rarr;
* True and not False &rarr;
* True or False &rarr;
* True or not False &rarr;
* False or False &rarr;
* not False and not False &rarr;

</section>

<section markdown="block">
##  Chaining Boolean, Comparison, and Other Operators
You can chain together operators to make complex Boolean expressions!  

* Boolean expressions can involve Boolean, comparison, and other operators
* they can be arbitrarily complex!  (don't do that)

__What do you think this evaluates to?__ &rarr;
{% highlight python %}
-10 ** 2 <= -100 or "foo" == "bar" and 100 >= 100
{% endhighlight %}

<div class="incremental" markdown="block"> 
{% highlight python %}
True
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Order of Operations / Operator Precedence

[A summary can be found in the official documentation for Python 3]( http://docs.python.org/py3k/reference/expressions.html#summary), but here's the short version:

* parentheses are evaluated first (obv)
* numeric / string operations (in turn, are also ordered)
* comparison operations (==, !=, >, <, >=, >=)
* not
* and
* or
</section>

<section markdown="block">
##  Conditionals
</section>

<section markdown="block">
##  Anatomy of an If Statement

__Write an if statement testing if a and b are _not_ equal.  If they're not equal, print the value of a and b twice.__ &rarr;
{% highlight python %}
a, b = "foo", "bar"
{% endhighlight %}

<div class="incremental" markdown="block">
* begin with keyword __if__
* condition
* colon - ends the condition / marks that a block of code is about to come up
* if + condition + colon usually is considered the _if-statement header_
* body of if statement ends when indentation goes back one level
* blank lines don't count as ending a block of code!
</div>
</section>

<section markdown="block">
##  Let's See That Again
<aside>Now With More Blank Lines</aside>

{% highlight python %}
a, b = "foo", "bar"
if a != b:
	# totally ok?  yes!
	# but why?
	# perhaps when done more reasonably, readability
	print a
	print a


	print b

	print b
{% endhighlight %}
</section>

<section markdown="block">
##  Oh Yeah, Else What?

We can use __else__ to execute code if the original condition was not met

* go back one level of indentation to mark that the previous code block has ended
* keyword __else__
* body - indented, body ends when indentation goes back one level
* not required, obvs
</section>

<section markdown="block">
##  What About Multiple Chained Conditions?
What if __else__ is not fine-grained enough?  For example, how about a program that asks for cake and handles a yes, no, or anything other than...

{% highlight python %}
"""
Do you want cake?
> yes
Here, have some cake.

Do you want cake?
> no
No cake for you.

Do you want cake?
> blearghhh
I do not understand.
"""
{% endhighlight %}
</section>

<section markdown="block">
##  Consecutive Ifs
__One way to do it is consecutive if statements...__ &rarr;

<div class="incremental" markdown="block">
{% highlight python %}
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")
if answer == 'no':
        print("No cake for you.")
if answer != 'yes' and answer != 'no':
        print("I do not understand.")
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Else If (elif)

We can use __elif__ to chain a series of conditions, where only one path of code will be executed

* if statement like usual
* go back one level of indentation to mark that the previous code block has ended
* keyword __elif__
* condition
* colon
* body - indented, body ends when indentation goes back one level
* not required obv
* even if more than one true, only the first true executes!
* can add an else at the end
</section>

<section markdown="block">
##  elif Example
<aside>Let's have some more cake...</aside>
__How would we redo the cake exercise with elif?__ &rarr;

<div class="incremental" markdown="block">
{% highlight python %}
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")
elif answer == 'no':
        print("No cake for you.")
else:
        print("I do not understand.")
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  How to Order Conditions

* if more than one condition in a series of elif's is true 
	* only the first true condition is executed!
	* other are skipped, including else
* ordering conditions so that the broadest ones are evaluated last may help avoid this issue
* be careful of conditions that never get evaluated 
	* an above condition may already account for it
	* here's an example...
</section>

<section markdown="block">
##  How to Order Conditions Continued!

Here's a contrived exercise:  

* determine whether a number is 101 or if it's greater than 100
* if it's 101, it should only print out that it's "exactly 101" (it shouldn't print out greater than 100)

Here's an implementation.  __What gets printed if n = 200?  What gets printed if n = 101?__   &rarr;

{% highlight python %}
if n > 100:
	print("more than 100")
elif n == 101:
	print("exactly 101")
{% endhighlight %}
</section>

<section markdown="block">
##  Another Gotcha!
<aside>And Back to That Cake Thing</aside>

__Will this code work??__ &rarr;

{% highlight python %}
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")

if answer == 'no':
        print("No cake for you.")
else:
        print("I do not understand.")
{% endhighlight %}

<div class="incremental" markdown="block">
It does something unexpected!  If the user enters yes, we get both "Here, have some cake" __and__ "I do not understand."  Be careful when using consecutive __ifs__
</div>
</section>

<section markdown="block">
##  Nesting If Statements

* it behaves as you'd expect
* remember to get indentation right
* if there are multiple elif's or else's,  you can use indentation to see which initial if statement they belong to
* this works for any combination of if, elif and else
* note that sometimes nested if statements are equivalent to and
* best to simplify - that is, less nesting, better
</section>

<section markdown="block">
##  Nested If Statements and And

__How would you simplify this? &rarr;__

{% highlight python %}
a = 100
if a > 25:
	if a < 200:
		print("I'm in here")
print("We're out there")
{% endhighlight %}

<div class="incremental" markdown="block">
{% highlight python %}
a = 100
if a > 25 and a < 200:
	print("I'm in here")
print("We're out there")
{% endhighlight %}
</div>
</section>

<section markdown="block">
##  Modules
</section>

<section markdown="block">
##  We Looked at 3 Modules

__What are some modules we've used, and what do they do? &rarr;__

<div class="incremental" markdown="block">
* math
* random
* sys (we didn't realize use sys that much, though...)
</div>
</section>

<section markdown="block">
##  So... What Can These Modules Do?

* math
	* __pi__ - a constant that contains the value of pi&rarr; 
	* __floor__(x) - returns the smallest integer less than or equal to x&rarr;
	* __ceil__(x) - returns the smallest integer greater than or equal to x&rarr;
	* __sqrt__(x) - returns the square root of x&rarr;
	* __cos__(x) - returns the cosine of x radians &rarr;
</section>

<section markdown="block">
##  So... What Can These Modules Do (Continued)?
* random
	* __random__() - return a random float that's between 0 and 1&rarr;
	* __randint__(a, b) - returns a random int that's a <= n <= b&rarr;
* sys
	* __exit__([arg])_ - exits form python&rarr;
	* __version__ - a constant that contains the version of Python&rarr;
</section>

<section markdown="block">
##  Iteration
</section>

<section markdown="block">
##  Sample While Loop

__Write a program that continually asks the user for numbers, and asks them if they'd like to keep going.  In the end, it should output the average of all of the numbers entered&rarr;__

{% highlight python %}
I'll calculate the average for you!
Current total: 0
Numbers summed: 0
Please enter a number to add
> 10
Do you want to continue adding numbers (yes/no)?
> yes
Current total: 10
Numbers summed: 1
Please enter a number to add
> 12
Do you want to continue adding numbers (yes/no)?
> no
The average is 11.0
{% endhighlight %}
</section>

<section markdown="block">
##  A Potential Solution

{% highlight python %}
total = 0
count = 0
answer = 'yes'
print("I'll calculate the average for you!")
while answer == 'yes':
        print("Current total: " + str(total))
        print("Numbers summed: " + str(count))
        total = total + int(input("Please enter a number to add\n> "))
        count = count + 1
        answer = input("Do you want to continue adding numbers (yes/no)?\n> ")
print("The average is "+ str(total / count))
{% endhighlight %}
</section>

<section markdown="block">
##  Other While Loop Exercises

* simulate a blackjack AI by continuing to _hit_ until some threshold that's close to 21
* a number guessing game
* rock paper scissors until # of wins is greater than 0
* simulate password protection
</section>

<section markdown="block">
##  Counting Dice (For Loop Example)

__Roll a die 1000 times; count how many times a one is rolled!  Print out the result.  Use a for loop.&rarr;__

<pre><code data-trim contenteditable>
import random
ones = 0
for count in range(1, 1000):
	roll = random.randint(1, 6)
	if roll == 1:
		ones = ones + 1
print(str(ones) + " of 1000 rolls were ones")
</code></pre>
</section>

<section markdown="block">
##  Other For Loop Exercises

* sing 99 bottles of beer!
* number guessing game with limited number of guesses (use break for win!)
* input that affects range... say hello x number of times...
</section>


<section markdown="block">
##  For Loops...

__When should you use them? &rarr;__

<div class="incremental" markdown="block">
* you know ahead of time how many iterations you'll have to go through
* you have to go through every element in an _iterable_ object 
	* every number in a sequence of numbers
	* every _item_ in a list
	* every character in a string
</div>
</section>

<section markdown="block">
##  While Loops

__When should you use them? &rarr;__

<div class="incremental" markdown="block">
* when you don't know how many iterations you'll have to go through!
* when you must repeat something until some condition is met
* generally not a great option for counting (need to keep track of counter separately)
</div>
</section>


<section markdown="block">
##  Let's Try Using Both...

* count to 0 to 25 by 5's
	* implement using while
	* implement using for
* print out a series of numbers, each randomly chosen from (1 through 10) that add up to 50 (you can go over)
	* implement using while
	* implement using for
</section>


