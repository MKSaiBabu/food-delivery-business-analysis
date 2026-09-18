# Food Delivery SQL Analytics

A SQL practice and analytics project built around customer, restaurant, and order datasets.

## Project Overview
This repository answers 15 business-oriented SQL questions involving completed orders, restaurant revenue, customer activity, city-level averages, spending rankings, payment methods, running totals, and month-over-month revenue.

## Skills Demonstrated
- Filtering and grouping
- Aggregations: `SUM`, `COUNT`, `AVG`, `MAX`
- Joins and lookup relationships
- `CASE` expressions
- Subqueries and anti-joins
- Common table expressions (CTEs)
- Window functions: `SUM() OVER`, `RANK()`, and `LAG()`
- Ranking within groups

## Data Files
- `customers.csv`: customer attributes and customer-level information
- `restaurants.csv`: restaurant names and city information
- `orders.csv`: order amounts, dates, statuses, payment methods, and IDs

## Project Files
- `sql/Project.sql` contains the original SQL solutions.
- `documentation/SQL_Project_Documentation.pdf` contains explanations, validation notes, and output previews.

## Validation Notes
The SQL solutions were cross-checked against the CSV datasets. A few original statements require review, especially:
1. Customers with no orders should be found with an anti-join or `NOT EXISTS`.
2. Top-three restaurants must rank within each city using `PARTITION BY city`.
3. Previous-month revenue requires `LAG(monthly_revenue)`, not `LAG(month_name)`.
4. Running totals should aggregate revenue by date before applying the window function.
5. Category sort labels and threshold assumptions should be reviewed.

## Example Use
Load the CSV files into a SQL database, create the related tables, and run the statements in `sql/Project.sql`. Adjust SQL syntax if using a database engine other than MySQL.

## License
This project is intended for learning, portfolio presentation, and SQL practice.
