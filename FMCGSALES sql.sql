create database fmcg;
use fmcg;

create table fsales
(Store_Maneger varchar(40),
Fiscal_Year int,
Brand varchar(40),
Brand_Name varchar(40),
Date date,
Meal_Type varchar(40),
Region varchar(40),
State varchar(40),
Store_Name text,
Net_Amt decimal(10,2));

select * from fmcg.fmcg;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\fmcgsales.csv'
INTO TABLE fsales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;



select sum(Net_Amt) from fmcg;

-- KPI1
select State,sum(Net_Amt) from fmcg group by State;

-- KPI2
select Store_name,sum(Net_Amt) from fmcg group by Store_name;

-- KPI3
select Region, Fiscal_Year, sum(Net_Amt)/(select sum(Net_Amt) from fmcg) * 100 as 'Grand Total' from fmcg group by Region, Fiscal_Year;

-- KPI4
select sum(Net_Amt) as 1jan2017,
(select sum(Net_Amt) as 1jan2018 from fmcg where Date = '2018-01-01') as 1jan2018 
from fmcg 
where Date = '2017-01-01';

-- KPI5
select Brand_name, sum(Net_Amt) from fmcg group by Brand_name;

-- KPI6
select Region, Store_Maneger, sum(Net_Amt) from fmcg group by Region, Store_Maneger;

-- KPI8
select Meal_Type, Region, sum(Net_Amt) from fmcg group by Meal_type,Region;

-- KPI9
select Store_Maneger, 
sum(Net_Amt)/(select sum(Net_Amt) from fmcg) * 100 as '2017'
from fmcg where year(Date) = 2017
group by Store_Maneger;

select Store_Maneger, 
sum(Net_Amt)/(select sum(Net_Amt) from fmcg) * 100 as '2018'
from fmcg where year(Date) = 2018 
group by Store_Maneger;


-- KPI10 
select Meal_type, sum(Net_Amt)/(select sum(Net_Amt) from fmcg) * 100 from fmcg group by Meal_type;





