
drop table df_orders
-- DDL, vamos criar uma tabela vazia e tratar os tipos de dados da nossa base

create table df_orders (
		[order_id] int primary key,
		[order_date] date,
		[ship_mode] varchar(20),
		[segment] varchar(20),
		[country] varchar(20),
		[city] varchar(20),
		[state] varchar(20),
		[postal_code] varchar(20),
		[region] varchar(20),
		[category] varchar(20),
		[sub_category] varchar(20),
		[product_id] varchar(50),
		[quantity] int,
		[discount] decimal(7,2),
		[sale_price] decimal(7,2),
		[profit] decimal(7,2)
)

-- agora vamos executar o trecho de código para acrescentar em os valores da base df_orders em nossa tabela vazio
/*df.to_sql('df_orders', con=conn, index=False, if_exists= 'append')*/

select * from df_orders


-- análise exploratória 


-- find top 10 highest revenue generating products (top 10 produtos com mais geração de receita)
select top 10
	product_id,
	sum(sale_price) as sales
from
	df_orders
group by product_id
order by sales desc

-- find top 5 highest selling products in each region 
with cte as (
select
	product_id,
	region,
	sum(sale_price) as sales
from
	df_orders
group by product_id, region
)
select * 
from
	(
		select  *,
				ROW_NUMBER() over(partition by region order by sales desc) as RN_by_region

		from cte
	) A
where RN_by_region <=5


-- find month over month growth comparison for 2022 and 2023  sales eg: jan 2022 vs jan 2023
with MoM as (
select
	 year(order_date) as years,
	 month(order_date) as months,
	 sum(sale_price) as sales 
from
	df_orders
group by  year(order_date) ,
		  month(order_date)
)

select
	months,
	sum(case when years = 2022 then sales else 0 end) as sales_2022,
	sum(case when years = 2023 then sales else 0 end) as sales_2023
from MoM
group by months
order by months