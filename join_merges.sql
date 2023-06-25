SELECT customers.customerName
FROM customers
JOIN address ON customers.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN state ON city.state_id = state.state_id
WHERE state.stateName = 'Texas';
    
--Get all payments above $6.99 with the customer's full name
   
SELECT CONCAT(customers.firstName, ' ', customers.lastName) AS customerFullName, payments.amount
FROM customers
JOIN payments ON customers.customer_id = payments.customer_id
WHERE payments.amount > 6.99;

--Show all customer names that made payments over $175 (use a subquery)

SELECT CONCAT(customers.firstName, ' ', customers.lastName) AS customerFullName
FROM customers
WHERE customers.customer_id IN (SELECT payments.customer_id FROM payments WHERE payments.amount > 175);

--List all customers that live in Nepal (use the city table)

SELECT customers.customerName
FROM customers
JOIN address ON customers.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.countryName = 'Nepal';

--Which staff member had the most transactions?

SELECT CONCAT(staff.firstName, ' ', staff.lastName) AS staffMember, COUNT(*) AS transactionCount
FROM staff
JOIN payments ON staff.staff_id = payments.staff_id
GROUP BY staff.staffId
ORDER BY transactionCount DESC
LIMIT 1;
    
--What film had the most actors in it?

SELECT movies.title, COUNT(*) AS actorCount
FROM movies
JOIN movie_actor ON movies.movie_id = movie_actor.movie_id
GROUP BY movies.movie_id
ORDER BY actorCount DESC
LIMIT 1;

--Show all customers who have made a single payment above $6.99 (use subqueries)

SELECT CONCAT(customers.firstName, ' ', customers.lastName) AS customerFullName
FROM customers
JOIN payments ON customers.customer_id = payments.customer_id
WHERE payments.amount > 6.99
GROUP BY customers.customer_id
HAVING COUNT(*) = 1;

--Which category is most prevalent in the films?

SELECT categories.categoryName, COUNT(*) AS filmCount
FROM categories
JOIN movie_category ON categories.category_id = movie_category.category_id
GROUP BY categories.category_id
ORDER BY filmCount DESC
LIMIT 1;