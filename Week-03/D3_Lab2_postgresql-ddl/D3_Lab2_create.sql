-- Challenge 2 - Create the Database and Tables

CREATE TABLE cars (
	vehicle_id char(30),
	manufacturer char(30),
	model char(30),
	model_year smallint,
	manuf_year smallint,
	color varchar(20));

CREATE TABLE customers (
	customer_id int,
	name char(50),
	phone char (50),
	email varchar(100),
	address text,
	city varchar(50),
	state_province varchar(50),
	country varchar(50),
	postal_code bigint,
	number_purchases smallint );
	
CREATE TABLE salespersons (
	staff_id int,
	staff_name char(100),
	post char(20),
	store char(50),
	hired_since smallint );
	
CREATE TABLE invoices (
	invoice_id int,
	sale_date char(10),
	vehicle_id char(30),
	customer_id int,
	staff_id int,
	sale_price int,
	discount decimal);