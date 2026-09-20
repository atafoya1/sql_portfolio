-- SQL retail sales analysis 1

CREATE DATABASE sql_project_1;

DROP TABLE If EXISTS retail_sales;

CREATE TABLE retail_sales 
			(
				transactions_id INT PRIMARY KEY,
				sale_date DATE,
				sale_time TIME,
				customer_id INT,
				gender VARCHAR(15),
				age INT,
				category VARCHAR(15),
				quantity INT,
				price_per_unit FLOAT,
				cogs FLOAT,
				total_sale FLOAT
			);

SELECT * FROM retail_sales -- testing import of csv
LIMIT 10;

SELECT
	COUNT(*) 
FROM retail_sales; -- verify rows match csv

SELECT * FROM retail_sales
WHERE transactions_id IS NULL -- verifying no transactions_id null

SELECT * FROM retail_sales
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	gender IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

--

-- deleting rows with missing values, only 3/2000
DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR
	gender IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

SELECT
	COUNT(*) 
FROM retail_sales;

-- Exploring

-- How many sales?

SELECT COUNT(*) as total_sale FROM retail_sales;

-- # of customers

SELECT COUNT(customer_id) as total_sale FROM retail_sales;

SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales; -- unique customers

SELECT COUNT(DISTINCT category) as total_sale FROM retail_sales; -- unique cat

SELECT DISTINCT category as total_sale FROM retail_sales; -- cat values unique

-- Analysis 

-- retrieve all cols for sales made on 11/05/22

SELECT * FROM retail_sales
		WHERE sale_date = '2022-11-05';

-- retrieve all transactions where cat is clothing and quant sold 
-- is more than 10 in nov 2022

SELECT * from retail_sales
			WHERE category = 'Clothing' 
				AND
				TO_CHAR(sale_date, 'YYYY-MM') = '2022-11' -- compares format to char
				AND quantity >= 4
			GROUP BY 1;

-- calc total sales for each category

SELECT category, SUM(total_sale) as net_sale, COUNT(*) as total_orders FROM retail_sales
	GROUP BY category;

-- find avg age cust who purchase from category beauty

SELECT ROUND(AVG(age)) AS avg_age FROM retail_sales
	WHERE category = 'Beauty';

-- Find all transactions where total_sale is greater than 1000

SELECT * FROM retail_sales
WHERE total_sale >1000; -- all transactions

SELECT category, total_sale, customer_id FROM retail_sales
	WHERE total_sale > 1000; -- 3 cats only

SELECT  customer_id, SUM(total_sale) as total_sales FROM retail_sales
	GROUP BY customer_id
	HAVING SUM(total_sale) >1000; -- 2 cats, sum sales, group by ID

SELECT customer_id, category, SUM(total_sale) as total_sales FROM retail_sales
GROUP BY customer_id, category
HAVING SUM(total_sale) >1000
ORDER BY customer_id; -- grouping by is then cat, sum total category, order by id

-- total number of transactions made by each geneder in each cat

SELECT category, gender, COUNT(*) AS total_trans FROM retail_sales
	GROUP BY category, gender
	ORDER BY gender;

/* 

transactions_id INT PRIMARY KEY,
				sale_date DATE,
				sale_time TIME,
				customer_id INT,
				gender VARCHAR(15),
				age INT,
				category VARCHAR(15),
				quantity INT,
				price_per_unit FLOAT,
				cogs FLOAT,
				total_sale FLOAT

*/