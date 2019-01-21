CREATE DATABASE minions;



USE minions;

/* 01. Create Tables
In the newly created database Minions add table minions (id, name, age). 
Then add new table towns (id, name). Set id columns of both tables to be 
primary key as constraint. Submit your create table queries in Judge together 
for both tables (one after another separated by “;”) as Run queries & check DB.*/

CREATE TABLE `minions` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`age` tinyint unsigned DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
);

CREATE TABLE `towns` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
);

ALTER TABLE `towns`
	ADD CONSTRAINT PK_towns PRIMARY KEY (`id`);


/* 02. Alter Minions Table
Change the structure of the Minions table to have new column town_id 
that would be of the same type as the id column of towns table. 
Add new constraint that makes town_id foreign key and references to id 
column of towns table. Submit your create table query in Judge as MySQL 
run skeleton, run queries & check DB*/

ALTER TABLE `minions`
	ADD COLUMN `town_id` int DEFAULT NULL,
	ADD CONSTRAINT FK_minions_towns
	FOREIGN KEY (town_id)
	REFERENCES towns(id);

ALTER TABLE `minions`
	ADD `town_id`INT NOT NULL;
    
ALTER TABLE `minions`
	ADD CONSTRAINT FK_town_id FOREIGN KEY (town_id) REFERENCES `towns`(`id`);


/* 03. Insert Records in Both Tables
Populate both tables with sample records given in the table below.
minions								towns
id	name		age		town_id		id	name
1	Kevin		22		1			1	Sofia
2	Bob			15		3			2	Plovdiv
3	Steward		NULL 	2			3	Varna
Use only insert SQL queries.*/

INSERT INTO `towns`
	(`id`,`name`)
VALUES
	(1,'Sofia'),
    (2,'Plovdiv'),
    (3,'Varna');
    
INSERT INTO `minions`
	(`id`,`name`,`age`,`town_id`)
VALUES
	(1,'Kevin',22,1),
    (2,'Bob',15,3),
    (3,'Steward',NULL,2);


/* 04. Truncate Table Minions
Delete all the data from the minions table using SQL query. */

TRUNCATE TABLE `minions`;


/* 05. Drop All Tables
Delete all tables from the minions database using SQL query.*/

DROP TABLE `minions`;
DROP TABLE `towns`;

/* 06.	Create Table People
Using SQL query create table “people” with columns:
	•	id – unique number for every person there will be no more than 231-1people. (Auto incremented)
	•	name – full name of the person will be no more than 200 Unicode characters. (Not null)
	•	picture – image with size up to 2 MB. (Allow nulls)
	•	height –  In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
	•	weight –  In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
	•	gender – Possible states are m or f. (Not null)
	•	birthdate – (Not null)
	•	biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)
Make id primary key. Populate the table with 5 records.  Submit your CREATE and INSERT statements in Judge as Run queries & check DB.*/

CREATE DATABASE `people`;

USE `people`;
-- Submit only the create and insert into judge!!!
CREATE TABLE `people` (
`id` INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
`name` VARCHAR(200) NOT NULL,
`picture` BLOB,
`height` DOUBLE(5,2),
`weight` DOUBLE(5,2),
`gender` ENUM('m','f') NOT NULL,
`birthdate`DATE NOT NULL,
`biography` LONGTEXT
);

INSERT INTO 
`people`(`name`,`picture`,`height`,`weight`,`gender`,`birthdate`,`biography`)
VALUES
	('Pesho','231',182.34,100.12,1,'1982-03-12','very cool'),
	('Qnko','231',152.34,121.12,1,'1991-02-22','tyi kat stani'),
	('Gosho','231',192.23,93.12,1,'2002-06-03','nqmam sefte'),
	('Stamat','231',182.55,101.13,1,'1988-10-17','nishot ne znaq'),
	('Ivan','231',185.87,90.23,1,'1982-03-12','mnogo znaq');


/* 07. Create Table Users
-- Using SQL query create table users with columns:
	•	id – unique number for every user. There will be no more than 263-1 users. (Auto incremented)
	•	username – unique identifier of the user will be no more than 30 characters (non Unicode). (Required)
	•	password – password will be no longer than 26 characters (non Unicode). (Required)
	•	profile_picture – image with size up to 900 KB. 
	•	last_login_time
	•	is_deleted – shows if the user deleted his/her profile. Possible states are true or false.
Make id primary key. Populate the table with 5 records. Submit your CREATE and INSERT statements. Submit your CREATE and INSERT statements as Run queries & check DB.*/

