SELECT * FROM retail_data.features;
SELECT * FROM retail_data.sales;
SELECT * FROM retail_data.stores;

-- check null values
-- SALES

select 
sum(case when store is null then 1 else 0 end) as store_nulls,
sum(case when dept is null then 1 else 0 end) as dept_nulls,
sum(case when Date is null then 1 else 0 end) as Date_nulls,
sum(case when  weekly_sales is null then 1 else 0 end) as weekly_sales_nulls,
sum(case when isholiday is null then 1 else 0 end) as isholiday_nulls
 from retail_data.sales;
 
 -- FEATURES
 
 SELECT
 sum(case when store is null then 1 else 0 end) as store_nulls,
sum(case when DATE is null then 1 else 0 end) as date_nulls,
sum(case when temperature is null then 1 else 0 end) as temperature_nulls,
sum(case when  fuel_price is null then 1 else 0 end) as fuel_price_nulls,
sum(case when markdown1 is null then 1 else 0 end) as markdown1_nulls,
sum(case when markdown1 is null then 1 else 0 end) as markdown1_nulls,
sum(case when markdown1 is null then 1 else 0 end) as markdown1_nulls,
sum(case when markdown1 is null then 1 else 0 end) as markdown1_nulls,
sum(case when markdown1 is null then 1 else 0 end) as markdown1_nulls,
sum(case when cpi is null then 1 else 0 end) as cpi_nulls,
sum(case when unemployment is null then 1 else 0 end) as unemployment_nulls,
sum(case when isholiday is null then 1 else 0 end) as isholiday_nulls
from retail_data.features;

-- STORES

select
sum(case when store is null then 1 else 0 end) as store_nulls,
sum(case when type is null then 1 else 0 end) as type_nulls,
sum(case when size is null then 1 else 0 end) as size_nulls
from retail_data.stores;
 
 -- BASIC QUERIES
 
 -- View first 10 rows
select * from retail_data.sales
limit 10;
 
 -- calculate weekly sales above 50000
 select * from retail_data.sales
 where weekly_sales > 50000;
 
 -- Find all weekly sales for a specific store
 select * from retail_data.sales
 where store = 5;

-- find temperature under 20
select store,date,temperature, unemployment,isholiday
 from retail_data.features
where temperature < 20;

-- sort stores based on size from lowest to highest.
select * from retail_data.stores
order by size asc;

-- calculate total weekly sales for each stores
select store,sum(weekly_sales)as total_sales
from retail_data.sales
group by store;

-- find the highest and lowest fuel prices recorded in the data.
select min(fuel_price) as min_fuel,
       max(fuel_price) as max_fuel
       from retail_data.features;

-- compute the average unemployment rate.
select avg(unemployment) as avg_unemployement
from retail_data.features;

-- count number of stores in each type category.
select type, count(*) as total_stores
from retail_data.stores
group by type; 

-- combine sales with store details to display store type for each sales
select sales.store, sales.dept, sales.weekly_sales, stores.type,stores.size
from retail_data.sales
join retail_data.stores
on stores.store = sales.store;

-- connect sales with feature data to show temperature and fuel price for every sales.
select sales.store, sales.Date, sales.dept, sales.weekly_sales, 
features.temperature,features.fuel_price
from retail_data.sales
join retail_data.features
on features.store = sales.store
and features.date = sales.date;

-- merge sales, stores,featuers to create a unifed dataset.
select sales.store, sales.Date, sales.dept, sales.weekly_sales,
stores.type, stores.size,
features.temperature,features.fuel_price, features.Unemployment
from retail_data.sales
join retail_data.stores
on sales.store = stores.store
join retail_data.features
on sales.store = features.store
and sales.date = features.date;



 
 