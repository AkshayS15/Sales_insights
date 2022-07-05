USE sales #Using sales as default database

SHOW TABLES #Command to get the list of all tables in the database

# 1. Total Number of Products 
SELECT COUNT(DISTINCT(product_code)) FROM transactions 

# 2. Total Number of Customers. 
SELECT COUNT(DISTINCT(customer_code)) FROM transactions 

# 3. Total Number of Markets. 
SELECT COUNT(DISTINCT(market_code)) FROM transactions 

# 4. Types of prducts 
SELECT DISTINCT(product_type) FROM products

# 5. Zones and markets for the distribution 
SELECT DISTINCT zone , markets_name FROM markets
ORDER BY zone asc 

# 6. Data consists of which year's transactions 
SELECT DISTINCT year FROM date 

# 7. Name of all customers and their ordered product type
SELECT DISTINCT custmer_name , customer_type FROM customers

# 8. Total Sales till Date 
SELECT SUM(sales_amount) FROM transactions 

# 9.Total Sales in Year 2017
SELECT SUM(transactions.sales_amount) FROM transactions 
INNER JOIN date 
ON transactions.order_date = date.date 
WHERE year = 2017

# 9. Total sales in North Zone 
SELECT SUM(transactions.sales_amount) FROM transactions
INNER JOIN markets 
ON transactions.market_code = markets.markets_code
WHERE zone = 'North'

# 10. Total sales in Surat 
SELECT SUM(transactions.sales_amount) FROM transactions
INNER JOIN markets 
ON transactions.market_code = markets.markets_code
WHERE markets_name = 'Surat'

# 11. Find the highest sales quantity and total sales occured in which year.
SELECT date.year as YEAR , MAX(transactions.sales_qty) as Maximum_QTY , (transactions.sales_amount) as Total_sales 
FROM transactions 
INNER JOIN date
ON transactions.order_date = date.date

# 12. Which market makes highest sales also tell the quantity of products 
SELECT MAX(transactions.sales_amount) as Total_Sales , MAX(transactions.sales_qty) as Maximum_QTY , 
markets.markets_name , transactions.market_code
FROM transactions 
INNER JOIN markets 
ON transactions.market_code = markets.markets_code

# 13. Sales of each customer type 
SELECT SUM(transactions.sales_amount) as SALES , customers.customer_type as Type_Of_Customers 
FROM transactions 
INNER JOIN customers 
ON transactions.customer_code = customers.customer_code
WHERE customers.customer_type = 'E-Commerce'

SELECT SUM(transactions.sales_amount) as SALES , customers.customer_type as Type_Of_Customers 
FROM transactions 
INNER JOIN customers 
ON transactions.customer_code = customers.customer_code
WHERE customers.customer_type = 'Brick & Mortar'













