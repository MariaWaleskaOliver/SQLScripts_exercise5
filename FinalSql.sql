#Maria Waleska Marinho de Oliveira
#mmarinhodeoliver1749@conestogac.on.cache index
#Final Exam

CREATE DATABASE db_exam;

USE db_exam;
CREATE TABLE sales (
  id INT AUTO_INCREMENT,
  customer_id INT not null,
  product VARCHAR(255) not null,
  price DECIMAL(10,2) not null,
  quantity INT not null,
   total_price DECIMAL(10,2),
 primary key(id)
);
USE db_exam;
CREATE TABLE customers  (
customer_id INT, 
first_name VARCHAR(255) not null,
last_name VARCHAR(255) not null,
email VARCHAR(255) not null,
phone VARCHAR(255) not null,
 primary key(customer_id)
);
USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 1 ,10, "Keyboard", 49.99 , 3 , 149.97);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 2  ,20, "Mouse", 29.99 , 2 , 59.98);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 3  ,10, "Monitor", 199.99  , 1 , 199.99);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 4  ,30, "Keyboard ", 49.99  , 5 , 249.95
);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 5  ,20, "Headphones", 39.99  , 4 , 159.96
);

#--------------------------------------------------------------------------------#

USE db_exam;
INSERT INTO customers (customer_id, first_name, last_name, email,phone )
VALUES ( 10 ,"John", "Doe", "johndoe@example.com", "123-456-7890");

USE db_exam;
INSERT INTO customers (customer_id, first_name, last_name, email,phone )
VALUES ( 20 ,"Jane", "Doe", "janedoe@example.com", "456-789-0123");

USE db_exam;
INSERT INTO customers (customer_id, first_name, last_name, email,phone )
VALUES ( 30 ,"John", "Smith", "johnsmith@example.com", "789-012-3456");

USE db_exam;
INSERT INTO customers (customer_id, first_name, last_name, email,phone )
VALUES ( 40 ,"Jane", "Smith", "janesmith@example.com", "012-345-6789");

USE db_exam;
INSERT INTO customers (customer_id, first_name, last_name, email,phone )
VALUES ( 50 ,"Tom", "Smith", "tomsmith@example.com", "345-678-9012");

#Retrieve the data from the "sales" table created in the previous examples, and
#sort the results by the quantity column in ascending order, and only retrieve the
#first three rows [3 marks]
USE db_exam;
SELECT *
FROM sales
ORDER BY quantity ASC
LIMIT 3;

#Show the columns of id, product, quantity and total_price columns from the sales
#table where the total_price is more than 50 (including 50) and order it in
#ascending order [4 marks]
USE db_exam;
SELECT id, quantity, total_price 
FROM sales
WHERE total_price >= 50
ORDER BY total_price ASC;

#Alter and update the table Customers with a new column called "Full_name" that
#combines the first and last names from the customer table [4 mark

USE db_exam;
ALTER TABLE customers
ADD Full_name VARCHAR(255);

USE db_exam;
UPDATE customers
SET Full_name = concat(customers.first_name,"", customers.last_name);

#Select the product, price, total quantity and total price from the "sales" table, add
#two new columns called "tax" and "grand_total", and order the table by the
#"grand_total" column in ascending order. Tax will 13% of the total_price and grand
#total would be the total_price plust tax. Round the total price, tax and grand total
#to one decimal place [6 marks]

USE db_exam;
SELECT product, price, quantity, total_price,
  ROUND(total_price * 0.13, 1) AS tax,
  ROUND((total_price * 0.13) + total_price, 1) AS grand_total
FROM sales
ORDER BY grand_total ASC;



#Add a new column called "sales_date" to the "sales" table and insert the
#following dates into the table. [2 marks

USE db_exam;
ALTER TABLE sales
ADD sales_date VARCHAR(255) ;

USE db_exam;
UPDATE sales
SET sales_date = "2022-12-11"
WHERE id = 1;

