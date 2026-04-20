-- The Retail Insights Data Analyst SQL USE CASE
-- All the queries in this project have been successfully executed in Oracle Database 11g Express Edition.


-- CATEGORIES TABLE
CREATE TABLE categories (
categoryid int primary key,
categoryname varchar(50) not null
);

-- PRODUCTS TABLE
CREATE TABLE products (
productid int primary key,
productname varchar(100) not null,
categoryid int,
price decimal(10,2),
stockcount int default 0,
expirydate date,
foreign key (categoryid) references categories(categoryid)
);

-- SALESTRANSACTIONS TABLE
CREATE TABLE salestransactions (
transactionid int primary key,
productid int,
quantity int,
transactiondate date,
foreign key (productid) references products(productid)
);


insert into categories values (1,'Dairy');
insert into categories values (2,'Snacks');
insert into categories values (3,'Beverages');
insert into categories values (4,'Frozen foods');
insert into categories values (5,'Bakery');
insert into categories values (6,'Household');


insert into products values (101,'milk',1,50,80,sysdate+5);
insert into products values (102,'cheese',1,120,30,sysdate+20);
insert into products values (103,'butter',1,90,60,sysdate+4);
insert into products values (201,'potato chips',2,20,200,sysdate+180);
insert into products values (202,'biscuits',2,30,150,sysdate+90);
insert into products values (203,'nachos',2,70,20,sysdate+120);
insert into products values (301,'orange juice',3,60,70,sysdate+6);
insert into products values (302,'cola',3,40,40,sysdate+200);
insert into products values (303,'energy drink',3,110,25,sysdate+150);
insert into products values (401,'frozen pizza',4,200,10,sysdate+300);
insert into products values (402,'ice cream',4,150,90,sysdate+15);
insert into products values (403,'frozen veg mix',4,80,50,sysdate+25);
insert into products values (501,'bread',5,25,100,sysdate+3);
insert into products values (502,'cake',5,300,15,sysdate+2);
insert into products values (503,'croissant',5,40,60,sysdate+4);
insert into products values (601,'detergent',6,180,35,sysdate+500);
insert into products values (602,'soap',6,45,120,sysdate+400);
insert into products values (603,'shampoo',6,250,55,sysdate+600);
insert into products values (409,'veg mix',4,80,50,sysdate+30);
insert into products values (410,'fries',4,80,40,sysdate+28);


insert into salestransactions values (1,101,10,sysdate-10);
insert into salestransactions values (2,102,5,sysdate-25);
insert into salestransactions values (3,103,8,sysdate-40);
insert into salestransactions values (4,201,20,sysdate-15);
insert into salestransactions values (5,202,30,sysdate-5);
insert into salestransactions values (6,203,10,sysdate-70);
insert into salestransactions values (7,301,12,sysdate-8);
insert into salestransactions values (8,302,15,sysdate-90);
insert into salestransactions values (9,303,6,sysdate-3);
insert into salestransactions values (10,401,2,sysdate-100);
insert into salestransactions values (11,402,18,sysdate-12);
insert into salestransactions values (12,403,9,sysdate-45);
insert into salestransactions values (13,501,25,sysdate-2);
insert into salestransactions values (14,502,3,sysdate-60);
insert into salestransactions values (15,503,14,sysdate-7);
insert into salestransactions values (18,603,5,sysdate-33);

/* Write a query to find all products where the ExpiryDate is
within the next 7 days but StockCount is greater than 50.*/

-- EXPIRING SOON QUERY

select productname,stockcount,expirydate
from products where expirydate>=sysdate
and expirydate<=sysdate+7
and stockcount>50;

/* Identify products that exist in the Products table but have
zero entries in the SalesTransactions table for the last 2 months. */

-- DEAD STOCK ANALYSIS

SELECT p.productid,p.productname
FROM products p where not exists (
select 1 from salestransactions s
where s.productid=p.productid
and s.transactiondate>=sysdate-60
);

/* Write a query using SUM and GROUP BY to show which
Category generated the most revenue last month. */

-- REVENUE CONTRIBUTION

SELECT c.categoryname,nvl(sum(s.quantity*p.price),0) revenue
FROM categories c left join products p on c.categoryid=p.categoryid
left join salestransactions s on p.productid=s.productid
and s.transactiondate>=add_months(trunc(sysdate,'mm'),-1)
and s.transactiondate<trunc(sysdate,'mm')
group by c.categoryname order by revenue DESC;


