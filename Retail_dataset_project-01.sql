--create database

create database SQL_Projects;

---Data Cleaning--

select * from retail_sales;

select top 5 * from retail_sales;

select count(*) from retail_sales;

select * from retail_sales
where 
transactions_id is null
or 
sale_date is null
or 
sale_time is null
or 
customer_id is null
or
gender is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

delete from retail_sales
where 
transactions_id is null
or 
sale_date is null
or 
sale_time is null
or 
customer_id is null
or
gender is null
or
category is null
or
quantiy is null
or 
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

select * from retail_sales;

-----data exploration--

---1.How many sales we have?
select count(*) from retail_sales;

---2. how many customers we have

select count(distinct customer_id) from retail_sales;

----3.how many category we have

select distinct category from retail_sales;


--Data Analysis/Bussiness Key Problem--

---1. Write a SQL query to retrieve all columns for sales made on'2022-11-05'

select category,gender,sum(quantiy) from (select * from retail_sales where sale_date='2022-11-05') A group by category,gender;
select category,gender,sum(quantiy) from retail_sales where retail_sales.sale_date='2022-11-05' group by category,gender;

--2Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT * 
FROM retail_sales 
WHERE category = 'Clothing' 
  AND Sale_date BETWEEN '2022-11-01' AND '2022-11-30' 
  AND quantiy >=4;

or 

SELECT * 
FROM retail_sales 
WHERE category = 'Clothing' 
  AND format(sale_date,'yyyy-MM') = '2022-11'
  AND quantiy >=4;

---Write a SQL query to calculate the total sales (total_sale) for each category.:

SELECT category,sum(total_sale) as total_sales
from retail_sales
group by category
order by total_sales desc;

---4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:

select avg(age) as avg_age from retail_sales where category='Beauty';

----5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:


select * from retail_sales where total_sale>1000;

---6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
 
 select category,sum(transactions_id) as transactions from retail_sales group by category;

 ---7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

select sale_month,sale_year,average,ranks from(
SELECT 
  MONTH(sale_date) AS sale_month,
  YEAR(sale_date) AS sale_year,
  AVG(total_sale) AS average,
  RANK() OVER (
    PARTITION BY YEAR(sale_date) 
    ORDER BY AVG(total_sale) DESC
  ) AS ranks
FROM retail_sales
GROUP BY MONTH(sale_date), YEAR(sale_date)) as a where ranks=1;

---8**Write a SQL query to find the top 5 customers based on the highest total sales **:

select * from retail_sales;

select top 5
customer_id,sum(total_sale) as total_sale
from retail_sales group by customer_id order by total_sale desc;

---9Write a SQL query to find the number of unique customers who purchased items from each category.:

select category,count(
distinct(customer_id))
from retail_sales group by category;

---Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT 
  CASE
    WHEN time < '12:00' THEN 'Morning'
    WHEN time BETWEEN '12:00' AND '17:00' THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(quantiy) AS total_quantity
FROM (
  SELECT *, LEFT(sale_time, 5) AS time
  FROM retail_sales
) a
GROUP BY 
  CASE
    WHEN time < '12:00' THEN 'Morning'
    WHEN time BETWEEN '12:00' AND '17:00' THEN 'Afternoon'
    ELSE 'Evening'
  END;


