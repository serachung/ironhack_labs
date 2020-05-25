-- Bonus Challenge - Updating Database Records (fixing errors in existing data)

-- 1. Salespersons table: spelled *Miami* as *Mimia* for Paige Turner
UPDATE salespersons
	SET store = 'Miami'
	WHERE store = 'Mimia';

SELECT * FROM salespersons WHERE store= 'Miami';

-- 2. Customers table: Updating email addresses
UPDATE customers SET email = 'ppicasso@gmail.com' WHERE name = 'Pablo Picasso';
UPDATE customers SET email = 'lincoln@us.gov' WHERE name = 'Abraham Lincoln';
UPDATE customers SET email = 'hello@napoleon.me' WHERE name = 'Napoléon Bonaparte';
UPDATE customers SET email = 'pablo@neruda.org' WHERE name = 'Pablo Neruda';

SELECT * FROM customers;
