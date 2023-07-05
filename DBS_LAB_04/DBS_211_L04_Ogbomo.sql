-- ***********************
-- Name: Shawn Ogbomo
-- ID: 022609127
-- Date: sundayy, June 20, 2021
-- Purpose: Lab 04 DBS211
-- ***********************
--- PART A ---              
-- Q1 SOLUTION --
CREATE TABLE employee2 AS 
(
   SELECT
      * 
   FROM
      employees
)
;
-- Q2 SOLUTION --
ALTER TABLE employee2 ADD username varchar2(20);
-- Q3 SOLUTION --
DELETE
   employee2;
-- Q4 SOLUTION --
INSERT INTO
   employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle) 
   SELECT
      * 
   FROM
      employees ;
-- Q5 SOLUTION --
ALTER TABLE employee2 rename COLUMN username TO "name OF USER";
rename employee2 TO employee_2;
-- PART B --- 
-- Q1 SOLUTION --
--a--
SELECT
   employeenumber,
   firstname,
   lastname,
   city,
   phone,
   postalcode 
FROM
   employees,
   offices 
WHERE
   employees.officecode = offices.officecode 
   AND country = 'France';
--b--
SELECT
   e.employeenumber,
   e.firstname,
   e.lastname,
   o.city,
   o.phone,
   o.postalcode 
FROM
   employees e 
   INNER JOIN
      offices o 
      ON e.officecode = o.officecode 
WHERE
   country = 'France';
-- Q2 SOLUTION --
SELECT
   c.customernumber,
   c.customername,
   p.paymentdate,
   p.amount 
FROM
   customers c 
   INNER JOIN
      payments p 
      ON c.customernumber = p.customernumber 
WHERE
   country = 'Canada' 
ORDER BY
   c.customernumber ASC;
-- Q3 SOLUTION --
SELECT
   c.customernumber,
   c.customername,
   p.paymentdate,
   p.amount 
FROM
   customers c 
   LEFT JOIN
      payments p 
      ON c.customernumber = p.customernumber 
WHERE
   country = 'USA' 
   AND p.amount IS NULL 
ORDER BY
   c.customernumber ASC;
-- Q4 SOLUTION --
SELECT
   msrp,
   productcode,
   buyprice 
FROM
   products 
WHERE
   buyprice > 100;
-- PART C--
-- QUESTION 5 SOLUTION--
CREATE view vwcustomerorder AS 
SELECT
   c.customernumber,
   o.ordernumber,
   o.orderdate,
   p.productname,
   od.quantityordered,
   od.priceeach 
FROM
   customers c 
   LEFT JOIN
      orders o 
      ON c.customernumber = o.customernumber 
   INNER JOIN
      orderdetails od 
      ON o.ordernumber = od.ordernumber 
   INNER JOIN
      products p 
      ON od.productcode = p.productcode;
--b--
SELECT
   * 
FROM
   vwcustomerorder;
--QUESTION 6 SOLUTION --  
SELECT
   * 
FROM
   vwcustomerorder 
WHERE
   customernumber = '124' 
ORDER BY
   ordernumber ASC;
--QUESTION 7 SOLUTION-- 
SELECT
   c.customernumber,
   e.firstname,
   e.lastname,
   c.phone,
   c.creditlimit 
FROM
   customers c 
   LEFT JOIN
      employees e 
      ON c.salesrepemployeenumber = e.reportsto 
   INNER JOIN
      orders o 
      ON c.customernumber = o.customernumber 
WHERE
   shippeddate IS NULL;
--QUESTION 8-- 
CREATE view vwemployeemanager AS 
SELECT
   c.salesrepemployeenumber,
   c.contactfirstname,
   c.contactlastname,
   e.* 
FROM
   customers c 
   FULL JOIN
      employees e 
      ON c.salesrepemployeenumber = e.employeenumber 
   INNER JOIN
      offices o 
      ON e.officecode = o.officecode;
--Question 9  Solution---
DROP view vwcustomerorder;
DROP view vwemployeemanager;