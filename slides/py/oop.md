---
layout: slides
title: "Named Tuples, Classes, and Objects"
---

<section markdown="block" class="intro-slide">
# {{ page.title }}

### {{ site.vars.course_number}}-{{ site.vars.course_section }}

<p><small></small></p>
</section>

<section markdown="block">
## Storing a 2-Dimensional Point

__What are some options for storing point on a 2D plane?__ (Imagine we had a point, (4, 2)... how would we represent it in our program?) &rarr;

*  {:.fragment} two separate ints: 
    ```x, y = 4, 2```
*  {:.fragment} a 2-element list or a 2-element tuple: 
    ```p = [4, 2] 
p = (4, 2)
```
*  {:.fragment} a dictionary:
    ``` p = {'x':4, 'y':2] ```
</section>

<section markdown="block">
## Storing a Point...

All of the methods in the previous slide are usable depending on the situation. __However, there are definitely some drawbacks. ...What are they?__ &rarr;

*  {:.fragment} dealing with entirely separate variables only really works for a handful of coordinates
*  {:.fragment} ...and the bracket syntax for using dictionaries, lists and tuples is a bit cumbersome. 

__Let's check out another way of creating a point.__ &rarr;
{:.fragment}

</section>

<section markdown="block">
## Named Tuples

From [the official Python 3 docs](https://docs.python.org/2/library/collections.html#namedtuple-factory-function-for-tuples-with-named-fields)...

* "Named tuples assign meaning to each position in a tuple" 
* "...allow for more readable, self-documenting code" 
* "can be used wherever regular tuples are used"
* "... add the ability to access fields by name instead of position index"

Sounds pretty good. __Let's see this work.__ &rarr;

</section>
<section markdown="block">
## Defining Named Tuples


So... using __namedtuple__ in the __collections__ module, you can define a tuple with each position named based on your own specifications. The arguments that you pass to __namedtuple__ are:

1. __typename__  
2. __field_names__ 


```
>>> from collections import namedtuple
>>> Point = namedtuple('Point', ['x', 'y'])
```

From here, you can use <code>Point</code> to create named tuples that have x and y values.
</section>

<section markdown="block">
## Creating Named Tuples

Creating a named tuple with keyword arguments.

```
>>> p = Point(x=0,y=0)
>>> p.x
0
>>> p.y
0
```

Another way of creating a named tuple with positional arguments.

```
>>> q = Point(14, 16)
>>> q
Point(x=14, y=16)
```

</section>

<section markdown="block">
## Named Tuples Continued

Accessing items

```
>>> q.x
14
>>> q[0]
14
```

Unpacking

```
>>> x, y = q
>>> x
14
```

Immutable!
```
>>> q[0] = 100
>>> // exception!
```

</section>

<section markdown="block">
## What is Point _Exactly_?

__Let's see...__ &rarr;

```
>>> type(Point)
<class 'type'>
```

It looks like we made our own type! Just like there are ints, floats, etc... now there's a Point type too...

```
>>> type(str)
<class 'type'>
>>> p = Point(2, 2)
>>> type(p)
<class '__main__.Point'>
```

__SO MUCH POWER.__
</section>

<section markdown="block">
## More Detail

__Let's break down what happened when we created Point.__ &rarr;

```
>>> Point = namedtuple('Point', ['x', 'y'])
```

* <code>namedtuple</code> actually returns a __new type__! (like <code>str</code>, <code>int</code>, etc.)
* the __type's name__ is the argument that's passed in, <code>'Point'</code>
* the __variable name__, <code>Point</code>, is bound to the new type that we create... so we can use it to create <code>Point</code> objects (just like we can use <code>list</code> to create lists or <code>str</code> to create strings)

Note that it doesn't matter what we name the variable; the type still remains <code>'Point'</code> (the first argument)

```
>>> Foo = namedtuple('Point', ['x', 'y'])
>>> q = Foo(9, 10)
>>> type(q)
<class '__main__.Point'>
```
</section>

<section markdown="block">
## If You Liked Named Tuples...

Ok... so named tuples are pretty nice tool. Buuuuut: 

* they're still just tuples, so they're immutable
* and you're stuck with the methods (functions) that are already defined on tuples

Another option that we have is to use __classes__, which are basically a fancier way of saying type.

</section>

<section markdown="block">
## First... about Types and Objects

__What's an object?__ &rarr;

*  {:.fragment} an object is just some data or _state_...
*  {:.fragment} along with the actions that can be performed with that data
*  {:.fragment} for example, <code>"hello"</code> is a string object (the data is a sequence of characters), and ask that object to give you an uppercase version of itself, an action: <code>"hello".upper()</code>

__Great... so why do we care about what the type of an object is?__ &rarr;
{:.fragment}

*  {:.fragment} type determines what we can and can't do with an object
*  {:.fragment} ...such as what operations are valid
*  {:.fragment} ...and what methods you can call on it

</section>

<section markdown="block">
## Classes and Objects

In Python, the words __type__ and __class__ can be used synonymously. We just saw one way to declare a new type by using a named tuple.

__Another way to declare a new type is to declare a new class.__

* start with the keyword <code>class</code>
* followed by the name of your new type
* and an indented block of code that outlines the actions / behaviors / methods (as well as data) that can be used by objects created from your new type

```
# we're creating a new type, a Cat!
class Cat:
    # methods (actions) go here
    pass
```
</section>


<section markdown="block">
## Using a Class

With this simple class definition, __we can already start creating objects__ (they won't _do much_, but their type exists!)...

```
class Cat:
    pass

obj = Cat()
print(type(obj))
# <class '__main__.Cat'>
```

As you can see, using the class name as we were calling a function creates a new _Cat_ object.

The creation of new objects from a class is __instantiation__. (We're creating an instance of class <code>Cat</code>)
</section>

<section markdown="block">
## Where's the Data? 

So, our <code>Cat</code> class is pretty bare bones. __Maybe we want to specify that every new <code>Cat</code> that we create should have a name and a cuteness factor__. We can do this by explicitly creating a __constructor__ method.

A __constructor__ method determines what happens when an object is created. Define a constructor by making a function called <code>__init__</code> that takes a single argument, self. You can define additional arguments as well.

```
    def __init__(self, other_argument):
```

</section>


<section markdown="block">
## self?

__self__ refers to the new object that the constructor will create. You can add data to the __self__ object by using the dot operator and assignment.

```
    self.some_data = other_argument
        self.foo = "bar"
```

</section>
<section markdown="block">
## Constructors

Here's a version of our <code>Cat</code> class with a constructor that requires specifying a cat name and a cuteness factor when creating a new cat:

```
class Cat:
    def __init__(self, name, cuteness_factor):
        self.name = name
        self.cuteness_factor = cuteness_factor

# create a new cat named Paw Newman, with cuteness factor, 10
c = Cat('Paw Newman', 10)
```

This means that we __always__ have to pass in the same number of arguments as the constructor (minus self). Consequently, this would not work with our constructor:

```
c = Cat('Bill Furry') # ERROR!
```

</section>

<section markdown="block">
## Accessing an Object's Data

Once you have an object, you can access it's data / _state_ by using the dot operator and the name of the data you'd like access.

In our previous example, we had a new <code>Cat</code> object.

```
c = Cat('Paw Newman', 10)
```

We can check out our cat's name and cuteness factor by:

```
print(c.name)
print(c.cuteness_factor)
```

</section>

<section markdown="block">
## Defining Methods

__We can also define actions that our cat can perform.__ It's essentially like defining a function, but within a class... aaaand __the first argument should be self if you want to be able to call it on an instance__:


```
class Cat:
    def __init__(self, name, cuteness_factor):
        self.name = name
        self.cuteness_factor = cuteness_factor
    def meow(self, how_loudly):
        print("{} meows{}".format(self.name, how_loudly * '!'))

c = Cat('Paw Newman', 10)
c.meow(5)
# Paw Newman meows!!!!!
```
</section>

<section markdown="block">
## Defining Methods Continued

__Let's take a closer look at defining methods...__ &rarr;

* again, to define a method, create it within the class definition you'd like to add it to
* __the first argument is always self__ if you want to be able to call the method on an _instance_ of your class (which is typically what you want to do)
* note that self refers to the _instance_ that the method is being called on... so for our cat, <code>Paw Newman</code>... <code>self.name</code> is <code>Paw Newman</code>

```
    def meow(self, how_loudly):
        print("{} meows{}".format(self.name, how_loudly * '!'))
```

</section>

<section markdown="block">
## Getters / Setters

Although we can access data in our objects using the dot operator, a __typical pattern__ when creating classes is to __mediate access__ to this data using __"accessor and mutator" methods__, or methods that get and set an object's data.

For example, __instead of accessing data directly, we can use the following getters__ &rarr;

```
   def get_name(self):
        return self.name

   def get_cuteness_factor(self):
        return self.cuteness_factor
```
</section>

<section markdown="block">
## Why Getters and Setters

__Um. Why go through all of that trouble when we can just use the dot operator?__ &rarr;

*  {:.fragment} some of your object's data may need rules or processing applied to them before they are retrieved or written
*  {:.fragment} for example, when you read data, you may want to format it a certain way rather than reading the data directly
*  {:.fragment} or... you may want to have some validation that occurs before you set data

</section>

<section markdown="block">
## Printing Out an Object

__Let's try printing out one of our <code>Cat</code> objects. What do we get?__ &rarr;
```
c = Cat('Paw Newman', 10)
print(c)
```

```
# prints out ??? <__main__.Cat object at 0x10dfab470>
```


What? How did this happen? <code>Paw Newman's</code> name is <code>"Paw Newman</code>, not <code>0x10dfab470</code>.
{:.fragment}

</section>

<section markdown="block">
## String Representation of Objects


In Python, by default, __an object's string representation is its class name followed by its id (for some implementations, this is just the object's address in memory)__.

If we want to override this string representation, we can create a _special method_ called <code>__str__</code>. The value that <code>__str__</code> returns will be used as the string representation of objects created from your class.


```
    def __str__(self):
        return "the cat named {}".format(self.name)
```
</section>

<section markdown="block">
## Types / Validation

__A few notes about data validation:__ &rarr;

* In our constructors, getters and setters, and other methods, we can add any validation that we want to incoming arguments... __if there's an issue, our code can__
    * let the exception bubble up (let an error happen)
    * raise our own custom exception (acknowledge an issue and raise an error)
    * handle the issue (perhaps set a default value)
* __Types are not automatically enforced, though!__



</section>

<section markdown="block">
## Using Custom Exception Classes

```
class CutenessError(Exception):
    pass

class Cat:
    def __init__(self, name, cuteness_factor):
        self.name = name
        if cuteness_factor > 10:
            raise CutenessError("{} is too cute".format(cuteness_factor))
        self.cuteness_factor = cuteness_factor

try:
    cat = Cat('Chairman Meow', 88888)
except CutenessError as e:
    print('uh oh, your cat is too cute: {}'.format(e))
```
</section>



<section markdown="block">
## Additional Class Features

In addition to creating classes with __constructors__, __methods__, and __instance variables__ you can also use the following class features: &rarr;

*  {:.fragment} __static variables__ - variables that can be accessed without an instance, but still defined in a class
*  {:.fragment} __static methods__ - methods that can be called without an instance, but still defined in a class
*  {:.fragment} __magic methods__ - special methods that you can implement to add specific functionality to your class (For example, working with the plus operator)

</section>

<section markdown="block">
## Static Variables

__"Static" / class variables__ ... are properties that you can access __with or without an instance__. The value for a static variable __remains the same for all instances__

Defining a static variable &rarr;
{:.fragment}


```
class Example:
    # declare a static variable within a class
    some_var = 'I am static'
```
{:.fragment}


Accessing a static variable &rarr;
{:.fragment}

```
# without instance (use class name)
print(Example.some_var) # I am static

# with instance
obj = Example()
print(obj.some_var) # I am static
```
{:.fragment}

</section>    

<section markdown="block">
## Static Methods

__"Static" methods__ ... are methods that you can call __with or without an instance__.  To define a __static method__ &rarr;


```
class Example:
    # prefix with @staticmethod and don't use self parameter
    @staticmethod
    def say_hello():
        return 'hello'
```
{:.fragment}


Calling a __static method__ &rarr;
{:.fragment}

```
# without instance (use class name)
# (no need to add self as parameter)
print(Example.say_hello())  # hello

# with instance
obj = Example()
print(obj.say_hello()) # hello
```
{:.fragment}

</section>    


<section markdown="block">
## Static Methods Without Decorator

__It's possible to get similar static method behavior without a decorator__

* {:.fragment} define a function within a class, but...
* {:.fragment} don't define self as the first argument
* {:.fragment} only call from class name

```
class Foo:
    def bar():
        print('static')
Foo.bar()
```
{:.fragment}

⚠️ Note, however, that this will not be callable via the instance (like a function decorated with `@staticmethod` would).
{:.fragment}

</section>

<section markdown="block">
## An Aside on Self


__Remember... when an instance method is called:__ &rarr;

1. {:.fragment} the original object (instance) that the method was called on... 
2. {:.fragment} is passed in as the first argument implicitly / automatically
3. {:.fragment} The actual definition has to accommodate this first argument!


</section>

<section markdown="block">
## Another Perspective on `self`

__Now that we know about static methods, we could also think of calling an instance method _like_ this__ &rarr;


Given this code:
{:.fragment}

```
class Foo:
    def bar(self):
        print('baz')
f = Foo()
```
{:.fragment}


Calling an instance method is similar to calling it like a static method, but with the instance passed in as the argument:
{:.fragment}

```
f.bar()
Foo.bar(f)
```
{:.fragment}

</section>

<section markdown="block">
## Lastly - Class Methods

__You may also encounter a `@classmethod` decorator__ &rarr;

```
class Example:
    @classmethod
    def say_hello_from(cls):
        print('hello from ', cls)

Example.say_hello_from()

```

Similar to a static method, but the class itself is passed in automatically (much like the instance for an instance method) as the first argument.

</section>

<section markdown="block">
## Magic Methods

If you name and implement a method with a special name, it'll have the ability to perform magic! (Not really). __Magic methods__ are methods that add defined functionality to your class. 

__Magic methods usually start and end with TWO underscores__ &rarr;

`__method_name__` - "magic method", "dunderscore", etc. 

</section>

<section markdown="block">
## Magic Methods Continued

Some examples of __magic methods include__: &rarr;

*  {:.fragment} `__init__` - constructor (initializing your object)
*  {:.fragment} `__str__` - nicely formatted string representation

*  {:.fragment} `__repr__` - actual string representation .... doesn't have to be formatted nicely
*  {:.fragment} `__add__` - lets you use + operator
*  {:.fragment} `__eq__`, `__gt__`

Note that these are different from:
{:.fragment}

* {:.fragment} `__name__` ... built-in variable that contains the name of the module, which is `'__main__'` if it's the currently running module


</section>

<section markdown="block">
## A Fraction Class

__Demonstrates use of static methods and magic methods__ &rarr;

First, let's start of with a class definition and constructor:

```
class Fraction:
    def __init__(self, n, d):
        self.n = n
        self.d = d
```
</section>

<section markdown="block">
## A Static Method

`gcf` is __defined as a static method__ because it's possible that we want to call this outside of the context of a fraction object (for example, just passing it two numbers): &rarr;
```
    # this means that this method can be called with/without instance 
    # and consequently, no self is needed; you call it on an instance 
    # the actual class itself: Fraction.gcf()

    @staticmethod 
    def gcf(a, b):
        # go through every possible factor
        # check if it divides evenly into both
        # return the largest one
        cur_gcf = 1
        for factor in range(1, a + 1):
            if a % factor == 0 and b % factor == 0:
                cur_gcf = factor
        return cur_gcf
```


</section>

<section markdown="block">
## Comparison with Regular Methods

__Let's compare with a regular method__ (one that's called on an instance) &rarr;

Compare to a regular method...

```
    # regular method, must be called with instance
    def reduce(self):
        # note how gcf is called / used (no instance needed)!
        gcf = Fraction.gcf(self.n, self.d)
        return Fraction(self.n // gcf, self.d // gcf)
```

</section>

<section markdown="block">
## Magic Methods for String Representation

Sometimes, it's __useful to have a string version of an instance of your class__. For example &rarr;

1. {:.fragment} calling `str` on your instance: `str(some_variable)`
2. {:.fragment} passing your instance to print: `print(some_variable)

To define what happens in these cases: 
{:.fragment}


* {:.fragment} implement `__str__` and `__repr__`
* {:.fragment} both should return a string
* {:.fragment} `__str__` is for the human readable string, `__repr__` is a string representation of all of the data in the instance:

</section>

<section markdown="block">
## Fraction class, __str__ and __repr__

__Using \_\_str\_\_ and \_\_repr\_\_ for string representation__ for our fraction class... &rarr;

```
    def __str__(self):
        return "{}/{}".format(self.n, self.d)

    def __repr__(self):
        # we can call methods that already defined
        return self.__str__()
```

Which allows us to...

```
amt_of_pie = Fraction(1, 2)
print(amt_of_pie) # prints out 1/2
```
{:.fragment}



</section>

<section markdown="block">
## More Magic Methods

In addition to `str` and `repr` there are many more __magic methods__ that add functionality to your object: `__add__` allows the `+` operator, `__eq__` allows `==` &rarr;

__Implementing the above methods gives us the following functionality__ &rarr;

```
a = Fraction(1, 2)
b = Fraction(1, 3)
print(fractions)
print(a + b)
print(a == b)
```
{:.fragment}



</section>

<section markdown="block">
## Equals and Addition

__Here's how == and + can be implemented in the Fraction class__ &rarr;

```
    # note the parameters and return values

    def __add__(self, other):
        return self.add(other)

    def __eq__(self, other):
        return self.n == other.n and self.d == other.d

    def add(self, other):
        new_n = (self.n * other.d) + (other.n * self.d)
        new_d = self.d * other.d
        return Fraction(new_n, new_d)
```

</section>

<section markdown="block">
## Usage

__Some example usage of the Fraction class__ &rarr;

```
a = Fraction(1, 2)
b = Fraction(6, 8)
c = Fraction(1, 3)
fractions = [a, b, c]
```

```
print(fractions) # [1/2, 6/8, 1/3]
print(a.add(c)) # 5/6
print(a + c) # 5/6
print(a == c) # False
print(a == Fraction(1, 2)) # True
print(Fraction.gcf(9, 12)) # 3
print(Fraction(4, 8).reduce()) # 1/2
```

</section>

<section markdown="block">
## Inheritance Overview

__A class can be created based off of another existing class__ &rarr;

* {:.fragment} that is...
* {:.fragment} __methods__ and __instance variables__ from the original (or base/parent class)...
* {:.fragment} will exist in the sub class (or child class)
* {:.fragment} _without_ those methods and instances having to be explicitly defined

For example...
{:.fragment}


1. {:.fragment} we may want a `Student` class that has `first`, `last` and `full name`
2. {:.fragment} ...so we can just __base it off our existing `Person` class__

</section>

<section markdown="block">
## Inheritance: Base Class

Starting with our `Person` class as the __parent / base__: &rarr;

```
class Person:
    def __init__(self, title, first, last):
        self.title = title
        self.first = first
        self.last = last
        # self.full_name = first + ' ' + last

    def __str__(self):
        return self.title + ' ' + self.last

    def full_name(self):
        return self.first + ' ' + self.last

    def say_greeting(self, greeting):
        return greeting + self.first
```

</section>

<section markdown="block">
## Inheriting from Person

__Now... `Student` can inherit from `Person`__ using the following syntax: `class Student(Person)` &rarr;

```
class Student(Person):
    def __init__(self, title, first, last, netid):
        # when we call super, we get access to the 
        # super / parent class methods
        # use super when you're in the class
        super().__init__(title, first, last)
        self.netid = netid

    def full_name(self):
        s = 'STUDENT ' 
        return s + self.first + ' ' + self.last
    
    # this method is called only on student objects
    # person objects don't have this
    def do_homework(self):
        return 'done'
```
</section>

<section markdown="block">
## Using Student

__Note that `s` still has the `full_name` method even though it was not defined in `Student`__.

```
s = Student('Mr', 'Joe', 'Versoza', 'jjv222')
print(s)
print(s.netid)
print(s.say_greeting('hi'))
print(s.full_name())
```

</section>

