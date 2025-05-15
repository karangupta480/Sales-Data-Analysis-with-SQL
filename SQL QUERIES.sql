USE Practice;
CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 
INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'2017-09-22'),
(3,'2017-04-21');
CREATE TABLE users(userid integer,signup_date date); 
INSERT INTO users(userid, signup_date)   
VALUES 
(1, '2014-09-02'), 
(2, '2015-01-15'), 
(3, '2014-04-11');
CREATE TABLE zomato_sales(userid integer,created_date date,product_id integer); 

INSERT INTO zomato_sales(userid, created_date, product_id)  
VALUES 
(1, '2017-04-19', 2),
(3, '2019-12-18', 1),
(2, '2020-07-20', 3),
(1, '2019-10-23', 2),
(1, '2018-03-19', 3),
(3, '2016-12-20', 2),
(1, '2016-11-09', 1),
(1, '2016-05-20', 3),
(2, '2017-09-24', 1),
(1, '2017-03-11', 2),
(1, '2016-03-11', 1),
(3, '2016-11-10', 1),
(3, '2017-12-07', 2),
(3, '2016-12-15', 2),
(2, '2017-11-08', 2),
(2, '2018-09-10', 3);

CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);
select * from zomato_sales;
select * from product;
select * from goldusers_signup;
select * from users;

-- What is the total amount spent by each customer on zomato?
select a.userid, sum(b.price) as total_amount from zomato_sales as a join product as b on a.product_id = b.product_id group by a.userid;

-- How many days each customer visited zomato?

select userid, count(distinct created_date) as numbers_of_days from zomato_sales group by userid;


-- what was the first product purchase by each customer?

select * from (select *, rank() over(partition by userid order by created_date) as rnk from zomato_sales) as a where rnk = 1;
 
-- What is most purchased product and how many times was it purchased by all customers?

SELECT userid, COUNT(product_id) AS cnt
FROM zomato_sales
WHERE product_id = (
    SELECT product_id
    FROM zomato_sales
    GROUP BY product_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY userid;

-- which product is most popular for each customer

select * from 
(select userid, product_id, total, rank() over (partition by userid order by total desc) as rnk from 
(select userid, product_id, count(product_id) as total 
from zomato_sales group by userid, product_id) as a) as b where rnk =1;


-- Which product purchased first by customer after becoming gold member

select * from 
(select *, row_number() over (partition by userid order by created_date) as c from 
(select a.userid, a.gold_signup_date, b.created_date, b.product_id from 
goldusers_signup as a
left join zomato_sales as b on a.userid=b.userid where a.gold_signup_date < b.created_date)as a) as b where c =1;

-- which product was purchased just before the customer become the member
select * from (select*, row_number() over(partition by userid order by created_date desc) as a from 
(select a.userid, a.gold_signup_date, b.created_date, b.product_id from 
goldusers_signup as a
left join zomato_sales as b on a.userid=b.userid where a.gold_signup_date > b.created_date) as b) as c where a =1 ;



-- What is the total order and amount spent by the customer before becoming the member

use practice;
select a.userid, count(a.product_id) as total_order, sum(b.price) as total_amount from zomato_sales as a join product as b on a.product_id = b.product_id
join goldusers_signup as c
on a.userid = c.userid
where a.created_date< c.gold_signup_date
group by userid;


