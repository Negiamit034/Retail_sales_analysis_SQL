Retail Sales SQL Project

Overview:
This project is focused on performing data cleaning, exploration, and analysis on retail sales data using SQL. The aim is to clean the dataset by removing incomplete records and analyze key business insights that can drive decision-making. The project includes essential SQL operations such as data aggregation, filtering, ranking, and categorizing sales based on different shifts.

Key Tasks:
Data Cleaning:

Identified and removed rows with missing or null values across critical columns like transaction ID, sale date, and customer details to ensure data integrity.

Performed a comprehensive check on all columns to identify incomplete records and deleted them.

Data Exploration:

Calculated total sales and counted unique customers.

Identified all distinct product categories to understand product diversity.

Business Analysis:

Analyzed sales for specific dates (e.g., November 5, 2022) to understand trends based on category and gender.

Filtered and extracted transactions for categories like 'Clothing' where the quantity sold was greater than 4 during November 2022.

Calculated total sales for each category to determine top-performing product groups.

Calculated the average customer age for specific categories like 'Beauty'.

Advanced SQL Operations:

Used the RANK() window function to identify the best-selling months of each year.

Performed shift categorization (Morning, Afternoon, Evening) based on the sale time using CASE WHEN.

SQL Techniques Used:
Aggregation: COUNT(), SUM(), AVG() for grouping and summarizing data.

Filtering: Date ranges, null values, and specific conditions to narrow down results.

Ranking: Using RANK() to find the best-performing months.

Shifting: Categorizing sales based on time periods using CASE WHEN.

Conclusion:
This project demonstrates the application of SQL in cleaning data, generating business insights, and applying various SQL techniques to extract meaningful information from retail sales data. It serves as a foundation for future data-driven decision-making in retail businesses.
