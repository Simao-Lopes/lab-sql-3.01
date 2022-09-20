use sakila;

-- 1.Drop column picture from staff.
alter table sakila.staff
drop picture;
    
-- 2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into sakila.staff(first_name, last_name, email, address_id, store_id, username)
values('TAMMY','SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', 79, 2, 'tammy');

-- We searched address and there was already a customer Tammy Sanders wich we are assuming is the same person, as we can see with the querry bellow, 
-- but if she was a new Tammy Sanders we have to insert first a new address and then we can create the new staff member.
select *
from customer
where last_name = 'Sanders';

    
-- 3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; - -- Customer Id - 130

select film_id, rental_duration from film
where title = 'Academy Dinosaur'; -- Academy Dinosaur id is 1, rental duration is 6

select inventory_id from sakila.inventory
where film_id = 1; -- Inventory Id from 1 - 8

select *
from staff; -- From here we can see that Mike Hillyer staff_id is 1

-- Actual answer
insert into sakila.rental(rental_date, inventory_id, customer_id, return_date, staff_id)
values(current_timestamp,1, 130, date_format(current_timestamp, '%Y-%m-%d %T'),1);

