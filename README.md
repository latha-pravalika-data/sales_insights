# sales_insights

## 📌 Project Overview
This project analyzes sales data using SQL and Power BI to uncover revenue trends, top customers, and regional performance.

## ⚙️ ETL Process
- Data cleaned and transformed using SQL (joins, filtering, aggregations).
- Created normalized currency values for consistency.

## Data Analysis Using SQL
```sql
-- Total number of customers
SELECT COUNT(*) FROM customers;

-- Transactions in Chennai market
SELECT * FROM transactions WHERE market_code = 'Mark001';

-- Show transactions in 2020 join by date table
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;

--Show total revenue in year 2020,
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR\r" or transactions.currency="USD\r";

--Show total revenue in year 2020, January Month,
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and and date.month_name="January" and (transactions.currency="INR\r" or transactions.currency="USD\r");

--Show total revenue in year 2020 in Chennai
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.market_code="Mark001"; 
```

## Data Analysis Using Power BI
```-- Formula to create norm_amount column
= Table.AddColumn(#"Filtered Rows", "norm_amount", each if [currency] = "USD" or [currency] ="USD#(cr)" then [sales_amount]*75 else [sales_amount], type any)

## 📸 Dashboard Preview

Here is a snapshot of the Power BI dashboard:
https://github.com/latha-pravalika-data/sales_insights/blob/main/overview.png?raw=true




