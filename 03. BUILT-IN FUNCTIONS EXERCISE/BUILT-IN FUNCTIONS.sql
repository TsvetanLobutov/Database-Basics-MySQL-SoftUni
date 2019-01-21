-- Part I – Queries for SoftUni Database

USE soft_uni;

/* 1.Find Names of All Employees by First Name
Write a SQL query to find first and last names of 
all employees whose first name starts with “Sa” (case insensitively).
Order the information by id. Submit your query statements as Prepare DB & run queries. */

SELECT 
    first_name AS 'Fist Name', last_name AS 'Last Name'
FROM
    employees
WHERE
    first_name LIKE 'Sa%'
ORDER BY employee_id;


/*2. Find Names of All employees by Last Name 
Write a SQL query to find first and last names of all
employees whose last name contains “ei” (case insensitively).
Order the information by id. Submit your query statements as Prepare DB & run queries.*/
 
 
SELECT 
    first_name AS 'Fist Name', last_name AS 'Last Name'
FROM
    employees
WHERE
    last_name LIKE '%ei%'
ORDER BY employee_id;
 
 
 /*3. Write a SQL query to find the first names of all employees 
 in the departments with ID 3 or 10 and whose hire year is between
 1995 and 2005 inclusive. Order the information by id. 
 Submit your query statements as Prepare DB & run queries.*/
 
SELECT 
    first_name AS 'Fist Name'
FROM
    employees
WHERE
    department_id IN (3 , 10)
        AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;
 
 
/*4. Find All Employees Except Engineers
Write a SQL query to find the first and last names of all 
employees whose job titles does not contain “engineer”. 
Order by id. Submit your query statements as Prepare DB & run queries.*/

SELECT 
    first_name AS 'Fist Name', last_name AS 'Last Name'
FROM
    employees
WHERE
    job_title NOT LIKE '%engineer%'
ORDER BY employee_id;


/* 5. Find Towns with Name Length
Write a SQL query to find town names that are 5 or 6 symbols 
long and order them alphabetically by town name. 
Submit your query statements as Prepare DB & run queries.*/

SELECT 
    `name` AS 'Towns wiht 5 or 6 symbols'
FROM
    towns
WHERE
   CHAR_LENGTH(`name`) BETWEEN 5 AND 6
ORDER BY name;


/* 6. Find Towns Starting With
Write a SQL query to find all towns that start with letters
M, K, B or E (case insensitively). Order them alphabetically
by town name. Submit your query statements as Prepare DB & run queries. */
 
SELECT 
    town_id, `name` AS 'Town'
FROM
    towns
WHERE
    `name` REGEXP '^[MmKkBbEe]'
ORDER BY name;


/* 7. Find Towns Not Starting With
Write a SQL query to find all towns that does not start with letters
 R, B or D (case insensitively). Order them alphabetically by name.
 Submit your query statements as Prepare DB & run queries. */
 
SELECT 
    town_id, `name` AS 'Town'
FROM
    towns
WHERE
    `name` REGEXP '^[^RrBbDd]'
ORDER BY name;


/* 8. Create View Employees Hired After 2000 Year
Write a SQL query to create view v_employees_hired_after_2000 with 
first and last name to all employees hired after 2000 year. 
Submit your query statements as Run skeleton, run queries & check DB.*/

CREATE VIEW `v_employees_hired_after_2000` AS
    SELECT 
        first_name AS 'Fist Name', last_name AS 'Last Name'
    FROM
        employees
    WHERE
        YEAR(hire_date) > 2000;

SELECT 
    *
FROM
    `v_employees_hired_after_2000`;
    

/* 9.	Length of Last Name
Write a SQL query to find the names of all employees 
whose last name is exactly 5 characters long.*/

SELECT 
    first_name AS 'Fist Name', last_name AS 'Last Name'
FROM
    employees
WHERE
    CHAR_LENGTH(last_name) = 5;



 -- Part II – Queries for Geography Database 
 
 USE geography;
 
/* 10. Countries Holding ‘A’ 3 or More Times
Find all countries that holds the letter 'A' in their name at least 3 
times (case insensitively), sorted by ISO code. Display 
the country name and ISO code. Submit your query statements as Prepare DB & run queries.*/

-- 10.1 

SELECT 
    country_name AS 'Country Name', iso_code as 'ISO code'
FROM
    countries
WHERE
    country_name LIKE '%a%a%a%'
ORDER BY iso_code;

-- 10.2

SELECT 
    country_name AS 'Country Name', iso_code AS 'ISO code'
FROM
    countries
