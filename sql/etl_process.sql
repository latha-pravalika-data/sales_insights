-- =====================================================
-- Sales Insights Project - ETL and Analysis SQL Script
-- Author: <Latha_Pravalika_Munireddygari>
-- Description: This script creates tables, inserts sample 
--              data, and runs analysis queries for the 
--              Sales Insights dashboard project.
-- =====================================================

-- 1. Show all customer records
SELECT * FROM customers;

-- 2. Show total number of customers
SELECT COUNT(*) FROM customers;

-- 3. Show transactions for Chennai market (Mark001)
SELECT * 
FROM transactions 
WHERE market_code = 'Mark001';

--10. Show the first 5 rercords form the transactions table
SEELCT *
FROM transactions
LIMIT 5;

-- 4. Show distinct product codes sold in Chennai
SELECT DISTINCT product_code 
FROM transactions 
WHERE market_code = 'Mark001';

-- 5. Show transactions where currency is USD
SELECT * 
FROM transactions 
WHERE currency = 'USD';

-- 6. Show transactions in 2020 (join with date table)
SELECT t.*, d.* 
FROM transactions t
INNER JOIN date d 
  ON t.order_date = d.date
WHERE d.year = 2020;

-- 7. Total revenue in 2020
SELECT SUM(t.sales_amount) AS total_revenue
FROM transactions t
INNER JOIN date d 
  ON t.order_date = d.date
WHERE d.year = 2020
  AND (t.currency = 'INR' OR t.currency = 'USD');

-- 8. Total revenue in 2020, January
SELECT SUM(t.sales_amount) AS jan_revenue
FROM transactions t
INNER JOIN date d 
  ON t.order_date = d.date
WHERE d.year = 2020
  AND d.month_name = 'January';

-- 9. Total revenue in 2020 in Chennai
SELECT SUM(t.sales_amount) AS chennai_revenue
FROM transactions t
INNER JOIN date d 
  ON t.order_date = d.date
WHERE d.year = 2020
  AND t.market_code = 'Mark001';


