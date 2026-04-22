# The Retail Insights Data Analyst Database

## Overview

A SQL-based project implemented using Oracle 11g Express Edition that models a retail database and 
performs analytical queries to generate business insights on products, inventory, and sales.

The queries focus on extracting key retail insights using SQL. They identify products nearing expiry with high stock, 
detect dead stock with no recent sales, and calculate category-wise revenue for the last month. By using joins, subqueries,
aggregation, and Oracle date functions, these queries help in effective inventory management and sales analysis.

## Problem Statement

Retail businesses often struggle with:
- Managing expiring products efficiently  
- Identifying unsold inventory (dead stock)  
- Understanding which categories generate the most revenue  


## Tables

* **Categories** (CategoryID, CategoryName)  
  - primary key: categoryid  
  - constraint: categoryname not null  

* **Products** (ProductID, ProductName, CategoryID, Price, StockCount, ExpiryDate)  
  - primary key: productid  
  - foreign key: categoryid references categories(categoryid)  
  - default: stockcount = 0 

* **SalesTransactions** (TransactionID, ProductID, Quantity, TransactionDate)  
  - primary key: transactionid  
  - foreign key: productid references products(productid)  


## Key Features

* Relational schema with primary and foreign key constraints  
* Efficient data insertion using sql  
* Analytical queries using joins, group by, and subqueries  
* Use of oracle date functions (sysdate, add_months, trunc)  
* Real-world business use cases implemented  


## Insights

* Identify products nearing expiry within 7 days having high stock  
* Detect dead stock (no sales in last 60 days)  
* Analyze category-wise revenue for last month  

## How to Run

1. open oracle sql developer or sql*plus  
2. create a new database connection  
3. execute table creation queries  
4. insert sample data into tables  
5. run analytical sql queries


## Execution Environment

* Database: oracle 11g express edition  
* Tools: sql developer / sql*plus  

## Author
GORTHI SANTHOSHI

