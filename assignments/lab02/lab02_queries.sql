------------------------------------------------------------------------------
--                   W O R K S H O P # 0 2 - S Q L                          --
------------------------------------------------------------------------------
-- WRITE QUERIES AND (FOR SOME QUESTIONS) COMMENTS BELOW. TRY TO DO THE     --
-- FIRST ~10 QUESTIONS. THE LATER QUESTIONS ARE MEANT TO BE MORE            --
-- CHALLENGING AND SOME MAY NOT EVEN HAVE STRAIGHTFORWARD ANSWERS.          --
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 1.  How many total dogbite entries are there? Do this with a single query 
--     that results in exactly one value. 
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 2.  What do the first 5 rows (include all columns) of dog bites look like 
--     when sorted by increasing unique id? 
--     WRITE THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 3.  Pick three fields that look like they should have less than 10 possible
--     values. Based on the data in the table, what is the name of each column
--     and what are the unique values in each of these columns? You can write 
--     three separate queries to do this. 
--     WRITE THREE QUERIES BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 4.  Is the unique id really unique? That is, can we prove that each row in 
--     dogbite has its own unique id. HINT: one naive way to do this is 
--     counting... read carefully through https://sqlite.org/lang_aggfunc.html 
--     (specifically: 1. "Syntax"). You can write more than one query to find 
--     the answer.
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERIES BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 5.  What is the breed, age, borough, and zip code for the dog bite incident
--     that occurred on January 06 2015? Only show the columns specified. A 
--     string comparison is adequate for the date. Do this in a single query, 
--     only showing the columns specified.
--     WRITE THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 6.  Write a similar query to the previous one, but with age in months (with 
--     the header in the output renamed age_in_months), and the borough and 
--     zip code combined into a single column, with a comma separating the two 
--     value (with the header in the output renamed location).
--     WRITE THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 7.  What are the unique id, date of bite, breed, and borough for all bites 
--     from ALL dogs that are poodles or poodle mixes in staten island? Do 
--     this in a single query, only showing the columns specified. Make an 
--     attempt to be reasonably accurate.
--     WRITE THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 8.  How many bites occurred in each borough? Do this in a single query that 
--     displays the boroughs name as one column and the number of bites in 
--     that borough in another column. Show the rows in descending number of 
--     bites (that is, the borough with the most bites should go first). 
--     COPY AND PASTE THE RESULTING TABLE OF DATA ALONG WITH THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 9.  What's the average age, rounded to the nearest whole number, of dogs 
--     that bite in the Washington Square area (zip code 10003). Write a 
--     single query that results in one whole number value to do this. Name 
--     the header of this value average_age.
--     WRITE YOUR ANSWER IN A COMMENT AND THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 10. The column for spay and neuter should be boolean-like, so convert the
--     all of the data from 'true' and 'false' to 1 and 0.
--     WRITE TWO SQL STATEMENTS BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 11. What are the bite-iest breeds? Only show the breeds that occur in the 
--     data set at least 100 times. Try to do some amount of clean up for
--     more accurate numbers. Some of these functions may help with that:
--
--     https://sqlite.org/lang_corefunc.html
--
--     You can treat mixes in whatever manner you like (as separate breeds or
--     as same breeds). Make sure to exclude missing values. Show the counts
--     in descending order. Do this all in a single query.
--
--     WRITE YOUR QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 12. The column for age will likely have mixed types. Treat empty string ''
--     as missing values by changing the value of age to NULL (if age is ''). 
--     Before doing this, count how many rows with '' as age are present. Run
--     your query to change these values to NULL. Finally, count the rows
--     with empty string and count the rows with NULL as two separate queries.
--     These numbers should serve as a way to verify your changes.
--     WRITE ALL FOUR SQL STATEMENTS BELOW (SELECT, UPDATE, SELECT, SELECT).
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 13. Which months should you stay indoors to avoid being bitten by a dog? 
--     Answer this question by showing the month name and corresponding number 
--     of dog bites per month. The use of date and time functions ends up
--     being complicated due to the non standard date format. However, it's
--     possible to do some manipulation of the date of bite column using some
--     built-in functions: https://sqlite.org/lang_corefunc.html. Once you 
--     have the totals per month, the end results seem intuitive. Explain why.
--     WRITE YOUR EXPLANATION IN A COMMENT ALONG WITH THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 14. Do old dogs still bite... how old is the oldest dog in this data set? 
--     Show this as a whole number (an integer). Note that aggregate functions 
--     can have an expression as an argument. Make your best reasonable 
--     attempt (for example, bounding values, ignoring some data, etc.); there
--     is no accurate answer as the data in this column VERY inconsistent. Try 
--     to do what you can in a single query. In a comment, above your query, 
--     explain the rationale for formulating your query in the way that you 
--     did.
--     WRITE YOUR METHODOLOGY IN A COMMENT AND THE QUERY BELOW.
------------------------------------------------------------------------------
