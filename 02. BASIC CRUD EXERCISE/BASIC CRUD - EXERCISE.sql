-- Download and get familiar with the soft_uni, diablo and geography 
-- database schemas and tables. You will use them in this and the 
-- following exercises to write queries.

-- Part I – Queries for SoftUni Database

USE `soft_uni`;

-- 1.	Find All Information About Departments
-- Write a SQL query to find all available information about the departments. 
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    *
FROM
    `departments`
ORDER BY `department_id`;


-- 2. Find all Department Names
-- Write SQL query to find all department names.
-- Sort the information by id.
-- Submit your query statements as Prepare DB & run queries.

SELECT 
    department.name
FROM
    `departments` AS department
ORDER BY department.department_id;


-- 3. Find salary of Each Employee
-- Write SQL query to find the first name, last name and salary of each employee.
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name, employee.salary
FROM
    `employees` AS employee
ORDER BY employee.employee_id;


-- 4. Find Full Name of Each Employee
-- Write SQL query to find the first, middle and last name of each employee.
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name,
    employee.middle_name,
    employee.last_name
FROM
    `employees` AS employee
ORDER BY employee.employee_id;


-- 5. Find Email Address of Each Employee
-- Write a SQL query to find the email address of each employee.
-- (by his first and last name). Consider that the email domain is softuni.bg.
-- Emails should look like “John.Doe@softuni.bg".
-- The produced column should be named "full_ email_address".
-- Submit your query statements as Prepare DB & run queries.


SELECT 
    CONCAT(employee.first_name,
            '.',
            employee.last_name,
            '@softuni.bg') AS 'full_email_address'
FROM
    `employees` AS employee;


-- 6. Find All Different Employee’s Salaries
-- Write a SQL query to find all different employee’s salaries.
-- Show only the salaries. Sort the information by id.
-- Submit your query statements as Prepare DB & run queries.

SELECT DISTINCT
    employee.salary
FROM
    `employees` AS employee
ORDER BY employee.employee_id;


-- 7. Find all Information About Employees
-- Write a SQL query to find all information about the employees whose job title is “Sales Representative”.
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    *
FROM
    `employees` AS employee
WHERE
    employee.job_title = 'Sales Representative'
ORDER BY employee.employee_id;


-- 8. Find Names of All Employees by salary in Range
-- Write a SQL query to find the first name, 
-- last name and job title of all employees whose salary is in the range [20000, 30000].
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name, employee.job_title
FROM
    `employees` AS employee
WHERE
    employee.salary BETWEEN 20000 AND 30000
ORDER BY employee.employee_id;


-- 9. Find Names of All Employees 
-- Write a SQL query to find the full name of all employees whose salary is
-- 25000, 14000, 12500 or 23600. Full Name is combination of first, middle and
-- last name (separated with single space) and they should be in one column called
-- “Full Name”. Submit your query statements as Prepare DB & run queries.

SELECT 
    CONCAT_WS(' ',
            employee.first_name,
            employee.middle_name,
            employee.last_name) AS 'Full Name'
FROM
    `employees` AS employee
WHERE
    employee.salary IN (25000 , 14000, 12500, 23600)
ORDER BY employee.employee_id;


-- 10. Find All Employees Without Manager
-- Write a SQL query to find first and last names about those employees
-- that does not have a manager. Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name
FROM
    `employees` AS employee
WHERE
    employee.manager_id IS NULL;


-- 11. Find All Employees with salary More Than 50000
-- Write a SQL query to find first name, last name and salary of those employees who
-- has salary more than 50000. Order them in decreasing order by salary.
-- Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name, employee.salary
FROM
    `employees` AS employee
WHERE
    employee.salary > 50000
ORDER BY employee.salary DESC;


-- 12. Find 5 Best Paid Employees
-- Write SQL query to find first and last names about 5 best paid
-- Employees ordered descending by their salary.
-- Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name
FROM
    `employees` AS employee
ORDER BY employee.salary DESC
LIMIT 5;


-- 13. Find All Employees Except Marketing
-- Write a SQL query to find the first and last names of all
-- employees whose department ID is different from 4.
-- Submit your query statements as Prepare DB & run queries.

SELECT 
    employee.first_name, employee.last_name
