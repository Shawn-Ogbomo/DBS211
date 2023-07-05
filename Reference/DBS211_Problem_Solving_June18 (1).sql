-- Display product code, product name, quantity, and price for products that have not been ordered. 
-- Sort the result according to the product code.
select distinct p.productcode
from dbs211_orderdetails od
inner join dbs211_products p
on p.productcode = od.productcode
order by productcode;

-- find all customer who have payments, show customer name and number
select distinct c.customernumber, c.customername
from dbs211_payments p
inner join dbs211_customers c
on p.customernumber = c.customernumber;

-- find all customer with no payments, show customer name and number
create or replace view report_payments as
select distinct c.customernumber, c.customername, p.checknumber
from dbs211_payments p
right join dbs211_customers c
on p.customernumber = c.customernumber
where p.checknumber is null;

-- Change the previous view to show customers with paymants
create or replace view report_payments as
select distinct c.customernumber, c.customername, p.checknumber
from dbs211_payments p
right join dbs211_customers c
on p.customernumber = c.customernumber
where p.checknumber is not null;

-- Create a view to list employees in the office code 1
create or replace view office1_view as
select *
from dbs211_employees
where officecode = 1;

-- Create a view to list all employees but show only employee number, last name, and email
create or replace view alloffice_view as
select employeenumber, lastname, email
from dbs211_employees;

-- Show customer and the products the customer has ordred
select c.customernumber, c.customername, o.ordernumber, od.productcode
from dbs211_customers c
inner join dbs211_orders o
on c.customernumber = o.customernumber
inner join dbs211_orderdetails od
on o.ordernumber  = od.ordernumber
order by customernumber, ordernumber;

-- Show customer and the products the customer has ordred, show product code and product name
select distinct c.customernumber, c.customername, od.productcode, p.productname
from dbs211_customers c
inner join dbs211_orders o
on c.customernumber = o.customernumber
inner join dbs211_orderdetails od
on o.ordernumber  = od.ordernumber
inner join dbs211_products p
on od.productcode = p.productcode
order by c.customernumber, od.productcode;


