-- Reference: http://code.tutsplus.com/articles/sql-for-beginners-part-3-database-relationships--net-8561

-- Cross Join (Cartesian Product) - each row from first table matches each row of the second table
-- Matching columns irrelevant
-- Customer ID displayed twice
select * from customers join orders;
-- OR
select * from customers, orders;

-- Natural Join
-- Needs matching columns
-- Customer ID displayed once
select* from customers NATURAL JOIN orders;

-- Inner Join
-- This is the exact same as natural join
-- However the customer_id is displayed twice
select * from customers JOIN orders
WHERE customers.`customer_id` = orders.`customer_id`

-- Inner Join with ON
-- This allows you to specific a seperate condition and free up the WHERE
select * from customers JOIN orders
on customers.`customer_id` = orders.`customer_id`
where orders.`amount` > 15

-- USING Clause
-- This works similar to ON clause, but it's shorter
-- If the column is the same on both tables
-- USING <common_column>
-- Also there is NO DUPLICATE column name
select * from customers JOIN orders
USING (customer_id)
where orders.`amount` > 15

-- LEFT (OUTER) Join
-- A left join is a type of outer join
-- If there is no match found from the second table, the record from the first table is still displayed
-- THIS is useful for finding records that do not have relationships
-- For eg. We can search for customers who have not placed any orders
-- OUTER is optional
select * from customers LEFT OUTER JOIN orders
USING (customer_id)
-- OR
select * from customers LEFT JOIN orders
USING (customer_id)

-- RIGHT (OUTER) JOIN
-- A right join is a type of outer join
-- No nulls as it 
select * from customers RIGHT OUTER JOIN orders
USING (customer_id) 
-- OR to GET NULL
select * from orders RIGHT OUTER JOIN customers
USING (customer_id)