FROM
    `employees` AS employee
WHERE
    employee.department_id != 4;


-- 14. Sort Employees Table
-- Write a SQL query to sort all records in the еmployees table by the following criteria: 
-- •	First by salary in decreasing order
-- •	Then by first name alphabetically
-- •	Then by last name descending
-- •	Then by middle name alphabetically
-- Sort the information by id. Submit your query statements as Prepare DB & run queries.

SELECT 
    *
FROM
    `employees` AS employee
ORDER BY employee.salary DESC , employee.first_name , employee.last_name DESC , employee.middle_name , employee.employee_id;


-- 15. Create View Employees with Salaries
-- Write a SQL query to create a view v_employees_salaries with first name,
-- last name and salary for each employee. Submit your query statements as Run skeleton, run queries & check DB. 

CREATE VIEW `v_employees_salaries` AS
    SELECT 
        employee.first_name, employee.last_name, employee.salary
    FROM
        `employees` AS employee;


-- 16.	Create View Employees with Job Titles
-- Write a SQL query to create view v_employees_job_titles with full
-- employee name and job title. When middle name is NULL replace it with empty string (‘’).
-- Submit your query statements as Run skeleton, run queries & check DB.

CREATE VIEW `v_employees_job_titles` AS
    SELECT 
        CONCAT_WS(' ',
                employee.first_name,
                IF(employee.middle_name IS NULL,
                    '',
                    employee.middle_name),
                employee.last_name) AS 'Full Name',
        employee.job_title
    FROM
        `employees` AS employee;


-- 17. Distinct Job Titles
-- Write a SQL query to find all distinct job titles
-- Order alphabetically by job title

SELECT DISTINCT
    employee.job_title
FROM
    `employees` AS employee
ORDER BY employee.job_title;


-- 18. Find First 10 Started Projects
-- Write a SQL query to find first 10 started projects. 
-- Select all information about them and sort them by 
-- start date, then by name. Sort the information by id.

SELECT 
    *
FROM
    `projects` AS prj
ORDER BY prj.start_date , prj.name , prj.project_id
LIMIT 10;


-- 19. Last 7 Hired Employees
-- Write a SQL query to find last 7 hired employees. 
-- Select their first, last name and their hire date.

SELECT 
    employee.first_name, employee.last_name, employee.hire_date
FROM
    `employees` AS employee
ORDER BY employee.hire_date DESC
LIMIT 7;


-- 21. Increase Salaries
-- Write a SQL query to increase salaries of all employees 
-- that are in the Engineering, Tool Design, Marketing or 
-- Information Services department by 12%. Then select 
-- Salaries column from the Employees table.

UPDATE `employees` 
SET 
    `salary` = `salary` * 1.12
WHERE
    `department_id` IN (1 , 2, 4, 11);

SELECT 
    employee.salary
FROM
    `employees` AS employee;


-- Part II – Queries for Geography Database

USE `geography`;


-- 21. All Mountain Peaks
-- Display all mountain peaks in alphabetical order.
-- Submit your query statements as Prepare DB & run queries.

SELECT 
    peak.peak_name
FROM
    `peaks` AS peak
ORDER BY peak.peak_name;


-- 22. Biggest Countries by Population
-- Find the 30 biggest countries by population from Europe. 
-- Display the country name and population. Sort the results by 
-- population (from biggest to smallest), then by country alphabetically.

SELECT 
    country.country_name, country.population
FROM
    `countries` AS country
WHERE
    country.continent_code = 'EU'
ORDER BY country.population DESC , country.country_name
LIMIT 30;


-- 23. Countries and Currency (Euro / Not Euro)
-- Find all countries along with information about their currency. 
-- Display the country name, country code and information about its 
-- currency: either "Euro" or "Not Euro". 
-- Sort the results by country name alphabetically.

SELECT 
    country.country_name,
    country.country_code,
    IF(country.currency_code = 'EUR',
        'Euro',
        'Not Euro') AS 'currency'
FROM
    `countries` AS country
ORDER BY country.country_name;



-- Part III – Queries for Diablo Database

USE `diablo`;

-- 25. All Diablo Characters
-- Display all characters in alphabetical order.

SELECT 
    `name`
FROM
    `characters`
ORDER BY `name`;