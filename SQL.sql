
set echo on
SPOOL H:\ICS112\lab06\Lab6_Sol.txt
SET PAGESIZE 50
SET LINESIZE 120

/*********************************
 Assignment - Lab 6 Solution
 By <give your name>
 Lab Section: 1A or 1B or 2A or 2B
 Amount of time worked on this lab: x.xx hrs
 
 **********************************/

/***********************************************/
/***                                         ***/
/*** Part 1 Processing Date and Time in SQL  ***/
/***                                         ***/
/***********************************************/
 -- Create and populate the tables needed for Lab 6

-- Create the tables

CREATE TABLE customers (
  customer_id INTEGER
    CONSTRAINT customers_pk PRIMARY KEY,
  first_name VARCHAR2(10) NOT NULL,
  last_name VARCHAR2(10) NOT NULL,
  dob DATE,
  phone VARCHAR2(12)
);

CREATE TABLE product_types (
  product_type_id INTEGER
    CONSTRAINT product_types_pk PRIMARY KEY,
  name VARCHAR2(10) NOT NULL
);

CREATE TABLE products (
  product_id INTEGER
    CONSTRAINT products_pk PRIMARY KEY,
  product_type_id INTEGER
    CONSTRAINT products_fk_product_types
    REFERENCES product_types(product_type_id),
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(50),
  price NUMBER(5, 2)
);

CREATE TABLE order_status (
  order_status_id INTEGER
    CONSTRAINT default_example_pk PRIMARY KEY,
  status VARCHAR2(20) DEFAULT 'Order placed' NOT NULL,
  last_modified DATE DEFAULT SYSDATE
);

CREATE TABLE product_changes (
  product_id INTEGER
    CONSTRAINT prod_changes_pk PRIMARY KEY,
  product_type_id INTEGER
    CONSTRAINT prod_changes_fk_product_types
    REFERENCES product_types(product_type_id),
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(50),
  price NUMBER(5, 2)
);

-- insert sample data into customers table

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  1, 'John', 'Brown', '01-JAN-1965', '800-555-1211'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  2, 'Cynthia', 'Green', '05-FEB-1968', '800-555-1212'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  3, 'Steve', 'White', '16-MAR-1971', '800-555-1213'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  4, 'Gail', 'Black', NULL, '800-555-1214'
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  5, 'Doreen', 'Blue', '20-MAY-1970', NULL
);

INSERT INTO customers (
  customer_id, first_name, last_name, dob, phone
) VALUES (
  6, 'Stephanie', 'Jobs', '21-JUN-1980', NULL
);


-- commit the transaction

COMMIT;

-- insert sample data into product_types table

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  1, 'Book'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  2, 'Video'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  3, 'DVD'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  4, 'CD'
);

INSERT INTO product_types (
  product_type_id, name
) VALUES (
  5, 'Magazine'
);

-- commit the transaction

COMMIT;

-- insert sample data into products table

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  1, 1, 'Modern Science', 'A description of modern science', 19.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  2, 1, 'Chemistry', 'Introduction to Chemistry', 30.00
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  3, 2, 'Supernova', 'A star explodes', 25.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  4, 2, 'Tank War', 'Action movie about a future war', 13.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  5, 2, 'Z Files', 'Series on mysterious activities', 49.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  6, 2, '2412: The Return', 'Aliens return', 14.95
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
)
VALUES (
  7, 3, 'Space Force 9', 'Adventures of heroes', 13.49
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  8, 3, 'From Another Planet', 'Alien from another planet lands on Earth', 12.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  9, 4, 'Classical Music', 'The best classical music', 10.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  10, 4, 'Pop 3', 'The best popular music', 15.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  11, 4, 'Creative Yell', 'Debut album', 14.99
);

INSERT INTO products (
  product_id, product_type_id, name, description, price
) VALUES (
  12, NULL, 'My Front Line', 'Their greatest hits', 13.49
);

-- commit the transaction
COMMIT;

-- insert sample data into order_status table

INSERT INTO order_status (
  order_status_id
) VALUES (
  1
);

INSERT INTO order_status (
  order_status_id, status, last_modified
) VALUES (
  2, 'Order shipped', '10-JUN-2004'
);

-- commit the transaction
COMMIT;

-- insert sample data into product_changes table

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  1, 1, 'Modern Science', 'A description of modern science', 40.00
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  2, 1, 'New Chemistry', 'Introduction to Chemistry', 35.00
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  3, 1, 'Supernova', 'A star explodes', 25.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  13, 2, 'Lunar Landing', 'Documentary', 15.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  14, 2, 'Submarine', 'Documentary', 15.99
);

INSERT INTO product_changes (
  product_id, product_type_id, name, description, price
) VALUES (
  15, 2, 'Airplane', 'Documentary', 15.99
);

-- commit the transaction
COMMIT;


-- Get the date of the run for information
SELECT TO_CHAR(SYSDATE, 'Day Month DD HH24:MM') As "Script Run" 
FROM DUAL;

