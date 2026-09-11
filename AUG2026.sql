CREATE DATABASE AUG2026;            -- created a new database


CREATE DATABASE PRACT;


SHOW DATABASES;


USE AUG2026;                 -- to select the database session


USE PRACT;


DROP DATABASE PRACT;         -- delete a database permanently


CREATE TABLE EMPLOYEE 
(
EMPID INT PRIMARY KEY, 
EMPNAME VARCHAR(50), 
DEPT VARCHAR(20), 
MANAGERID INT, 
SALARY FLOAT
);


TRUNCATE TABLE EMPLOYEE;         -- remove all rows/records but table structure remains


DROP TABLE EMPLOYEE;             -- delete the table employee permanently


SELECT SALARY, DEPT, MANAGERID FROM EMPLOYEE;


SELECT EMPID, DEPT, SALARY FROM employee;


INSERT INTO EMPLOYEE VALUES (101, 'Amit', 'D01', 100, 85000);

INSERT INTO EMPLOYEE VALUES (102, 'Sneha', 'D02', NULL, 72000),
							(103, 'Rahul', 'D03', 101, 68000);
                                                        
INSERT INTO EMPLOYEE VALUES
(101, 'Amit',    'D01', NULL, 85000),
(102, 'Sneha',   'D02', 101,  72000),
(103, 'Rahul',   'D01', 101,  68000),
(104, 'Priya',   'D03', 101,  95000),
(105, 'Karan',   'D02', 102,  72000),
(106, 'Neha',    'D04', 102,  58000),
(107, 'Arjun',   'D03', 104,  88000),
(108, 'Pooja',   'D04', 106,  58000),
(109, 'Vikas',   'D01', 103,  65000),
(110, 'Riya',    'D05', 101,  45000);


CREATE TABLE DEPARTMENT (
    DEPT VARCHAR(10) PRIMARY KEY,
    DEPTNAME VARCHAR(50),
    LOCATION VARCHAR(50),
    BUDGET DECIMAL(12,2),
    HOD VARCHAR(50)
);


INSERT INTO DEPARTMENT VALUES
('D01', 'IT',          'Hyderabad',  5000000, 'Dr. Mehta'),
('D02', 'HR',          'Bangalore',  3000000, 'Dr. Sharma'),
('D03', 'Finance',     'Mumbai',     4500000, 'Dr. Rao'),
('D04', 'Operations',  'Hyderabad',  3500000, 'Dr. Khan'),
('D05', 'Sales',       'Chennai',    4000000, 'Dr. Reddy'),
('D06', 'Marketing',   'Pune',       2500000, 'Dr. Singh'),
('D07', 'Security',    'Delhi',      2800000, 'Dr. Verma'),
('D08', 'Research',    'Hyderabad',  6000000, 'Dr. Iyer'),
('D09', 'Legal',       'Mumbai',     2200000, 'Dr. Das'),
('D10', 'Admin',       'Kolkata',    1800000, 'Dr. Patel');


SELECT Order_ID, Country, Total_Amount FROM sales;


SELECT DISTINCT(DEPT) AS `UNIQUE DEPT` FROM EMPLOYEE;       -- display the unique department


SELECT DISTINCT(MANAGERID) FROM EMPLOYEE;


SELECT * FROM EMPLOYEE             -- to show the records of department D01
WHERE DEPT = 'D01';                -- where clause is used to filter the data/rows


SELECT EMPNAME, DEPT FROM EMPLOYEE
WHERE DEPT = 'D02';


SELECT EMPNAME, DEPT FROM EMPLOYEE
WHERE DEPT IN('D01', 'D03');


SELECT EMPNAME, DEPT FROM EMPLOYEE
WHERE DEPT IN('D01', 'D03')
ORDER BY DEPT DESC;


SELECT * FROM EMPLOYEE
WHERE SALARY > 80000;


SELECT Order_ID, Country, Total_Amount FROM sales
WHERE Country = 'France';


SELECT * FROM EMPLOYEE
ORDER BY SALARY ASC;


SELECT EMPNAME, SALARY FROM EMPLOYEE
ORDER BY SALARY DESC
LIMIT 3;


SELECT DISTINCT(Country) as `Unique Country` FROM SALES;        -- display the unique values


SELECT DISTINCT(Country) as `Unique Country` FROM SALES
ORDER BY `Unique Country` ASC;                              -- ASC is the default order in SQL


