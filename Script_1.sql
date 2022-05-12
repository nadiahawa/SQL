-- Two dashes is a single line comment
--HELLO SQL WORLD!

--Today we will be discussing DQL = data query language
--speicifcally simple select statements


--The Hello World program of sql: is the select all rows and columns from a table

select *
from actor;

--a select statement needs at minimum two clauses:
--a select clause to specify which columns are being selected
--and a fro mclause to specifiy which table we are selecting from 

--select * from <table>; commonly used as an exploratory query
--to show you (the dev) what info exists within a table
select * from customer;

--what if i didnt want every column in a table
--justspecifiy column youd like to query/select in the select clause
select first_name, last_name
from actor;

--WHERE clause
--filter our results by a condition-this will alter the rows that get returned

select first_name, last_name
from actor
where last_name = 'Wahlberg';

--the order of clauses in a statment matters
--follows the rule: least specific to most specific
--column selection --> table selection ----> modifiers --> grouping --> ordering
--when writing a where clause with string -= you can used the like operator 
--tis eneables the use of wildcards 

select first_name, last_name
from actor
where last_name like 'Wahlberg';

--WILDCARDS
--% and -
--% represents any number of character 9could be 0, could be 0987654)

select first_name, last_name
from actor
where last_name like 'W%';


select first_name, last_name
from actor
where first_name like 'A___';

-- _ represents single istance of character

select first_name, last_name
from actor
where first_name like '%nn%';

select * from payment;

select customer_id, amount
from payment
where amount > 10;

select customer_id, amount
from payment 
where amount > 10;

select customer_id, amount
from payment
where amount < 0.5 or amount > 300;
--where amount not between 10 and 20;

--can combine consitionals in diff columns into one hwere clause
--dont need to select a clumn in order to use that clumn in the where clause
--an alternative to the above queriy
--bewteen operator 

select first_name, last_name
from actor
where first_name like 'K%' and actor_id >100;

--ORDER by clause
--lets us sort our results
select customer_id, amount
from payment
where amount > 0
order by amount DESC;

-- order of these clauses must be:
--select <columns>
--from <table>
--where <conditional>
--order by <column>

--The use of sql aggregations --> aka how we take many rows of data and condense them into single easy to digest piece of infp

select *
from payment
where amount = 0.99;
--how many $0.99 payments have i recieved
--we can find the answer by looking at total rows in a noraml query


--option for aggregates: count(), sum(), avg(), min(), max()

select count(amount)
from payment
where amount = 0.99;


--how much money did we make freom 2683 psyments of 0.99
select sum(amount)
from payment
where amount = 0.99;


-- what waas the average payment amount
select avg(amount)
from payment;


--what if i wanted to select other columsn in addirtion to myy aggregegate result
--i cant without another clayuse
--use the group by clause to specify how non agregates should be behave when used laongside an aggregeate 
-- i ewant to know the nunmber of payments of wach amount
select count(amount), amount
from payment
group by amount;


--which payment amont have we made the most money off of 
select amount, sum(amount)
from payment
group by amount 
order by sum(amount) desc;
--weve made the most money off 4.99 sales

--which customer spend the most money?
select * from payment;

select customer_id, sum(amount)
from payment
group by customer_id 
order by sum(amount) desc;


-- how was customer 6s spending distrubyted
--we can do a multple group by 
--grou p by cust id and seconf group by amount
-- i can include a where clause with my aggregate 
select customer_id, amount, sum(amount)
from payment
where customer_id = 6
group by customer_id, amount;


--you can also use an aggregate in a where clause
--which of my customers have spent more than 1000 dollars
--having clause performs conditional role for aggregates
--just like the where clause is the cionditional clause for regulat columns
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) > 10000
order by customer_id;


-- two customers spent more than 1000
-- cust id 5/6

-- who are customer 5 and?
select * 
from customer
where customer_id = 5 or customer_id = 6;


select payment.customer_id, first_name, last_name, sum(amount)
from payment
join customer
on payment.customer_id = customer.customer_id
group by payment.customer_id, first_name , last_name
having sum(amount) > 1000;


--two speerate tables:
select * from payment;
select * from customer;


