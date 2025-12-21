CREATE DATABASE retail_data;

USE retail_data;

CREATE TABLE stores (
Store INT PRIMARY KEY,
Type VARCHAR(10),
Size INT 
);
LOAD DATA LOCAL INFILE 'C:/Users/NewUserName/Documents/stores.csv'
INTO TABLE stores
fields terminated by ','
enclosed by '"'
LINES terminated by'\n'
ignore 1 rows;

create table retail_data.features (
Store int,
Date date,
Temperature decimal(10,2),
Fuel_Price decimal(10,2),
MarkDown1 decimal(10,2),
MarkDown2 decimal(10,2),
MarkDown3 decimal(10,2),
MarkDown4 decimal(10,2),
MarkDown5 decimal(10,2),
CPI decimal(10,2),
Unemployment decimal(10,2),
IsHoliday int
);
LOAD DATA LOCAL INFILE 'C:/Users/NewUserName/Documents/features.csv'
INTO TABLE features
fields terminated by ','
enclosed by '"'
LINES terminated by'\n'
ignore 1 rows;


create table  retail_data.sales (
Store int,
Dept int,
Date date,
Weekly_Sales decimal(10,2),
IsHoliday int
);

LOAD DATA LOCAL INFILE 'C:/Users/NewUserName/Documents/sales.csv'
INTO TABLE sales
fields terminated by ','
enclosed by '"'
LINES terminated by'\n'
ignore 1 rows;

set global local_infile = 1;
show variables like 'local_infile';