SELECT DISTINCT(Country) as `Unique Country` FROM SALES
ORDER BY `Unique Country`;                               -- ASC is optional to use in query as it's default


SELECT COUNT(DISTINCT(Country)) AS UNIQUE_COUNTRY_COUNT FROM SALES;   -- display the unique count


SELECT COUNT(DISTINCT(Customer_Name)) as `unique customer count` FROM SALES;


SELECT COUNT(DISTINCT(Customer_Name)) as Customer_Ruby_Patel_Count FROM SALES
WHERE Customer_Name = 'Ruby Patel';


SELECT COUNT(Customer_Name) as Customer_Ruby_Patel_Count FROM SALES
WHERE Customer_Name = 'Ruby Patel';


-- count customers who did shopping more than one time
SELECT Customer_Name, COUNT(Customer_Name) AS CUSTOMER_COUNT FROM SALES
GROUP BY Customer_Name
ORDER BY CUSTOMER_COUNT DESC
LIMIT 3 OFFSET 10;


SELECT DEPT, COUNT(DEPT) as Emp_Count FROM EMPLOYEE
GROUP BY DEPT;            -- group by is used to calculate the relational rows


ALTER TABLE EMPLOYEE
RENAME COLUMN DEPT TO DEPT_ID;      -- rename a column in a table


ALTER TABLE EMPLOYEE
RENAME COLUMN DEPT_ID TO `DEPARTMENT ID`;      -- rename a column in a table


ALTER TABLE department
RENAME COLUMN DEPT TO `DEPARTMENT ID`;      -- rename a column in a table


RENAME TABLE EMPLOYEE TO NEW_EMPLOYEE;

RENAME TABLE NEW_EMPLOYEE TO EMPLOYEE;
                            
SELECT * FROM NEW_EMPLOYEE;


SELECT
	  SUM(SALARY) AS G_TOT_SALARY,
      AVG(SALARY) AS AVG_EMP_SALARY,
      MIN(SALARY) AS lowest_SALARY,
      MAX(SALARY) AS highest_SALARY,
      COUNT(SALARY) AS SALARY_COUNT
FROM EMPLOYEE;


SELECT `DEPARTMENT ID`, SUM(SALARY) AS Total_Sal FROM EMPLOYEE
GROUP BY `DEPARTMENT ID`;


SELECT MANAGERID, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEE
WHERE MANAGERID IS NOT NULL
GROUP BY MANAGERID;

-- ===================================================
-- Written Order of Sequence for "SQL COMMANDS" -----
-- ===================================================
-- SELECT column_list         = pick column(s) & calculation(s)
-- DISTINCT/AGG column_name   = remove duplicates or Aggregates
-- FROM table_name            = choose table(s)
-- JOIN other_table           = combine table(s)
-- ON Primary_Key             = apply join conditions
-- WHERE condition            = filter rows
-- GROUP BY column            = group same values/rows
-- HAVING condition           = filter groups
-- ORDER BY column            = sort/order results
-- LIMIT number               = restrict rows
-- ==================================================

-- NORMAL CALCULATIONS WITH SELECT --
-- ==================================================
SELECT 2 + 5 as addition;


SELECT MANAGERID, 'and', SALARY, (MANAGERID + SALARY) as new_sal FROM EMPLOYEE;


SELECT SALARY, (SALARY / 2) as half_salary FROM employee;


-- What is the total sales/business revenue

SELECT SUM(Total_Amount) AS TOT_REVENUE FROM SALES;


-- What is the total sales by each region

SELECT Region, SUM(Total_Amount) AS region_wise_total_sales FROM SALES
GROUP BY Region
ORDER BY region_wise_total_sales DESC;


-- Which region generates highest revenue?

SELECT Region, SUM(Total_Amount) AS HIGHEST_SALES FROM SALES
GROUP BY Region
ORDER BY HIGHEST_SALES DESC
LIMIT 1;


-- Which region generates second highest revenue?

SELECT Region, SUM(Total_Amount) AS 2nd_HIGHEST_SALES FROM SALES
GROUP BY Region
ORDER BY 2nd_HIGHEST_SALES DESC
LIMIT 1, 1;

-- Top 3 countries generated highest revenue?

SELECT Country, SUM(Total_Amount) AS HIGHEST_SALES FROM SALES
GROUP BY Country
ORDER BY HIGHEST_SALES DESC
LIMIT 3;


