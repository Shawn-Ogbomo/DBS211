-- ***********************
-- Name: Shawn Ogbomo
-- ID: 022609127
-- Date: Thursday JUN 3 2021 
-- Purpose: Lab 02 DBS211
-- ***********************
-- Q1 SOLUTION --
SELECT
   officecode,
   city,
   state,
   country,
   phone 
FROM
   offices;
-- Q2 SOLUTION --
SELECT
   employeenumber,
   firstname,
   lastname,
   extension 
FROM
   employees 
WHERE
   officecode = 1 
ORDER BY
   employeenumber;
-- Q3 SOLUTION --
SELECT
   customernumber,
   customername,
   contactfirstname,
   contactlastname,
   phone 
FROM
   customers 
WHERE
   city = 'Paris';
-- Q4 SOLUTION --
SELECT
   customernumber,
   customername,
   contactlastname || ', ' || contactfirstname "contact name",
   phone 
FROM
   customers 
WHERE
   country = 'Canada' 
ORDER BY
   customername;
-- Q5 SOLUTION --
SELECT DISTINCT
   customernumber 
FROM
   payments 
ORDER BY
   customernumber;
-- Q6 SOLUTION --
SELECT
   customernumber,
   checknumber,
   amount 
FROM
   payments 
WHERE
   amount NOT BETWEEN 1500 AND 120000 
ORDER BY
   amount DESC;
-- Q7 SOLUTION --
SELECT
   ordernumber,
   orderdate,
   status,
   customernumber 
FROM
   orders 
WHERE
   status = 'Cancelled' 
ORDER BY
   orderdate ASC;
-- Q8 SOLUTION --
SELECT
   productcode,
   productname,
   buyprice,
   msrp,
   (
      msrp - buyprice
   )
   AS "markup",
   round (100 * (msrp - buyprice) / buyprice, 1) AS "percmarkup" 
FROM
   products 
WHERE
   (
      100 * (msrp - buyprice) / buyprice
   )
   > 140 
ORDER BY
(100 * (msrp - buyprice) / buyprice);
-- Q9 SOLUTION --
SELECT
   productcode,
   productname,
   quantityinstock 
FROM
   products 
WHERE
   productname LIKE '%co%' 
   OR productname LIKE '%CO%' 
   OR productname LIKE '%Co%' 
ORDER BY
   quantityinstock;
-- Q10 SOLUTION --
SELECT
   customernumber,
   contactfirstname,
   contactlastname 
FROM
   customers 
WHERE
   contactfirstname LIKE 's%' 
   AND contactfirstname LIKE '%e%' 
   OR contactfirstname LIKE 'S%' 
   AND contactfirstname LIKE '%e%';