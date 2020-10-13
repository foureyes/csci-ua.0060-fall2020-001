------------------------------------------------------------------------------
--      W O R K S H O P # 0 3 - M Y S Q L / M A R I A D B , J O I N S       --
------------------------------------------------------------------------------
-- WRITE QUERIES AND (FOR SOME QUESTIONS) COMMENTS BELOW. TRY TO DO THE     --
-- FIRST ~10 QUESTIONS. THE LATER QUESTIONS ARE MEANT TO BE MORE            --
-- CHALLENGING AND SOME MAY NOT EVEN HAVE STRAIGHTFORWARD ANSWERS.          --
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 1.  What is the relationship between the tables: product_description and
--     product? Is it many-to-many, many-to-one or one-to-one? Hint: DESCRIBE
--     and SHOW CREATE TABLE may be helpful!
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERIES YOU USED
--     TO ARRIVE AT YOUR ANSWER.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 2.  What is the relationship between the tables: report and symptom?
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERIES YOU USED
--     TO ARRIVE AT YOUR ANSWER.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 3.  What is the relationship between the tables: report and product?
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERIES YOU USED
--     TO ARRIVE AT YOUR ANSWER.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 4.  How many reports are in the database? Do this with a single query that 
--     results in exactly one value. 
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 5.  What do the first 30 rows (include all columns) of reports look like 
--     when sorted by increasing report_id?
--     WRITE THE QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 6.  How many total products are in the database? Do this with a single 
--     query that results in exactly one value. Then... with a second query,
--     show the first 30 rows, including all columns of products, this time 
--     ordering by product_id.
--     WRITE YOUR ANSWER FOR THE INITIAL QUESTION IN AN SQL COMMENT FOLLOWED 
--     BY BOTH QUERIES BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 7.  What is the relationship between the tables: product_description and 
--     product? What are the fields contained in both tables? Which field is
--     responsible for creating the relationship between product_description
--     and product.
--     WRITE YOUR ANSWER FOR ALL QUESTIONS IN AN SQL COMMENT FOLLOWED BY THE 
--     QUERIES YOU USED TO ARRIVE AT YOUR ANSWER.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 8.  Are there any products without a product_code?
--     WRITE YOUR ANSWER IN AN SQL COMMENT FOLLOWED BY THE QUERY YOU USED TO 
--     ARRIVE AT YOUR ANSWER.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 9.  Display 30 rows of products again, sorted by the name of the product in
--     alphabetical order. This time, however, show BOTH the NAME of the 
--     product and its DESCRIPTION. Products without an associated description 
--     should not be included. Do this without a WHERE clause.
--     WRITE YOUR QUERY BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 10  This part has several questions to answer:
--     
--     a. What should the possible values of product_type be based on the
--        documentation (https://www.fda.gov/media/97035/download)? 
--     b. Which table is this field located in? 
--     c. Why do you think it's included in that table?
--     d. What are the actual unique values in the database (please include the
--        correct casing) for product_type? Write a query to determine this.
--     e. Finally, find the location of the patient_age field and list out the 
--        unique possible values for it as well
--    
--     ANSWER QUESTIONS a - e IN SQL COMMENTS BELOW. WRITE YOUR QUERIES FOR 
--     FOR QUESTIONS d and e BELOW.
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 10. How afraid should you be of yogurt? 🙀 Show the report_id, product 
--     name and age of all reports that involved yogurt AS THE SUSPECT! 
--    
--     * again, find the rows where yogurt is suspected as the culprit for
--       the adverse reaction
--     * only include reports that have a patient's age in years
--     * sort the results by the patient's year age from oldest to youngest
--     * it's ok to hardcode strings that help your query filter:
--       * for a product name that's similar to yogurt 
--       * an age that's in years
--     * but don't hardcode any other values
--     * hint: there's probably a lot of joins involved in this one!
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 10. Are there any reports that include more than one product as a 
--     SUSPECT? 🕵️ A yes or no answer is adequate, but write a single query 
--     support your answer. Hint: can you show both the report id and the 
--     number of products that are suspect that it's associated with? Taken a 
--     step further, only show the reports that have more than 1 suspect 
--     product.
--
--     WRITE YOUR ANSWER AND QUERY BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 11. Let's try using subqueries! Use your query above as a foundation. Find
--     the average (AVG) number of products per report that has more than one
--     suspect product. 😑
--    
--     * put your previous query in parentheses so that it can be used as an
--       "inner" query
--     * add a name after the parentheses to alias it (for example, tmp) so
--       so that you can refer to it in your outer query
--     * in your inner query, if you did not do so in your previous answer,
--       make sure all items in the select list are easily accessible (that
--       is, give expressions in your select list an alias with as)
--     * prior to your subquery,  you can use a select statement, but with
--       your subquery following from
--
--     WRITE YOUR ANSWER AND QUERY OR QUERIES BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 12. Find the name, product code, and symptom (term) of all of the products 
--     (no duplicates) that give you nightmares 😱
-- 
--     * again, it's ok to hardcode the part of your query that searches for
--       nightmares, but do not hardcode anything else, though
--     * only show the first 30 results
--     * sort by name, ascending
--     * hint: there's even more joins!
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 13. When were the most recently entered reports (use the date that the 
--     report was made rather than when the "event" happened)? 📅
-- 
--     This is actually two queries:
--
--     1. find the date of the most recently entered report(s) 
--     2. reuse that query as part of a subquery to display the report id, 
--        product name, and the date of the most recently entered event(s)
--        * do not hardcode a limit
--
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 14. What are the 3 most common symptoms 🤮
--     
--     * include the name of the symptom and the count
--     * sorted by the count from greatest to least
--
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------


------------------------------------------------------------------------------
-- 15. Find the event that had the most symptoms (there could be a tie) 🤒
-- 
--     * show the primary key for the report, the created date, event date, 
--       product, description, patient_age, sex, and all symptom terms, along 
--       with the count of symptoms
--     * do this for all non exempt products (EXEMPT 4)
--
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------



------------------------------------------------------------------------------
-- 16. Show a comma separated list of symptoms / terms for every report 📝
-- 
--     * the symptoms should look something like: DIZZINESS,RASH,FEVER
--     * use the aggregate function, group_concat, to do this:
--       https://mariadb.com/kb/en/group_concat/
--     * include the report_id and list out the results sorted by the 
--       report_id
--     * only show 5 results
--
--     WRITE YOUR QUERY BELOW
------------------------------------------------------------------------------