-- average unit profilt by ship mode

SELECT Ship_Mode, ROUND(AVG(Unit_Profit), 2) AS avg_unit_profit FROM SALES
GROUP BY Ship_Mode
ORDER BY AVG(Unit_Profit) DESC;


SELECT round(17/3, 3) AS division;


SELECT round(3.9876345768, 2) as decimal_val;


SELECT ROUND(Total_Amount, 1) as round_val FROM SALES;


SELECT Unit_Sale_Price, 'x', Sold_Quantity, (Unit_Sale_Price * Sold_Quantity) as total_amount FROM SALES;


select sum(Unit_Sale_Price*Sold_Quantity) as total_amount
from sales;


SELECT Region, SUM(Total_Amount) AS Highest_sales FROM SALES 
GROUP BY Region 
ORDER BY SUM(Total_Amount) DESC limit 1;


-- calculate the total revenue by region for each ship mode

SELECT Region, Ship_Mode, SUM(Total_Amount) AS total_rev FROM SALES
GROUP BY Region, Ship_Mode
ORDER BY Region, Ship_Mode;


WITH Ranked_Sales AS (
    SELECT
        Region,
        Ship_Mode,
        SUM(Total_Amount) AS total_rev,
        RANK() OVER (
            PARTITION BY Region
            ORDER BY SUM(Total_Amount) DESC
        ) AS rnk
    FROM SALES
    GROUP BY Region, Ship_Mode
)
SELECT
    Region,
    Ship_Mode,
    total_rev
FROM Ranked_Sales
WHERE rnk = 1;


SELECT round(2.347645, 0) as decimal_value;

SELECT floor(8.99999999) as floor_value;

SELECT ceil(3.18567) as floor_value;


-- //////DATE FUNCTIONS & DATE EXTRACTIONS///////
-- ===========================
SELECT str_to_date('03-09-2026', '%d-%m-%Y') as sql_date;  -- MySQL Date default format YYYY-mm-dd

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%d-%m-%Y') as DMY;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%m-%d-%Y') as MDY;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%Y-%d-%m') as YDM;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%d-%m') as DM;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%m-%Y') as `M-Y`;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%Y / %m') as YM;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%Y') as year;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%m') as month;

SELECT date_format(str_to_date('03-09-2026', '%d-%m-%Y'), '%d') as day;

SELECT DAY(str_to_date('03-09-2026', '%d-%m-%Y')) as DAY_NUMBER;

SELECT DAYNAME(str_to_date('04-09-2026', '%d-%m-%Y')) as DAY_NAME;

SELECT MONTH(str_to_date('03-07-2026', '%d-%m-%Y')) as Month_Num;

SELECT MONTHNAME(str_to_date('03-10-2026', '%d-%m-%Y')) as Month_Name;

SELECT YEAR(str_to_date('03-07-2025', '%d-%m-%Y')) as Year_Num;

SELECT date_format(str_to_date(Order_Date, '%d-%m-%Y'), '%m-%Y') as `M-Y` FROM SALES;



SELECT Order_Date FROM sales;

SELECT YEAR(str_to_date(Order_Date, '%d-%m-%Y')) AS YEAR_NUM FROM SALES;

SELECT Country, Region, YEAR(str_to_date(Order_Date, '%d-%m-%Y')) AS YEAR_NUM FROM SALES
WHERE YEAR(str_to_date(Order_Date, '%d-%m-%Y')) IN (2019, 2020);

SELECT Order_Date, MONTHNAME(str_to_date(Order_Date, '%d-%m-%Y')) as Month_Name FROM SALES;

SELECT Order_Date, DAYNAME(str_to_date(Order_Date, '%d-%m-%Y')) as Day_Name, 
				   MONTHNAME(str_to_date(Order_Date, '%d-%m-%Y')) as Month_Name 
FROM SALES;


-- ==========================================================
-- SQL PROJECT - SALES ANALYSIS
-- ==========================================================

-- 🔹 Q1: Which region and state contribute the highest total sales revenue?

SELECT Region, State, SUM(Total_Amount) AS Total_Revenue
FROM sales
GROUP BY Region, State
ORDER BY Total_Revenue DESC
LIMIT 1;


-- 🔹 Q2: Who are the top 10 customers by total purchase amount?