USE db_exam;
UPDATE sales
SET sales_date = "2022-12-12"
WHERE id = 2;

USE db_exam;
UPDATE sales
SET sales_date = "2022-12-13"
WHERE id = 3;

USE db_exam;
UPDATE sales
SET sales_date = "2022-12-14"
WHERE id = 4;

USE db_exam;
UPDATE sales
SET sales_date = "2022-12-15"
WHERE id = 5;

#Write a query that retrieves the "sales_date" column from the "sales" table and
#formats it in the following format: "Day of the week, month day, year".

SELECT DATE_FORMAt(sales_date, '%M %d,%Y') AS sales_date_formatted
FROM sales;

#Write a query that extracts the month from a date column and name the
#column as “month” [2 marks]

USE db_exam;
SELECT EXTRACT(MONTH FROM sales_date) AS month
FROM sales;

#Write a query that retrieves the "product" and "quantity" columns from the "sales"
#table, calculates the average quantity for each product that contains the word
#"head" (case-insensitive) in its name, and only includes rows where the average
#quantity is greater than the average quantity for all products. Additionally, order
#the result in descending order by the average quantity. [8 marks]

USE db_exam;
SELECT product, AVG(quantity) AS avg_quantity
FROM sales
WHERE LOWER(product) LIKE '%head%'
GROUP BY product
HAVING AVG(quantity) > (SELECT AVG(quantity) FROM sales)
ORDER BY avg_quantity DESC;


#9. Insert the following rows into the sales table and then delete them [2 marks]
#(40, 'Laptop', 499.99, 1, 499.99),
#(50, 'Printer', 199.99, 2, 399.98),
#(60, 'Phone', 399.99, 3, 1199.97),
#(70, 'Tablet', 299.99, 4, 1199.96);


USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 6  , 40, 'Laptop', 499.99, 1, 499.99);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 7 , 50, 'Printer', 199.99, 2, 399.98);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 8 , 60 , 'Phone', 399.99, 3, 1199.97);

USE db_exam;
INSERT INTO sales (id, customer_id, product, price,quantity,total_price )
VALUES ( 9 , 70, 'Tablet', 299.99, 4, 1199.96);

DELETE FROM sales WHERE id = 6  ;
DELETE FROM sales WHERE id = 7  ;
DELETE FROM sales WHERE id = 8  ;
DELETE FROM sales WHERE id = 9  ;


#Write a MySQL statement to perform a cross join on the "sales" and "customers"
#tables from the previous questions [2 marks]

USE db_exam;
SELECT *
FROM sales CROSS JOIN customers;

#Write a MySQL statement to convert the "price" and "total_price" columns in the
#"sales" table from the previous questions to integer data types. The resulting
#table should have the same number of rows and the same data in all columns,
#except for the "price" and "total_price" columns, which should be integers. [3
#marks]

USE db_exam;
ALTER TABLE sales MODIFY price  INTEGER;
ALTER TABLE sales MODIFY total_price  INTEGER;

#Write a MySQL statement to create a new column in the "customers" table called
#"phone_formatted" that consists of the last 7 digits of each customer's phone
#number, formatted with leading zeros so that each number has a total of 10
#digits. The resulting table should have the same number of rows and the same
#data in all columns, except for the new "phone_formatted" column. [3 marks]
USE db_exam;
SELECT customer_id, Full_name, phone,
       CONCAT('0', SUBSTR(phone, -7)) AS phone_formatted
FROM customers;

#Write a query that uses a subquery and a join to retrieve data from the sales and
#customers tables in the db_exam database. The query should return the
#customer's first and last name, email, phone, and the product, price, and quantity
#of their purchases from the sales table (HINT: use subqueries) [6 marks]

SELECT c.first_name, c.last_name, c.email, c.phone,
       s.product, s.price, s.quantity
FROM customers c
JOIN (SELECT customer_id, product, price, quantity FROM sales ) s ON c.customer_id = s.customer_id;

#--------------------------------------------------------------------#
select * FROM customers;
select * FROM sales;