CREATE TABLE `users` (
`id` BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` BLOB,
`last_login_time` TIMESTAMP,
`is_deleted` BOOLEAN
);

INSERT INTO `users`
	(`username`,`password`,`profile_picture`,`last_login_time`,`is_deleted`)
VALUES
	('Pesho','xaflksa443','asda',NOW(),FALSE),
	('Qnko','234SJDiia','qwpeqp',NOW(),FALSE),
	('Gosho','ASD)%sadsa','mmnogo grozen',NULL,TRUE), 
	('Stamat','ASd84dd','aselqweq',NOW(),FALSE),
	('Ivan','ASodu120-5','mnogo znai',NOW(),FALSE);


/*	08. Change Primary Key
Using SQL queries modify table users from the previous task. 
First remove current primary key then create new primary key 
that would be combination of fields id and username. 
The initial primary key name on id is pk_users */

ALTER TABLE `users`
	DROP PRIMARY KEY,
    ADD CONSTRAINT `pk_users` PRIMARY KEY (`id`,`username`);


/* 09. Set Default Value of a Field
Using SQL queries modify table users. Make the default 
value of last_login_time field to be the current time. */

 ALTER TABLE `users`
	 MODIFY COLUMN `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- ALTER TABLE `users`
	-- CHANGE COLUMN `last_login_time` `last_login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


-- 10. Set Unique Field
-- Using SQL queries modify table users. Remove username field from
-- the primary key so only the field id would be primary key. 
-- Now add unique constraint to the username field. 
-- The initial primary key name on (id, username) is pk_users.

ALTER TABLE `users`
	DROP PRIMARY KEY,
	ADD CONSTRAINT `PK_users` PRIMARY KEY (`id`),
    ADD CONSTRAINT UNIQUE (`username`);
    
    
-- 11. Movies Database
-- Using SQL queries create Movies database with the following entities:
-- * directors (id, director_name, notes) 
-- * genres (id, genre_name, notes) 
-- * categories (id, category_name, notes)  
-- * movies (id, title, director_id, copyright_year, length, 
-- 		genre_id, category_id, rating, notes)
-- Set most appropriate data types for each column. 
-- Set primary key to each table. 
-- Populate each table with 5 records.
-- Make sure the columns that are present in 2 tables would be of the same data type.
-- Consider which fields are always required and which are optional.
-- Submit your CREATE TABLE and INSERT statements

CREATE DATABASE `movies`;
USE `movies`;
    
CREATE TABLE `directors` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`director_name` VARCHAR(50) NOT NULL,
	`notes` TEXT(65535),
	CONSTRAINT `PK_directors` PRIMARY KEY (`id`)
);

CREATE TABLE `genres` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`genre_name` VARCHAR(50) NOT NULL,
	`notes` TEXT(65535),
	CONSTRAINT `PK_genres` PRIMARY KEY (id)
);
    
CREATE TABLE `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` TEXT(65535),
    CONSTRAINT `PK_categories` PRIMARY KEY (id)
);
    
CREATE TABLE `movies` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NOT NULL,
	`director_id` INT,
	`copyright_year` DATE,
	`length` INT,
	`genre_id` INT,
	`category_id` INT,
	`rating` FLOAT(2, 1),
    `notes` TEXT(65535),
    CONSTRAINT `PK_movies` PRIMARY KEY (id)
);
    
INSERT INTO `directors`
	(`director_name`,`notes`)
VALUES
	('Pesho',NULL),
	('Qnko',NULL),
    ('Goshka','opalaq'), 
	('Stamat',NULL),
	('Ivan',NULL);

INSERT INTO `genres`
	(`genre_name`,`notes`)
VALUES
	('Liutenica','za esteti'),
	('Shliokavica','za ne tolkova golemi esteti'),
    ('Jasanica','malki da ne gledat mnogo, samo malko'), 
	('Jivotinska Jasanica','malki tuk vyobshte da ne gledat'),
	('Mandjare','za gladni');
    
INSERT INTO `categories`
	(`category_name`,`notes`)
VALUES
	('1',NULL),
    ('34536',NULL),
    ('sdf234',NULL),
    ('we7j','ha siga'),
    ('34343',NULL);
    
INSERT INTO `movies`
	(`title`,`director_id`,`genre_id`,`category_id`,`rating`)
VALUES
	('Goshka v obora',1,4,3,6.7),
    ('Pesho v lozqta',3,3,1,3.6),
    ('Misirki v mola',4,1,5,7.8),
    ('Goshka v obora 2',1,4,1,9.7),
    ('Goshka v obora: Zaden izhod, vyrhovno razkysvane',1,4,5,9.9);

    
/* 12. Car Rental Database
Using SQL queries create car_rental database with the following entities:
* categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
* cars (id, plate_number, make, model, car_year, category_id, 
	doors, picture, car_condition, available)
* employees (id, first_name, last_name, title, notes)
* customers (id, driver_licence_number, full_name, address, city, zip_code, notes)
* rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, 
	kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, 
	total_days, rate_applied, tax_rate, order_status, notes)
Set most appropriate data types for each column. 
Set primary key to each table. 
Populate each table with 3 records.
Make sure the columns that are present in 2 tables would be of the same data type.
Consider which fields are always required and which are optional. 
Submit your CREATE TABLE and INSERT statements */

CREATE DATABASE `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(30) NOT NULL,
    `daily_rate` FLOAT,
    `weekly_rate` FLOAT,
    `monthly_rate` FLOAT,
	`weekend_rate` FLOAT,
    CONSTRAINT `PK_categories` PRIMARY KEY (`id`)
);

