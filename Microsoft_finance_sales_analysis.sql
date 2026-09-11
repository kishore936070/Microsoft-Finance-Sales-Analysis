create database finance;
use finance;

show tables;
select * from sales_data;

# QUERY 1 (Total Revenue, Profit, and COGS by Segment) :

SELECT Segment, ROUND(SUM(`Gross Sales`), 2) as Total_Revenue, 
       ROUND(SUM(Profit), 2) as Total_Profit, ROUND(SUM(COGS), 2) as Total_COGS
FROM sales_data GROUP BY Segment ORDER BY Total_Profit DESC;

# QUERY 2 (Profit Margin by Country) :

SELECT Country, ROUND(SUM(Profit)/SUM(`Gross Sales`)*100, 2) as Profit_Margin_Percent,
       ROUND(SUM(Profit), 2) as Total_Profit FROM sales_data 
GROUP BY Country ORDER BY Profit_Margin_Percent DESC;

# QUERY 3 (Top 5 Products by Revenue) :

SELECT Product, ROUND(SUM(`Gross Sales`), 2) as Revenue, COUNT(*) as Transaction_Count
FROM sales_data GROUP BY Product ORDER BY Revenue DESC LIMIT 5;

# QUERY 4 (Revenue and Profit Trend by Year) :

SELECT `Year`, ROUND(SUM(`Gross Sales`), 2) as Annual_Revenue,
       ROUND(SUM(Profit), 2) as Annual_Profit, 
       ROUND(AVG(Profit), 2) as Avg_Profit FROM sales_data 
GROUP BY `Year` ORDER BY `Year`;

# QUERY 5 (Impact of Discount Bands on Profit) :

SELECT `Discount Band`, COUNT(*) as Transaction_Count,
       ROUND(AVG(Profit), 2) as Avg_Profit, ROUND(SUM(Profit), 2) as Total_Profit
FROM sales_data GROUP BY `Discount Band` ORDER BY Total_Profit DESC;

# QUERY 6 (Monthly Sales Performance) :

SELECT `Month Name`, ROUND(SUM(`Gross Sales`), 2) as Monthly_Revenue,
       ROUND(SUM(Profit), 2) as Monthly_Profit FROM sales_data 
GROUP BY `Month Name`, `Month Number` ORDER BY `Month Number`;

# QUERY 7 (Segment Performance by Country) :

SELECT Segment, Country, ROUND(SUM(`Gross Sales`), 2) as Revenue,
       ROUND(SUM(Profit), 2) as Profit FROM sales_data 
GROUP BY Segment, Country ORDER BY Revenue DESC LIMIT 15;

# QUERY 8 (Units Sold vs Profit by Product) :

SELECT Product, ROUND(SUM(`Units Sold`), 0) as Total_Units,
       ROUND(AVG(`Sale Price`), 2) as Avg_Sale_Price, ROUND(SUM(Profit), 2) as Total_Profit
FROM sales_data GROUP BY Product ORDER BY Total_Units DESC;

# QUERY 9 (High Value Transactions (Top 10) :

SELECT Date, Segment, Country, Product, `Units Sold`, Profit, `Gross Sales`
FROM sales_data ORDER BY Profit DESC LIMIT 10;

# QUERY 10 (Year-over-Year Growth by Segment) :

SELECT `Year`, Segment, ROUND(SUM(`Gross Sales`), 2) as Revenue,
       ROUND(SUM(Profit), 2) as Profit FROM sales_data 
GROUP BY `Year`, Segment ORDER BY `Year` DESC, Profit DESC;
