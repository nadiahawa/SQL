--1. How many actors are there with the last name ‘Wahlberg’?
select count(last_name) 
from actor
where last_name = 'Wahlberg';


--2. How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99;


--3. What film does the store have the most of? (search in inventory)
select film_id
from inventory
group by film_id
order by count(film_id) asc
limit 1;


--4. How many customers have the last name ‘William’?
select count(last_name) 
from customer
where last_name = 'William'


--5. What store employee (get the id) sold the most rentals?
select staff_id
from rental r 
group by staff_id
order by count(staff_id) desc
limit 1;



--6. How many different district names are there?
select count(distinct district)
from address;


--7. What film has the most actors in it? (use film_actor table and get film_id)

select max(distinct film_id), film_id 
from film_actor
group by film_id;
--COME BACK TO THIS ONE

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(last_name)
from customer c
where last_name like '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)

select *
from payment;

SELECT count(distinct amount) 
from payment;

select
from payment;
where count(amount) > 250;


where count(amount) > 250
group by customer_id between 380 and 430;

select customer_id, sum(customer_id)
from payment
where customer_id between 380 and 430;


select payment.customer_id, first_name, last_name, sum(amount)
from payment
join customer
on payment.customer_id = customer.customer_id
group by payment.customer_id, first_name , last_name
having sum(amount) > 1000;

--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select count(distinct rating)
from film;

select rating
from film
group by rating
order by count(rating) desc
limit 1;

