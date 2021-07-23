USE POS
-- 17.Write a query to get below result from orders table using GROUP BY.
SELECT customer_id, YEAR(order_date) AS 'order_year' FROM orders WHERE customer_id IN(1,2) ORDER BY customer_id ASC

-- 18.Write a query to get below result from orders table using GROUP BY.
SELECT DISTINCT customer_id, YEAR(order_date) AS 'order_year' FROM orders WHERE customer_id IN(1,2) ORDER BY customer_id ASC

-- 19.Write a query to get the number of customers in every city using GROUP BY.
SELECT city,COUNT(customer_id) AS customer_count FROM customers GROUP BY city ORDER BY city

-- 20.Write a query to get the number of customers by state and city using GROUP BY.
SELECT city,state,COUNT(customer_id) AS customer_count FROM customers GROUP BY city, state ORDER BY city

-- 21.Write a stored procedure to insert record into customers table using parameterized stored procedure. 
-- (declare parameters for all fields except auto incremented field)
CREATE PROCEDURE uspAddCustomers(
@first_name varchar(255),
@last_name varchar(255),
@phone varchar(25),
@email varchar(255),
@street varchar(255),
@city varchar(50),
@state varchar(25),
@zip_code varchar(5)
)
AS
BEGIN
	INSERT INTO customers(first_name,last_name,phone,email,street,city,state,zip_code)
	VALUES(@first_name,@last_name,@phone,@email,@street,@city,@state,@zip_code) 
END

EXEC uspAddCustomers @first_name='vvv',@last_name='ccc',@phone='10019',@email='ad@gg.com',@street='120 street',@city='WF',@state='NC',@zip_code=11111
SELECT * FROM customers WHERE first_name='vvv'

DROP PROCEDURE uspAddCustomers;  
GO

--- 22. Write a stored procedure to delete record from customers table using parameterized stored procedure by taking customerid as input.
CREATE PROCEDURE uspDeleteCustomers
       @customer_id int
AS
BEGIN
       SET NOCOUNT ON;
       DELETE customers WHERE customer_id = @customer_id
END
EXEC uspDeleteCustomers @customer_id=1478
SELECT*FROM customers


--- 23.Write a stored procedure to update record for customers table using parameterized stored procedure. 
--- (declare parameters for all fields except auto incremented field)
CREATE PROCEDURE uspUpdateCustomers
@customer_id int,
@first_name varchar(255),
@last_name varchar(255),
@phone varchar(25),
@email varchar(255),
@street varchar(255),
@city varchar(50),
@state varchar(25),
@zip_code varchar(5)

AS
BEGIN
       SET NOCOUNT ON;
    -- Insert statements for procedure here
       UPDATE customers SET first_name = @first_name, last_name = @last_name,
              phone = @phone, email = @email, street = @street,
			  city = @city, state = @state, zip_code = @zip_code WHERE customer_id = @customer_id
END

EXEC uspUpdateCustomers @customer_id=1476, @first_name='vvv',@last_name='ccc',@phone='10019',@email='ad@gg.com',@street='120 street',@city='WF',@state='NC',@zip_code=77777
SELECT*FROM customers
