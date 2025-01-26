--Who is the senior most employee on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

-- Which countries have the most Invoices?

SELECT COUNT(*) as c, billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c DESC 


--What are top 3 values of total invoces?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3


/*
Which city has the best customers? We would like to throw a
promotional Music Festival in the city we made the most money. Write a
query that returns one city that has the highest sum of invoice totals.
Return both the city name & sum of all invoice totals
*/


SELECT SUM(total) as invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total DESC

/*
Who is the best customer? The customer who has spent the most
money will be declared the best customer. Write a query the Full screen (f)
the person who, has spent the most money
*/


SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
limit 1

/*
Write query to return the email, first name, last name, & Gen
all Rock Music listeners. Return your list ordered alphabetica
*/

SELECT DISTINCT email,first_name, last_name
FROM customer 
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
SELECT track_id FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
)
ORDER BY email;