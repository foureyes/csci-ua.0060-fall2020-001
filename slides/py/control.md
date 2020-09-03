---
layout: slides
title: "Basic Control Structures"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
##  Conditionals
</section>

<section markdown="block">
##  Anatomy of an If Statement

__Write an if statement testing if a and b are _not_ equal.  If they're not equal, print the value of a and b twice.__ &rarr;
```
a, b = "foo", "bar"
```

* begin with keyword __if__
* condition
* colon - ends the condition / marks that a block of code is about to come up
* if + condition + colon usually is considered the _if-statement header_
* body of if statement ends when indentation goes back one level
* blank lines don't count as ending a block of code!
{:.fragment}
</section>

<section markdown="block">
##  Let's See That Again
<aside>Now With More Blank Lines</aside>

```
a, b = "foo", "bar"
if a != b:
	# totally ok?  yes!
	# but why?
	# perhaps when done more reasonably, readability
	print a
	print a


	print b

	print b
```
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

```
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
```
</section>

<section markdown="block">
##  Consecutive Ifs
__One way to do it is consecutive if statements...__ &rarr;

```
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")
if answer == 'no':
        print("No cake for you.")
if answer != 'yes' and answer != 'no':
        print("I do not understand.")
```
{:.fragment}
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

```
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")
elif answer == 'no':
        print("No cake for you.")
else:
        print("I do not understand.")
```
{:.fragment}
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

```
if n > 100:
	print("more than 100")
elif n == 101:
	print("exactly 101")
```
</section>

<section markdown="block">
##  Another Gotcha!
<aside>And Back to That Cake Thing</aside>

__Will this code work??__ &rarr;

```
answer = input("Do you want cake?\n> ")
if answer == 'yes':
        print("Here, have some cake.")

if answer == 'no':
        print("No cake for you.")
else:
        print("I do not understand.")
```

It does something unexpected!  If the user enters yes, we get both "Here, have some cake" __and__ "I do not understand."  Be careful when using consecutive __ifs__
{:.fragment}
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

```
a = 100
if a > 25:
	if a < 200:
		print("I'm in here")
print("We're out there")
```

```
a = 100
if a > 25 and a < 200:
	print("I'm in here")
print("We're out there")
```
{:.fragment}
</section>

<section markdown="block">
##  Modules
</section>

<section markdown="block">
##  We Looked at 3 Modules

__What are some modules we've used, and what do they do? &rarr;__

* math
* random
* sys (we didn't realize use sys that much, though...)
{:.fragment}
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

```
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
```
</section>

<section markdown="block">
##  A Potential Solution

```
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
```
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

* you know ahead of time how many iterations you'll have to go through
* you have to go through every element in an _iterable_ object 
	* every number in a sequence of numbers
	* every _item_ in a list
	* every character in a string
{:.fragment}
</section>

<section markdown="block">
##  While Loops

__When should you use them? &rarr;__

* when you don't know how many iterations you'll have to go through!
* when you must repeat something until some condition is met
* generally not a great option for counting (need to keep track of counter separately)
{:.fragment}
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

