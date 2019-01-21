USE soft_uni;

/* 1. Managers
Write a query to retrieve information about the managers – id, full_name, 
deparment_id and department_name. Select first 5 deparments ordered by employee_id.
Submit your queries using the “MySQL prepare DB and Run Queries” strategy. */
 
SELECT 
    e.employee_id,
    CONCAT_WS(' ', e.first_name, e.last_name) AS full_name,
    d.department_id,
    d.name
FROM
    employees AS e
        JOIN
    departments AS d ON d.manager_id = e.employee_id
ORDER BY employee_id
LIMIT 5;


/* 2. Towns Adresses
Write a query to get information about adresses in the database, which are in San Francisco, 
Sofia or Carnation. Retrieve town_id, town_name, address_text. Order the result by town_id, 
then by address_id. Submit your queries using the “MySQL prepare DB and Run Queries” strategy. 
Example
town_id		town_name		address_text
9			San Fransisco	1234 Seaside Way
9			San Fransisco	5725 Glaze Drive
15			Carnation		1411 Ranch Drive */

SELECT 
    t.town_id, t.name AS town_name, a.address_text
FROM
    addresses AS a
        JOIN
    towns AS t ON a.town_id = t.town_id
WHERE
    t.name IN ('San Francisco' , 'Sofia', 'Carnation')
ORDER BY t.town_id , a.address_id;


/* 3. Employees Without Managers
Write a get information about employee_id, first_name, last_name, 
department_id and salary about all employees who don’t have a manager. 
Submit your queries using the “MySQL prepare DB and Run Queries” strategy.
Example
employee_id	first_name	last_name	department_id	salary
109			Ken			Sanchez		16				125 500
291			Svetlin		Nakov		6				48 000
292			Martin		Kulov		6				48 000
293			George		Denchev		6				48 000 */

SELECT 
    e.employee_id, e.first_name, e.last_name, e.department_id, e.salary
FROM
    employees AS e
WHERE
     ISNULL(e.manager_id);


/* 4. Higher Salary
Write a query to count the number of employees who receive 
salary higher than the average. Submit your queries using 
the “MySQL prepare DB and Run Queries” strategy. */

SELECT 
    COUNT(*)
FROM
    employees AS e1
WHERE
    e1.salary > (SELECT 
            AVG(e2.salary)
        FROM
            employees AS e2);