SELECT 
    Customer_Name,
    SUM(Total_Amount) AS `total purchase amount`
FROM sales
GROUP BY Customer_Name
ORDER BY `total purchase amount` DESC
LIMIT 10;

SELECT 
    Customer_Name,
    SUM(Total_Amount) AS `total purchase amount`,
    COUNT(Customer_Name) AS `shopping count`
FROM sales
GROUP BY Customer_Name
ORDER BY `total purchase amount` DESC
LIMIT 10;

-- 🔹 Q3: What are the top 5 best-selling products by total quantity sold and revenue generated?

-- 🔹 Q4: Which top 3 product categories and sub-categories are the most profitable?

-- 🔹 Q5: What is the monthly sales trend across the dataset — are sales increasing or declining?

-- 🔹 Q6: Find the Yearly Total Revenue.

SELECT DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y') AS YEAR_num, 
	SUM(Total_Amount) AS YEARLY_SALES 
    FROM SALES
GROUP BY YEAR_num
ORDER BY YEARLY_SALES DESC;

-- 🔹 Q7: Which shipping mode is most preferred by customers, and how does it impact delivery cost/profit?

-- 🔹 Q8: What is the average order value (AOV) per customer and per region?

-- 🔹 Q9: Which segments (Consumer, Corporate, Home Office) bring the highest revenue and profit?

-- 🔹 Q10: What percentage of total sales comes from high-value orders (e.g., orders above ₹5000)?
-- -------------------------------------------------------------
-- /////// STORED PROCEDURE: ////////
-- It is a precompiled SQL code stored in the database, that can be executed as a single unit.
-- If any SQL query need to write again and again then same can be saved as Stored Procedure.

DELIMITER $$
CREATE PROCEDURE Y_sales()
BEGIN
	SELECT DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y') AS YEAR_num, 
	SUM(Total_Amount) AS YEARLY_SALES 
	FROM SALES
	GROUP BY YEAR_num
	ORDER BY YEARLY_SALES DESC;
END $$


CALL Y_sales();


DELIMITER $$
CREATE PROCEDURE A()       -- save/store the query under SP to show top customers
BEGIN
	SELECT 
    Customer_Name,
    SUM(Total_Amount) AS `total purchase amount`
	FROM sales
	GROUP BY Customer_Name
	ORDER BY `total purchase amount` DESC
	LIMIT 10;
END $$


CALL A();     -- calling the same query by SP name only


-- //////// JOINs (Inner, Left, Right, Self, cross), SETs (UNION, UNION ALL, INTERSECT) //////////

-- /////////// (INNER) JOIN: Returns records that have only MATCHING (Common) VALUES IN BOTH TABLES

SELECT `DEPARTMENT ID`, DEPTNAME FROM department;


SELECT `DEPARTMENT ID`, EMPNAME FROM employee;


SELECT D.`DEPARTMENT ID`, D.DEPTNAME, E.`DEPARTMENT ID`, E.EMPNAME
FROM department AS D
INNER JOIN employee AS E
ON D.`DEPARTMENT ID` = E.`DEPARTMENT ID`;
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);


INSERT INTO customers (customer_id, customer_name, city)
VALUES
(101, 'Ada', 'Lagos'),
(102, 'John', 'Abuja'),
(103, 'Mercy', 'Owerri'),
(104, 'David', 'Enugu'),
(105, 'Grace', 'Lagos');


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    total_amount DECIMAL(10,2)
);


INSERT INTO orders (order_id, customer_id, product, total_amount)
VALUES
(1001, 101, 'Laptop', 450000),
(1002, 102, 'Phone', 180000),
(1003, 106, 'Monitor', 150000),
(1004, 105, 'Tablet', 120000),
(1005, 103, 'Laptop', 450000);


SELECT C.customer_id, C.customer_name, O.customer_id, O.total_amount
FROM CUSTOMERS AS C
INNER JOIN ORDERS AS O
ON C.customer_id = O.customer_id;


SELECT C.customer_name, O.total_amount
FROM CUSTOMERS AS C
INNER JOIN ORDERS AS O
ON C.customer_id = O.customer_id;

-- Display those customers who has purchased the product.

SELECT C.customer_id, C.customer_name, O.product 
FROM customers C
JOIN orders O                                        	-- inner join is default join
ON C.customer_id = O.customer_id;


