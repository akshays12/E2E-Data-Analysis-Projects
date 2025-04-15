select * from walmart;


-- Exploratory Data Analysis

select count(*) from walmart;

select count(distinct payment_method) from walmart;

select payment_method, count(*) as no_of_transactions
from walmart
group by payment_method

select count(distinct branch) as no_of_branches
from walmart;

select max(quantity) as max_quantity, min(quantity)as min_quantity
from walmart;

-- Business problems

-- Q1. Find different payment methods, number of transactions and number of quantities sold

select distinct payment_method as payment_methods,
       count(*) as no_of_transactions,
	   count(quantity) as quantities_sold
from walmart
group by payment_method;

-- Q2. Identify the highest rated category in each branch. Display the branch, category and average rating

select * from
(
select branch,
       category,
	   avg(rating) as average_rating,
	   rank() over(partition by branch order by avg(rating)) as rnk
from walmart
group by branch, category
order by branch, average_rating desc
)
where rnk = 1;

-- Q3. Identify the busiest day for each branch based on the number of transactions

select * from
(
select branch,
       to_char(to_date(date, 'DD/MM/YY'), 'Day') as busiest_day,
	   count(*) as no_of_transactions,
	   rank() over(partition by branch order by count(*) desc) as rnk
from walmart
group by branch, busiest_day
order by no_of_transactions desc
)
where rnk = 1;

-- Q4. Calculate total quantity of items sold per payment method. List payment method and total quantity

select payment_method, sum(quantity) as total_quantity_sold
from walmart
group by payment_method;

-- Q5. Calculate average, min, max rating of products for each city. List them all

select city, category, avg(rating) as avg_rating, min(rating) as min_rating, max(rating) as max_rating
from walmart
group by city, category;

-- Q6. Calculate total profit for each category considering total profit as (unit price * quantity * profit margin). 
-- List category and total profit from highest to lowest

select category, sum(total_price) as total_revenue, sum(unit_price * quantity * profit_margin) as total_profit
from walmart
group by category
order by total_profit desc;

-- Q7. Determine the most commonly used payment method for each branch

with cte as
(
select branch, payment_method, count(*) as transactions,
       rank() over(partition by branch order by count(*) desc) as rnk
from walmart
group by branch, payment_method
)

select *
from cte
where rnk = 1;

-- Q8. Categorize sales into morning, afternoon and evening. Find each shift and its no of invoices

with cte as
(
select *, 
       case
	       when extract(hour from(time::time)) < 12 then 'morning'
		   when extract(hour from(time::time)) between 12 and 17 then 'afternoon'
		   else 'evening'
	   end day_time
from walmart
)

select branch, day_time, count(*) as invoices
from cte
group by branch, day_time
order by branch, invoices desc;

-- Q9. Identify 5 branches with highest decrease ratio in revenue compared to last year - (current year is 2023)

-- select *, extract(year from to_date(date, 'DD/MM/YY')) as yr
-- from walmart

with revenue_2022 as 
(
select branch, sum(total_price) as revenue
from walmart
where extract(year from to_date(date, 'DD/MM/YY')) = 2022
group by branch
),

revenue_2023 as
(
select branch, sum(total_price) as revenue
from walmart
where extract(year from to_date(date, 'DD/MM/YY')) = 2023
group by branch
)

select r22.branch,
       r22.revenue as previous_yr_revenue,
	   r23.revenue as current_yr_revenure,
	   ((r22.revenue - r23.revenue)/r22.revenue)*100 as dec_ratio
from revenue_2022 as r22
join revenue_2023 as r23
on r22.branch = r23.branch
where r22.revenue > r23.revenue
order by dec_ratio desc
limit 5;