CREATE TABLE `cars`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `plate_number` VARCHAR(10) NOT NULL,
    `make` VARCHAR(50),
    `model` VARCHAR(50),
    `car_year` INT,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` TEXT,
    `available` TINYINT,
	CONSTRAINT `PK_categories` PRIMARY KEY (`id`,`plate_number`)
);

CREATE TABLE `employees` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(30) NOT NULL,
	`last_name` VARCHAR(30) NOT NULL,
	`title` VARCHAR(50) NOT NULL,
	`notes` TEXT(65535),
	CONSTRAINT `PK_employees` PRIMARY KEY (`id`)
);

CREATE TABLE `customers` (
	`id` INT NOT NULL AUTO_INCREMENT, 
    `driver_licence_number` BIGINT, 
    `full_name` VARCHAR(200) NOT NULL,
    `address` VARCHAR(200),
    `city` VARCHAR(30),
    `zip_code` INT,
    `notes` TEXT(65535),
    CONSTRAINT `PK_customers` PRIMARY KEY (`id`)
);

CREATE TABLE `rental_orders` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` TEXT(65535),
    `tank_level` DOUBLE,
    `kilometrage_start` DOUBLE, 
    `kilometrage_end` DOUBLE,
    `total_kilometrage` DOUBLE, 
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` FLOAT,
    `tax_rate` FLOAT,
    `order_status`TINYINT, 
    `notes` TEXT(65535),
    CONSTRAINT `PK_rental_orders` PRIMARY KEY (`id`)
);

INSERT INTO `categories`
	(`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`)
VALUES
	('Compact',15.6,90.4,300.9,25.3),
    ('SUV',30.3,150.8,500.1,45.67),
    ('Limousine',45.8,250.4,850.6,75.7);

INSERT INTO `cars` 
	(`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `picture`, `car_condition`, `available`)
VALUES
	('A8972KB','VW','Polo',2017,1,4,'ima snimka','Excellent condition',1),
    ('CB3462AA','Audi','A3',2018,2,5,'ima snimka','Brand new',0),
    ('CB3783CH','Audi','A8',2017,3,4,'ima snimka','Brand new',1);

INSERT INTO `employees` 
	(`first_name`, `last_name`, `title`)
VALUES
	('Qnko','Halilov', 'Office director'),
    ('Pesho','Peshev', 'Order processing'), 
    ('Gosho','Goshev', 'Car Managment');
    
INSERT INTO `customers` 
	(`driver_licence_number`, `full_name`, `city`)
VALUES
	(456635892, 'Chefo Chefov','Varna'),
    (326373434, 'Mama Goshka','Milioni'),
    (120958035, 'Bai Ivan','Poduene');
    
INSERT INTO `rental_orders`
	(`employee_id`, `customer_id`, `car_id`, `order_status`)
VALUES
	(2,1,3,1),
    (1,2,2,0),
    (3,3,1,1);


/* 13. Hotel Database
Using SQL queries create Hotel database with the following entities:
•	employees (id, first_name, last_name, title, notes)
•	customers (account_number, first_name, last_name, phone_number, emergency_name, emergency_number, notes)
•	room_status (room_status, notes)
•	room_types (room_type, notes)
•	bed_types (bed_type, notes)
•	rooms (room_number, room_type, bed_type, rate, room_status, notes)
•	payments (id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, 
amount_charged, tax_rate, tax_amount, payment_total, notes)
•	occupancies (id, employee_id, date_occupied, account_number, room_number, rate_applied, phone_charge, notes)
Set most appropriate data types for each column. Set primary key to each table. Populate each table with 3 records. 
Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields are always 
required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB. */

