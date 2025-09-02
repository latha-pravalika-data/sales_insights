# sales_insights

## 📌 Project Overview
This project analyzes sales data using SQL and Power BI to uncover:
Revenue trends 📈
Top customers 👥
Regional performance 🌍
Key business insights for decision-making

## ⚙️ ETL Process
- Data cleaned and transformed using SQL (joins, filtering, aggregations).
- Created normalized currency values for consistency.

## Data Analysis Using SQL
Some key queries used during analysis:
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
Created calculated columns for consistency.
Example: 
-- Formula to create norm_amount column
= Table.AddColumn(#"Filtered Rows", "norm_amount", each if [currency] = "USD" or [currency] ="USD#(cr)" then [sales_amount]*75 else [sales_amount], type any)

## 📸 Dashboard Preview  

Here is a snapshot of the Power BI dashboard:  

![Dashboard Overview](https://raw.githubusercontent.com/latha-pravalika/sales_insights/main/overview.png)


## Project Structure
sales_insights/
│
├── README.md                 # Project documentation  
├── sql/
│   └── etl_process.sql       # SQL scripts for analysis  
├── Sales_Insights.pbix       # Power BI dashboard file  
└── overview.png              # Dashboard screenshot  


## How to Use

Clone this repository:
git clone https://github.com/latha-pravalika-data/sales_insights.git

Import etl_process.sql into your MySQL environment.
Open Sales_Insights.pbix in Power BI Desktop.
Explore the dashboard and interact with insights.

## Key Insights

-- Delhi NCR contributed the highest revenue 💰.
-- Revenue peaked in 2019 before declining in 2020 📉.
-- Top 5 customers accounted for ~45% of sales.