/*** 1 ***/
/* For each employee whose last name begins with a P, display the employee's 
last name and calculate the number of months between today and the date the 
employee was hired. Label the column "Months Worked" (note case). Order your 
results in descending order by the number of months employed. Round the 
number of months so that there is only a single digit after the decimal. */

/* Place SQL statement here */
select last_name, round(months_between(SYSDATE, hire_date),1) as "Months Worked"
from employees
where lower(last_name) like 'p%' 
order by months_between(SYSDATE, hire_date) desc ;

/*** 2 ***/
/* Your company is considering providing a special lunch every month for all
employees who have worked for the company at least 20 years. They will be 
invited to the lunch in the month in which they were hired. To get an idea 
of how many employees might come to a special lunch each month over the 
calendar year, your boss has asked you to write a query to return the number 
of employees who will have worked for the company at least 20 years divided 
into groupings by month. (See lab write-up for further details.) */

/* Place SQL statement here */
select count(last_name) , to_char(hire_date, 'Month')
from employees
where months_between (sysdate, hire_date)>240
group by to_char(hire_date, 'Month')
order by to_date(to_char(hire_date, 'Month'),'Month') ;
/*** 3 ***/
/* Your boss wants to know how many people might come who are of legal 
drinking age in British Columbia (in other words, are at least 19 as of 
December 3rd). You need to write a query to count the number of people 
in the people database who are at least 19 by that date. You will use the 
ICS112.PEOPLE table for this query. (See lab write-up for further details.)*/

/* Place SQL statement here */
select count(current_last_name)
from ics112.people
where months_between('03-DEC-16', birth_date)>=19*12;

/***********************************************/
/***                                         ***/
/*** Part 2 Changing Table Contents with DML ***/
/***                                         ***/
/***********************************************/

/*** 1 Insert ***/
REM SQL command here
insert into customers(customer_id,first_name,last_name,dob,phone)
values (50,'Grace','Hopper',to_date('December 9, 1906', 'Month DD, YYYY'),'800-555-1250');

insert into customers(customer_id,first_name,last_name,dob,phone)
values (51,'Steve','Jobs',to_date('February 24, 1955', 'Month DD, YYYY'),'800-555-1251');

insert into customers(customer_id,first_name,last_name,dob,phone)
values (52,'Larry','Ellison',to_date('August 17, 1994', 'Month DD, YYYY'),'800-555-1252');

insert into customers(customer_id,first_name,last_name,dob,phone)
values (53,'Tom','Thomson',to_date('August 4, 1877', 'Month DD, YYYY'), NULL);




/*** 2 Confirm ***/
REM SQL command here
select *
from customers
order by customer_id;



/*** 3 Correct last name ***/
REM SQL command here
update customers
set last_name='Thomas'
where customer_id=53;




/*** 4 Remove Jobs ***/
REM SQL command here
delete from customers
where lower(last_name)='jobs' and lower(first_name)='steve';



/*** 5 Update customer_ids ***/
REM SQL command here
update customers
set customer_id=100+customer_id;



/*** 6 Confirm changes ***/
REM SQL command here
select *
from customers
order by customer_id;



/*** 7 Create Savepoint ***/
REM SQL command here
savepoint cust_savep;




/*** 8 Add yourself ***/
REM SQL command here
insert into customers(customer_id,first_name,last_name,dob,phone)
values(01,'Abhishek','Gupta',to_date('16-DEC-1998'),'250=514-8197');




/*** 9 Confirm changes ***/
REM SQL command here
select *
from customers
order by customer_id;




/*** 10 Rollback to savepoint ***/
REM SQL command here
rollback to cust_savep;



/*** 11 List contents ***/
REM SQL command here
select *
from customers
order by customer_id;



/*** 12 Rollback ***/
REM SQL command here
rollback to cust_savep;



/*** 13 List contents ***/
REM SQL command here
select *
from customers
order by customer_id;





/*** 14 Re-insert yourself ***/
REM SQL command here
insert into customers(customer_id,first_name,last_name,dob,phone)
values(01,'Abhishek','Gupta',to_date('16-DEC-1998'),'250-514-8197');




/*** 15 Commit ***/
REM SQL command here
commit;




/*** 16 List contents ***/
REM SQL command here
select *
from customers
order by customer_id;




/*** 17 Rollback to savepoint & explanation ***/
REM SQL command here
rollback to cust_savep;

/*** we have done commit in step 15, which is a permanent change. so we cant do rollback once permanent changes are made***/



/*** 18 List contents ***/
REM SQL command here
select *
from customers
order by customer_id;




/*** 19 Select all records ***/
REM SQL command here
select customer_id, first_name, last_name, to_char(dob,'Month dd, yyyy'), phone
from customers;




/*** 20 Spool off ***/



/*** Drop the tables ***/

/* run script to DROP tables */
DROP TABLE product_changes PURGE;
DROP TABLE products PURGE;
DROP TABLE customers PURGE;
DROP TABLE product_types PURGE;
DROP TABLE order_status PURGE;

SPOOL OFF

/***********************************************/
/***                                         ***/
/***          End of SQL script              ***/
/***                                         ***/
/***********************************************/