CREATE DATABASE `hotel`;
USE `hotel`;

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(30),
    notes TEXT,
    CONSTRAINT pk_employees PRIMARY KEY (id)
);

CREATE TABLE customers (
    account_number VARCHAR(20) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number VARCHAR(15),
    emergency_name VARCHAR(30),
    emergency_number INT,
    notes TEXT,
    CONSTRAINT pk_customers PRIMARY KEY (account_number)
);

CREATE TABLE room_status (
    room_status VARCHAR(10) NOT NULL,
    notes TEXT,
    CONSTRAINT pk_room_status PRIMARY KEY (room_status)
);

CREATE TABLE room_types (
    room_type VARCHAR(20) NOT NULL,
    notes TEXT,
    CONSTRAINT pk_room_types PRIMARY KEY (room_type)
);

CREATE TABLE bed_types (
    bed_type VARCHAR(10) NOT NULL,
    notes TEXT,
    CONSTRAINT pk_bed_types PRIMARY KEY (bed_type)
);

CREATE TABLE rooms (
    room_number INT(4) NOT NULL AUTO_INCREMENT,
    room_type VARCHAR(20),
    bed_type VARCHAR(10),
    rate DECIMAL,
    room_status VARCHAR(10),
    notes TEXT,
    CONSTRAINT pk_rooms PRIMARY KEY (room_number)
);

CREATE TABLE payments (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT,
    payment_date DATE,
    account_number VARCHAR(20),
    first_date_occupied DATE,
    last_date_occupied DATE,
    total_days INT,
    amount_charged DECIMAL,
    tax_rate FLOAT,
    tax_amount FLOAT,
    payment_total DECIMAL(8, 2),
    notes TEXT,
    CONSTRAINT pk_payments PRIMARY KEY (id)
);

CREATE TABLE occupancies (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT,
    date_occupied DATE,
    account_number VARCHAR(20),
    room_number INT(4),
    rate_applied FLOAT,
    phone_charge FLOAT,
    notes TEXT,
    CONSTRAINT pk_occupancies PRIMARY KEY (id)
);

INSERT INTO employees (first_name, last_name)
VALUES ('Maria', 'Ivanova'), ('Svetla', 'Petrova'), ('Galya', 'Mihova');

INSERT INTO customers (account_number, first_name, last_name, phone_number)
VALUES ('3728FHCJ738291', 'Ivan', 'Petrov', '0888332289'), ('5848PVQM329048', 'Iva', 'Georgieva', '0883987654'),
('4589DKSL654789', 'Hristo', 'Stoyanov', '0878654124');

INSERT INTO room_status (room_status)
VALUES ('occupied'), ('free'), ('reserved');

INSERT INTO room_types (room_type)
VALUES ('Single room'), ('Double room'), ('Family studio');

INSERT INTO bed_types (bed_type)
VALUES ('Single'), ('Double'), ('Mixed');

INSERT INTO rooms (room_type, bed_type, room_status)
VALUES ('Single room', 'Double', 'free'), ('Family studio', 'Mixed', 'occupied'), ('Double room', 'Single', 'reserved');

INSERT INTO payments (employee_id, account_number, first_date_occupied, last_date_occupied, total_days, payment_total)
VALUES (1, '3728FHCJ738291', '2017-05-01', '2017-05-05', 4, 636.62),
(3, '5848PVQM329048', '2017-03-09', '2017-03-10', 1, 55.70),
(2, '4589DKSL654789', '2016-12-10', '2016-12-20', 10, 1024.89);

INSERT INTO occupancies (employee_id, room_number)
VALUES (1, 3), (2, 1), (3, 2);

/* 14. Create SoftUni Database
Now create bigger database called soft_uni. You will use database in the future tasks. It should hold information about
•	towns (id, name)
•	addresses (id, address_text, town_id)
•	departments (id, name)
•	employees (id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)
Id columns are auto incremented starting from 1 and increased by 1 (1, 2, 3, 4…). Make sure you use appropriate 
data types for each column. Add primary and foreign keys as constraints for each table. Use only SQL queries. 
Consider which fields are always required and which are optional. Submit your CREATE TABLE  statements as Run queries & check DB. */

CREATE DATABASE `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns` (
	`id` INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	CONSTRAINT `pk_towns` PRIMARY KEY (`id`)
);