WHERE
    (CHAR_LENGTH(country_name) - CHAR_LENGTH(REPLACE(LOWER(country_name), 'a', ''))) >= 3
ORDER BY iso_code;
 
 
 /* 11.	 Mix of Peak and River Names
Combine all peak names with all river names, so that the last letter 
of each peak name is the same like the first letter of its corresponding river name. 
Display the peak names, river names, and the obtained mix. 
Sort the results by the obtained mix. Submit your query statements as Prepare DB & run queries.*/

SELECT 
    peak_name AS 'Peak Name',
    river_name AS 'Rive Name',
    LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) AS 'mix'
FROM
    peaks,
    rivers
WHERE
    LOWER(RIGHT(`peak_name`, 1)) = LOWER(LEFT(`river_name`, 1))
ORDER BY mix;
 
 
-- Part III – Queries for Diablo Database

USE diablo;

/* 12. Games from 2011 and 2012 year
Find the top 50 games ordered by start date, then by name of the game. 
Display only games from 2011 and 2012 year. 
Display start date in the format “YYYY-MM-DD”. 
Submit your query statements as Prepare DB & run queries.*/

SELECT 
    `name` AS 'Name',
    DATE_FORMAT(`start`, '%Y-%m-%d') AS 'Start Date'
FROM
    games
WHERE
    YEAR(`start`) BETWEEN 2011 AND 2012
ORDER BY `start` , `name`
LIMIT 50;
 
 
 /* 13.	 User Email Providers
Find all users along with information about their email providers. 
Display the user_name and email provider. 
Sort the results by email provider alphabetically, then by username. 
Submit your query statements as Prepare DB & run queries.*/

-- 13.1

SELECT 
    user_name AS 'Username',
    SUBSTRING(email,
        LOCATE('@', email) - CHAR_LENGTH(email)) AS 'E-mail Provider'
FROM
    users
ORDER BY `E-mail Provider` , user_name;
 
 -- 13.2
 
 SELECT 
    `user_name`,
    SUBSTRING_INDEX(`email`, '@', - 1) AS 'Email Provider'
FROM
    `users`
ORDER BY `Email Provider` , `user_name`;


/* 14. Get Users with IP Address Like Pattern
Find all user_name and  ip_address for each user 
sorted by user_name alphabetically. 
Display only rows that ip_address matches 
the pattern: “___.1%.%.___”. Submit your query 
statements as Prepare DB & run queries.*/
 
SELECT 
    user_name AS 'Username', ip_address AS 'IP address'
FROM
    users
WHERE
    ip_address like '___.1%.%.___'
ORDER by `Username`;


/*15.Show All Games with Duration and Part of the Day
Find all games with part of the day and duration. 
Parts of the day should be Morning (start time is >= 0 and < 12), 
Afternoon (start time is >= 12 and < 18), Evening (start time is >= 18 and < 24). 
Duration should be Extra Short (smaller or equal to 3), Short (between 3 and 6 including), 
Long (between 6 and 10 including) and Extra Long in any other cases or without duration. 
Submit your query statements as Prepare DB & run queries.*/

SELECT 
    `name` AS 'game',
    CASE
        WHEN
            HOUR(`start`) >= 0
                AND HOUR(`start`) < 12
        THEN
            'Morning'
        WHEN
            HOUR(`start`) >= 12
                AND HOUR(`start`) < 18
        THEN
            'Afternoon'
        WHEN
            HOUR(`start`) >= 18
                AND HOUR(`start`) < 24
        THEN
            'Evening'
    END AS 'Part of the Day',
    CASE
        WHEN `duration` <= 3 THEN 'Extra Short'
        WHEN `duration` > 3 AND `duration` <= 6 THEN 'Short'
        WHEN `duration` > 6 AND `duration` <= 10 THEN 'Long'
        ELSE 'Extra Long'
    END AS 'Duration'
FROM
    games;


-- Part IV – Date Functions Queries

USE orders;

/* 16.  Orders Table
You are given a table orders(id, product_name, order_date) filled with data. 
Consider that the payment for that order must be accomplished within 3 days 
after the order date. Also the delivery date is up to 1 month. Write a query 
to show each product’s name, order date, pay and deliver due dates. Submit 
your query statements as Prepare DB & run queries.*/

SELECT 
    product_name AS 'Product',
    order_date AS 'Date Ordered',
    DATE_ADD(order_date, INTERVAL 3 DAY) AS 'Pay Due',
    DATE_ADD(order_date, INTERVAL 1 MONTH) AS 'Delivery Due'
FROM
    orders;