SELECT C.customer_id, C.customer_name, O.product 
FROM customers C
JOIN orders O                                        	-- inner join is default join
USING (customer_id);

-- INNER Join shows only matching values from both the table

SELECT C.customer_id, C.customer_name, O.product 
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
ORDER BY C.customer_id;


SELECT C.customer_id, C.customer_name, O.product 
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
WHERE O.Product = 'Laptop'
ORDER BY C.customer_id;


-- LEFT (1st) Join shows all records from 1st table and matching records from 2nd table

SELECT C.customer_id, O.customer_id, C.City, C.customer_name, O.product
FROM customers C                                  -- customers table is 1st table (left table)
LEFT JOIN orders O                                -- orders table is 2nd table (right table)
ON C.customer_id = O.customer_id;


-- RIGHT Join shows all records from 2nd table and matching records from 1st table

SELECT C.customer_id, O.customer_id, C.City, C.customer_name, O.product
FROM customers C                                   -- customers table is 1st table (left table)
RIGHT JOIN orders O                                -- orders table is 2nd table (right table)
ON C.customer_id = O.customer_id;


SELECT O.product, SUM(O.total_amount) as total_amnt
FROM customers C
INNER JOIN orders O
ON C.customer_id = O.customer_id
GROUP BY O.product
HAVING SUM(O.total_amount) > 150000;

-- SELF JOIN: An organization wants to display each employee along with the name of their manager.
-- Write a MySQL query using SELF JOIN to display the Employee Name and Manager Name.

SELECT
	  E.EMPNAME as Employee_Name,
      M.EMPNAME as Manager_Name
FROM EMPLOYEE E
JOIN EMPLOYEE M
	  ON E.MANAGERID = M.EMPID;


-- Compare Employee Salary with Manager Salary, employee whose salary is greater than his/her manager

SELECT
	E.EMPNAME AS EMPLOYEE_NAME,
    E.SALARY AS EMPLOYEE_SALARY,
    M.EMPNAME AS MANAGER_NAME,
    M.SALARY AS MANAGER_SALARY
FROM EMPLOYEE E
JOIN EMPLOYEE M
    ON E.MANAGERID = M.EMPID
WHERE E.SALARY > M.SALARY;
    


-- ////// SETs (UNION, UNION ALL, INTERSECT) ///////
-- ===========================================
-- It combines TWO or more SELECT statements from same or from different tables
-- Union: It doesn't allow duplicate values
-- Union All: It allows duplicate value
-- Intersect: It allowS only common values
-- Number of columns must be equal in both SELECT statements
-- Data Types of columns must be same in both SELECT statements
-- Column informations should be same in both SELECT statements


SELECT customer_id FROM customers
UNION
SELECT customer_id FROM orders;


SELECT customer_id FROM customers
UNION ALL
SELECT customer_id FROM orders;


SELECT customer_id FROM customers
INTERSECT
SELECT customer_id FROM orders;


-- //////// RANKING FUNCTIONS ///////////

-- ROW_NUMBER()
-- RANK()
-- DENSE_RANK()
-- NTILE(2)

SELECT STUD_NAME, MARKS, ROW_NUMBER() OVER(ORDER BY MARKS DESC) AS UNIQUE_RANK
FROM STUDENT;       	-- simply gives normal sequence without taking care of ties/same value


SELECT STUD_NAME, MARKS, RANK() OVER(ORDER BY MARKS DESC) AS RANK_WITH_SEQ_BREAK
FROM STUDENT; 			-- gives the rank but breaks the sequence after tie/same value


SELECT STUD_NAME, MARKS, DENSE_RANK() OVER(ORDER BY MARKS DESC) AS PROPER_RANK
FROM STUDENT;			-- gives the rank and doesn't break the sequence after tie/same value



SELECT STUD_NAME, MARKS, NTILE(2) OVER(ORDER BY MARKS DESC) AS GROUP_RANK
FROM STUDENT;			-- gives rank in groups


SELECT STUD_NAME,
	   MARKS, 
       ROW_NUMBER() OVER(ORDER BY MARKS DESC) AS UNIQUE_RANK,
       RANK() OVER(ORDER BY MARKS DESC) AS RANK_WITH_SEQ_BREAK,
       DENSE_RANK() OVER(ORDER BY MARKS DESC) AS PROPER_RANK,
       NTILE(2) OVER(ORDER BY MARKS DESC) AS GROUP_RANK