CREATE TABLE `addresses` (
	`id` INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	`address_text` VARCHAR(30) NOT NULL,
	`town_id` INT UNSIGNED,
	CONSTRAINT `pk_addresses` PRIMARY KEY (`id`),
	CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`)
		REFERENCES `towns` (`id`)
);

CREATE TABLE `departments` (
	`id` INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	CONSTRAINT `pk_departments` PRIMARY KEY (`id`)
);

CREATE TABLE `employees` (
	`id` INT UNSIGNED NOT NULL UNIQUE AUTO_INCREMENT,
	`first_name` VARCHAR(30) NOT NULL,
	`middle_name` VARCHAR(30),
	`last_name` VARCHAR(30) NOT NULL,
	`job_title` VARCHAR(30) NOT NULL,
	`department_id` INT UNSIGNED,
	`hire_date` DATE,
	`salary` DECIMAL(10 , 2 ),
	`address_id` INT UNSIGNED,
	CONSTRAINT `pk_employees` PRIMARY KEY (`id`),
	CONSTRAINT `fk_employees_departments` FOREIGN KEY (`department_id`)
		REFERENCES `departments` (`id`),
	CONSTRAINT `fk_employees_addresses` FOREIGN KEY (`address_id`)
		REFERENCES `addresses` (`id`)
);


/* 16.	Basic Insert
Use the SoftUni database and insert some data using SQL queries.
name					job_title			department				hire_date	salary
Ivan Ivanov Ivanov		.NET Developer		Software Development	01/02/2013	3500.00
Petar Petrov Petrov		Senior Engineer		Engineering				02/03/2004	4000.00
Maria Petrova Ivanova	Intern				Quality Assurance		28/08/2016	525.25
Georgi Terziev Ivanov	CEO					Sales					09/12/2007	3000.00
Peter Pan Pan			Intern				Marketing				28/08/2016	599.88
•	towns: Sofia, Plovdiv, Varna, Burgas
•	departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
•	employees:*/

INSERT INTO `towns` 
		(`name`)
    VALUES 
		('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas');

INSERT INTO `departments` 
		(`name`) 
	VALUES
		('Engineering'),
		('Sales'),
		('Marketing'),
		('Software Development'),
		('Quality Assurance');

INSERT INTO `employees`
		(`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
	VALUES
		('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
		('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
		('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
		('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
		('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);


/* 17.	Basic Select All Fields
Use the soft_uni database and first select all records from the towns, 
then from departments and finally from employees table. Use SQL queries 
and submit them to Judge at once. Submit your query statements as Prepare DB & Run queries. */


USE `soft_uni`;

SELECT 
    *
FROM
    `towns`;
    
SELECT 
    *
FROM
    `departments`;
    
SELECT 
    *
FROM
    `employees`;


/* 18.	Basic Select All Fields and Order Them
Modify queries from previous problem by sorting:
•	towns - alphabetically by name
•	departments - alphabetically by name
•	employees - descending by salary
Submit your query statements as Prepare DB & Run queries. */


SELECT 
    *
FROM
    `towns`
ORDER BY `name`;

SELECT 
    *
FROM
    `departments`
ORDER BY `name`;

SELECT 
    *
FROM
    `employees`
ORDER BY `salary` DESC;


/* 19.	Basic Select Some Fields
Modify queries from previous problem to show only some of the columns. For table:
•	towns – name
•	departments – name
•	employees – first_name, last_name, job_title, salary
Keep the ordering from the previous problem. Submit your query statements as Prepare DB & Run queries. */

SELECT 
    `name`
FROM
    `towns`
ORDER BY `name`;

SELECT 
    `name`
FROM
    `departments`
ORDER BY `name`;

SELECT 
    `first_name`, `last_name`, `job_title`, `salary`
FROM
    `employees`
ORDER BY `salary` DESC;


/* 20. Increase Employees Salary
Use softuni database and increase the salary of all employees by 10%. 
Select only salary column from the employees table. Submit your query statements as Prepare DB & Run queries. */


UPDATE `employees` 
SET 
    `salary` = `salary` * 1.1;

SELECT 
    `salary`
FROM
    `employees`;

/* 21.	Decrease Tax Rate
Use hotel database and decrease tax rate by 3% to all payments.
Select only tax_rate column from the payments table. Submit your query statements as Prepare DB & Run queries. */


UPDATE `payments` 
SET 
    `tax_rate` = `tax_rate` * 0.97;

SELECT 
    `tax_rate`
FROM
    `payments`;


/* 22. Delete All Records
Use Hotel database and delete all records from the occupancies table. 
Use SQL query. Submit your query statements as Run skeleton, run queries & check DB. */


DELETE FROM `occupancies`;