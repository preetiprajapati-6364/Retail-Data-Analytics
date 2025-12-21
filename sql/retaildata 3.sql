-- ANALYSIS QUERIES

-- Which store had highest sales every month?
select store, 
date_format(date, '%y-%m') as month,
sum(weekly_sales)as monthly_sales
from retail_data.sales
group by store , month
order by month , monthly_sales desc 
limit 10;

-- which department has the most consistent sales (lowest variation)
select dept,
stddev(weekly_sales) as sales_variation
from retail_data.sales
group by dept 
order by  sales_variation asc ;

-- comparing sales between holiday and non-holiday sales.
select isholiday ,
sum(weekly_sales) as total_sales,
avg(weekly_sales)as avg_sales
from retail_data.sales
group by  isholiday; 

-- which store type performs the best
select stores.type,
sum(sales.weekly_sales) as total_sales,
avg(sales.weekly_sales) as avg_sales
from retail_data.stores
join retail_data.sales
on sales.store = stores.store
group by stores.type
order by total_Sales desc;

-- which department perform best within each store.
select store,dept as department,
sum(weekly_sales) as total_sales,
avg(weekly_sales) as avg_sales
from retail_data.sales
group by store,dept
order by store ,total_sales desc; 

-- sales trend overtime.
select
year(date) as year ,
month(date) as month_number,
sum(weekly_sales) as total_sales
from retail_data.sales
group by year(date),month(date)
order by year(date), month(date);

-- How do economic factors influence(cpi,unemployement) sales ?
select features.cpi , features.unemployment,
sum(sales.weekly_sales) as total_sales,
round(avg(sales.weekly_sales),2) as avg_sales
from retail_data.features
join retail_data.sales
on sales.store = features.store
and sales.date = features.date
group by features.cpi, features.unemployment
order by features.cpi asc;

-- COMPLEX QUERIES

-- Ranking  stores by weekly sales.
select store,date, dept, weekly_sales ,dense_rank() over(order by weekly_sales desc) as sales_rank
from retail_data.sales; 

-- departments whose sales are above average.
select dept, sum(weekly_sales) as total_sales
from retail_data.sales
group by dept
having sum(weekly_sales) > (select avg(weekly_sales)
from retail_data.sales);

-- find impact of temperature on sales
with combined  as (
select
sales.store,
sales.date,
sales. weekly_sales,
features.temperature
from retail_data.sales
join retail_data.features
on sales.store =features.store and
sales.date = features.date
)
select
store,
sum(weekly_sales) as Total_sales,
sum(temperature) as Temprerature
from combined
group by store;