FROM STUDENT;


-- //////////// CTE (COMMON TABLE EXPRESSION) - WITH/////////////////
-- to see the desired ranking (nth Rank) position, to delete duplicate records

WITH DESIRED_RANK AS
(
SELECT STUD_NAME, MARKS, DENSE_RANK() OVER (ORDER BY MARKS DESC) AS SPECIFIC_RANK
FROM STUDENT
)
SELECT STUD_NAME, MARKS, SPECIFIC_RANK FROM DESIRED_RANK
WHERE SPECIFIC_RANK = 2;


WITH DESIRED_RANK AS
(
SELECT STUD_NAME, MARKS, DENSE_RANK() OVER (ORDER BY MARKS DESC) AS SPECIFIC_RANK
FROM STUDENT
)
SELECT * FROM DESIRED_RANK
WHERE SPECIFIC_RANK = 2;


WITH DESIRED_RANK AS
(
SELECT STUD_NAME, MARKS, DENSE_RANK() OVER (ORDER BY MARKS DESC) AS SPECIFIC_RANK
FROM STUDENT
)
SELECT STUD_NAME, MARKS, SPECIFIC_RANK FROM DESIRED_RANK
WHERE SPECIFIC_RANK IN(3, 5, 6);


-- ////// VIEW ////////

CREATE VIEW RANKING_FUNCTINS AS
SELECT STUD_NAME,
	   MARKS, 
       ROW_NUMBER() OVER(ORDER BY MARKS DESC) AS UNIQUE_RANK,
       RANK() OVER(ORDER BY MARKS DESC) AS RANK_WITH_SEQ_BREAK,
       DENSE_RANK() OVER(ORDER BY MARKS DESC) AS PROPER_RANK,
       NTILE(2) OVER(ORDER BY MARKS DESC) AS GROUP_RANK
FROM STUDENT;


SELECT * FROM RANKING_FUNCTINS;


CREATE TABLE STUDENT (
    STUD_ID INT PRIMARY KEY,
    STUD_NAME VARCHAR(50),
    MARKS INT
);


INSERT INTO STUDENT (STUD_ID, STUD_NAME, MARKS)
			 VALUES (1, 'Amit', 85),
					(2, 'Sneha', 92),
					(3, 'Ravi', 78),
					(4, 'Priya', 85),   -- tie with Amit
					(5, 'Sumit', 90),
					(6, 'Kiran', 92),   -- tie with Sneha
					(7, 'Neha', 70),
					(8, 'Ankit', 88),
					(9, 'Pooja', 78),   -- tie with Ravi
					(10, 'Rahul', 95);


SELECT STUD_NAME, MARKS FROM STUDENT
ORDER BY MARKS DESC;


SELECT MARKS, STUD_NAME FROM STUDENT;


SELECT * FROM STUDENT;

SELECT * FROM EMPLOYEE;          -- to display all (*) informations from a table

SELECT * FROM DEPARTMENT;

SELECT * FROM SALES;

SELECT * FROM customers;

SELECT * FROM orders;


	     						-- Inside the (), Can be used COLUMN Name of a Table
SELECT ABS(10-11) AS AbsoluteValue;             	-- Returns the absolute/POSITIVE value of -10


SELECT ABS(total_amount) AS AbsoluteValue FROM ORDERS;


	      						-- Inside the (), Can be used COLUMN Name of a Table
SELECT ROUND(SQRT(total_amount), 2) AS SquareRoot FROM ORDERS;      		-- Returns the square root of 25


	      						-- Inside the (), Can be used COLUMN Name of a Table
SELECT POWER(3, 4) AS PowerValue;      		-- Raises 3 to the power of 4(3^4)


	      						-- Inside the (), Can be used COLUMN Name of a Table
SELECT EXP(2) AS ExponentialValue;      		-- Returns e^1 (where e is Euler's number, approximately 2.718^2)



UPDATE EMPLOYEE
SET MANAGERID = NULL
WHERE EMPID = 104;

SELECT IFNULL(MANAGERID, 'No manager') AS ManagerStatus          -- Replaces NULL in Monitor_ID with 'No Monitor'
FROM EMPLOYEE;


SELECT COALESCE(MANAGERID, EMPNAME) AS FirstNonNullValue  
FROM EMPLOYEE; 
