-- ***********************************************************************************
-- DBS211-NBB Lecture
-- Tuesday, June 9, 2020
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- ***********************************************************************************
-- JOIN syntax
SELECT <fieldlist from fields from either table>
FROM <table1>
[WHERE];

SELECT <fieldlist from fields from either table>
FROM <table1> 
<Join Type> JOIN <table2> 
ON <table1.keyfield> = <table2.keyfield>
[WHERE]
[ORDER BY];

-- select customer number, customer name, and phone number for all customers who live in Paris
select customernumber, customername, phone
from dbs211_customers
where city = 'Paris';

-- select customer number, customer name, and phone number the customer with ID 172
select *
from dbs211_orders
where customernumber = 172;

-- select customer number, customer name, order number, order date, and status for all customers who have ordrs
select dbs211_customers.customernumber,
        dbs211_customers.customername,
        dbs211_orders.ordernumber,
        dbs211_orders.orderdate,
        dbs211_orders.status
from dbs211_customers
inner join dbs211_orders
on dbs211_customers.customernumber = dbs211_orders.customernumber
order by dbs211_customers.customernumber, dbs211_orders.ordernumber;
------
-- select customer number, customer name, order number, order date, and status 
-- for the customer with ID 172
select c.customernumber,
        c.customername,
        o.ordernumber,
        o.orderdate,
        o.status,
        od.productcode,
        od.quantityordered,
        od.priceeach
from dbs211_customers c
inner join dbs211_orders o
on c.customernumber = o.customernumber
inner join dbs211_orderdetails od
on o.ordernumber = od.ordernumber
where c.customernumber = 172
order by c.customernumber, o.ordernumber;

-- select customer number, customer name, city, order number, order date, and status 
-- for all customers who have orders and live in Paris
select dbs211_customers.customernumber,
        dbs211_customers.customername,
        dbs211_customers.city,
        dbs211_orders.ordernumber,
        dbs211_orders.orderdate,
        dbs211_orders.status
from dbs211_customers
inner join dbs211_orders
on dbs211_customers.customernumber = dbs211_orders.customernumber
where dbs211_customers.city = 'Paris'
order by dbs211_customers.customernumber, dbs211_orders.ordernumber;

-- select customer number, customer name, check number, and the payment amount 
-- for all customers who have payments
select dbs211_customers.customernumber, dbs211_customers.customername,
        dbs211_payments.checknumber,
        dbs211_payments.amount
from dbs211_customers
inner join dbs211_payments
on dbs211_customers.customernumber = dbs211_payments.customernumber
order by dbs211_customers.customernumber;

-- It is the same as the previous query, we just used the alias instead of the table name to identify columns
select c.customernumber, 
        c.customername,
        p.checknumber,
        p.amount
from dbs211_customers c
inner join dbs211_payments p
on c.customernumber = p.customernumber
order by c.customernumber;

-- select customer number, customer name, check number, and the payment amount 
-- for the customer with ID 172
select c.customernumber, 
        c.customername,
        p.checknumber,
        p.amount
from dbs211_customers c
inner join dbs211_payments p
on c.customernumber = p.customernumber
where c.customernumber  = 172
order by c.customernumber;

-- table1 left join table2: display all rows from table1 even if they do not satisfy the join condition 
-- in the ON clause and just the rows from table2 that satisfies the join condition

-- For all offices, select office code and employee numbers in those offices
select o.officecode, e.employeenumber
from dbs211_offices o
inner join dbs211_employees e
on o.officecode = e.officecode
order by o.officecode;

-- For all offices, select office code and employee numbers in those offices. Include also the offices 
-- that do not have any employees assigned to them. 
-- The sasult the same as the previous query since there is no office without employees
select o.officecode, e.employeenumber
from dbs211_offices o
left join dbs211_employees e
on o.officecode = e.officecode
order by o.officecode;

-- Insert a new office, this is just for testing the following queies, then remove it after you finish
-- practicing
insert into dbs211_offices 
    (OFFICECODE, CITY, PHONE, ADDRESSLINE1, ADDRESSLINE2, STATE, COUNTRY, POSTALCODE, TERRITORY)
  values
    ('8', 'Toronto', '+1 999 999 9999', 'Seneca rd', null, 'Ontario', 'Canada', 'L8M 2C4', 'NA');
    
select * from dbs211_offices;

-- Now we have a new office that do not have any employees assigned to it.
-- For all offices, select office code and employee numbers in those offices. Include also the offices 
-- that do not have any employees assigned to them. 
select o.officecode, e.employeenumber
from dbs211_offices o
left join dbs211_employees e
on o.officecode = e.officecode
order by o.officecode;

-- Find offices without employees 
select o.officecode, e.employeenumber
from dbs211_offices o
left join dbs211_employees e
on o.officecode = e.officecode
where e.employeenumber is null
order by o.officecode;
-- OR
select o.officecode, e.employeenumber
from dbs211_employees e
right join dbs211_offices o
on o.officecode = e.officecode
where e.employeenumber is null
order by o.officecode;
--------------------------------------------------------------------------------------
-- right join
-- For all employees, select office code and employee number. Include also the employees 
-- who are not assigned to any offices. 
-- We do not have any employees without the office, so all rows will have office code 
select o.officecode, e.employeenumber
from dbs211_offices o
right join dbs211_employees e
on o.officecode = e.officecode
where o.officecode is null
order by o.officecode;

--
select c.customernumber,
        c.customername,
        o.ordernumber,
        o.orderdate,
        o.status       
from dbs211_customers c
inner join dbs211_orders o
on c.customernumber = o.customernumber
where c.customernumber = 172
order by c.customernumber, o.ordernumber;

-- view
select *
from dbs211_customers;

-- 
create view cust_view as
select *
from dbs211_customers;

-- use view
select *
from cust_view;

--
create or replace view cust_view as
select customernumber, customername, city
from dbs211_customers;


-- 
-- use view
select *
from cust_view;

-- use view
select *
from cust_view
where customernumber  = 172;

--
create or replace view cust_france_view as
select customernumber, customername, city
from dbs211_customers
where country = 'France';


-- use view
select *
from cust_france_view
order by customernumber;
-- use view
select *
from cust_france_view
order by city;

--
create or replace view cust_order as
select c.customernumber as customernumber,
        c.customername as customername,
        o.ordernumber as ordernumber,
        o.orderdate as orderdate,
        o.status as status     
from dbs211_customers c
inner join dbs211_orders o
on c.customernumber = o.customernumber;

--
select *
from cust_order;

select *
from cust_order
order by customernumber, ordernumber;


select *
from cust_order
where customernumber  = 114
order by customernumber, ordernumber;


select customername, ordernumber
from cust_order
where customernumber  = 114
order by customernumber, ordernumber;