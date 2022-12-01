USE sakila;
-- 1 Write a query to display for each store its store ID, city, and country.

SELECT s.store_id, city, country
FROM city ci
JOIN address a
ON ci.city_id = a.city_id
JOIN country co
ON ci.country_id = co.country_id
JOIN store s
ON a.address_id = s.address_id;



-- 2 Write a query to display how much business, in dollars, each store brought in.

SELECT st.store_id, COUNT(p.amount) as total_amount
FROM payment p
JOIN staff s
ON p.staff_id = s.staff_id
JOIN store st
ON st.store_id = s.store_id
GROUP BY store_id;

-- 3 Which film categories are longest?

SELECT cat.name AS category, AVG (f.length) AS film_length
FROM film_category fi
JOIN film f
ON fi.film_id = f.film_id
JOIN category cat
ON cat.category_id = fi.category_id
GROUP BY cat.name
ORDER BY film_length DESC; 



-- 4 Display the most frequently rented movies in descending order.

SELECT f.title, COUNT(rental_id) AS amount_rented
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY amount_rented DESC;


-- 5 List the top five genres in gross revenue in descending order.

SELECT cat.name, SUM(p.amount)
FROM category cat
JOIN film_category fic
ON cat.category_id = fic.category_id
JOIN inventory i
ON i.film_id = fic.film_id
JOIN rental r 
ON r.inventory_id = i.inventory_id
JOIN payment p 
ON p.customer_id = r.customer_id
GROUP BY cat.name
LIMIT 5;




-- 6 Is "Academy Dinosaur" available for rent from Store 1?




-- 7 Get all pairs of actors that worked together.




-- 8 Get all pairs of customers that have rented the same film more than 3 times.
-- 9 For each film, list actor that has acted in more films.