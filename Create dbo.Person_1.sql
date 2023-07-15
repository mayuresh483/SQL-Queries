--SQL Problem 1

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

select * from icc_world_cup;

select team,count(1) as no_matches_played,sum(winflag) as won_match,count(1)-sum(winflag) as loss_match, sum(winflag)*2 as points from(
Select team_1 as team, case when team_1=winner then 1 else 0 end as winflag From icc_world_cup 
Union ALL
Select team_2 as team, case when team_2=winner then 1 else 0 end as winflag from icc_world_cup) A
Group By team Order By points DESC;

--Problem 2

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

select * from customer_orders

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);



with first_visit as (
select customer_id,min(order_date) as first_visited from customer_orders group by customer_id 
) 
, visit_data as (
select co.*,fb.first_visited
, case when co.order_date = fb.first_visited then 1 else 0 end as first_flag,
case when co.order_date!=fb.first_visited then 1 else 0 end as repeat_flag 
from customer_orders co Inner Join first_visit fb on co.customer_id=fb.customer_id)
select order_date, sum(first_flag) as new_cus,sum(repeat_flag) as same_cus
from visit_data group by order_date


---problem 3

create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

select * from entries

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')


--with floordata as (
--select name,floor ,count(1) as no_times
--from entries group by name,floor)
--select *  
--from entries en inner join floordata fd en.






