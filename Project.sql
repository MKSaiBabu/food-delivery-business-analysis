use project;
#1
select 
(select customer_name from customers where customers.customer_id=orders.customer_id)as customer_name,
(select restaurant_name from restaurants where restaurants.restaurant_id=orders.restaurant_id)as restaurant_name,
order_status from orders where order_status="Completed";

#2
select 
(select restaurant_name from restaurants 
where restaurants.restaurant_id=orders.restaurant_id) 
as restaurant_name, sum(order_amount) as Total_revenue, rank() over(order by sum(order_amount) desc) as Rank_of 
from orders where order_status="Completed" group by restaurant_id order by Total_revenue desc;

#3
select 
(select customer_name from customers 
where customers.customer_id=orders.customer_id)
as Customer_name, count(order_status) as Total_no_of_orders
from orders where order_status="Completed" group by customer_id order by Total_no_of_orders desc;

#4
select 
(select city from restaurants 
where restaurants.restaurant_id=orders.restaurant_id) 
as city, round(avg(order_amount),2) as Average_order_amount
from orders where order_status="Completed" group by city order by city;

#5
select order_amount,
case
when order_amount<411.75 then "Low Category"
when order_amount>934.75 then "High Category"
else "Medium Category"
end as order_category
from orders order by field(order_category,"HIgh Category","Medium Category","Low Category");

#6
select 
(select restaurant_name from restaurants 
where restaurants.restaurant_id=orders.restaurant_id) 
as restaurant_name,round(avg(order_amount),2) as Average_order_amount,
case
when avg(order_amount)>(select round(avg(order_amount),2) from orders) then "Greater AVG"
else "Lesser AVG" end as Average_category
from orders where order_status="Completed" group by restaurant_id order by field(Average_category,"Greater AVG","Lesser AVG");
;

#7
select 
(select customer_name from customers 
where customers.customer_id=orders.customer_id)
as customer_name,order_id from orders where order_id is null;

#8
select 
(select customer_name from customers 
where customers.customer_id=orders.customer_id)
as Customer_name, sum(order_amount) as Total_spendings 
from orders where order_status="Completed"  group by Customer_name  order by Total_spendings desc limit 5;

#9
select 
payment_method,count(payment_method) as frequent_payment_methods 
from orders  where  order_status="Completed" group by payment_method order by frequent_payment_methods desc;

#10
WITH daily_revenue AS (SELECT order_date,SUM(order_amount) AS daily_revenue
FROM orders where order_status='Completed' GROUP BY order_date) #create CTE.

SELECT order_date,daily_revenue,
SUM(daily_revenue) OVER (ORDER BY order_date) AS running_total_revenue FROM daily_revenue 
ORDER BY order_date; 

#11
select 
(select restaurant_name from restaurants
 where restaurants.restaurant_id=orders.restaurant_id) 
as restaurant_name, sum(order_amount) as Total_revenue, rank() over(order by sum(order_amount) desc) as _Rank_ 
from orders where order_status="Completed" group by restaurant_id order by Total_revenue desc; 

#12
select max(order_amount) as Second_highest_order_amount from orders 
where order_amount<(select max(order_amount)from orders);

#13##
select customer_name,no_of_orders from customers where  no_of_orders >
(select avg(no_of_orders) from customers) order by no_of_orders desc;

#14
select (select city from customers 
where customers.city=restaurants.
city group by city ) as City,restaurant_name, 
(select count(order_status) from orders 
where orders.restaurant_id=restaurants.restaurant_id and order_status="Completed" ) as order_count 
from restaurants order by order_count desc;

#15
select Month_name,sum(order_amount) as Monthly_revenue,ifnull(lag(Month_name)  over(),'-') as Prev_MM from orders 
where order_status="Completed" group by Month_name;
