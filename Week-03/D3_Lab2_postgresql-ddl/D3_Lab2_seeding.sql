-- Challenge 3 - Seeding the Database

-- Cars table
INSERT INTO cars VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', '2018', 'Blue');
INSERT INTO cars VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', '2019', 'Red' );
INSERT INTO cars VALUES ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', '2017', 'White');
INSERT INTO cars VALUES ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', '2018', 'Silver');
INSERT INTO cars VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', '2019', 'Gray');
INSERT INTO cars VALUES ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross', '2019', '2019', 'Gray'); 

-- Customers table
INSERT INTO customers VALUES (10001 , 'Pablo Picasso', '+34 636 17 63 82', 'pablopicasso@gmail.com','Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045, 2);
INSERT INTO customers VALUES (20001 , 'Abraham Lincoln', '+1 305 907 7086','abe_linc@hotmail.com','120 SW 8th St', 'Miami', 'Florida', 'United States', 33130, 3);
INSERT INTO customers VALUES (30001 , 'Napoléon Bonaparte', '+33 1 79 75 4000','napo_bona@yahoo.com',' 40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008, 4);
INSERT INTO customers VALUES (10001 , 'Pablo Neruda', '+56 2 2777 87 41', null ,'Fernando Márquez de la Plata 0192', 'Providencia', 'Santiago', 'Chile', 00231, 6);


-- Salespersons
INSERT INTO salespersons VALUES(00001, 'Petey Cruiser', 'manager', 'Madrid', 2013);
INSERT INTO salespersons VALUES(00002, 'Anna Sthesia', 'junior', 'Barcelona', 2018);
INSERT INTO salespersons VALUES(00003, 'Paul Molive', 'senior', 'Berlin', 2010);
INSERT INTO salespersons VALUES(00004, 'Gail Forcewind', 'senior', 'Paris', 2015);
INSERT INTO salespersons VALUES(00005, 'Paige Turner', 'junior', 'Mimia', 2019);
INSERT INTO salespersons VALUES(00006, 'Bob Frapples', 'manager', 'Mexico City', 2005);
INSERT INTO salespersons VALUES(00007, 'Walter Melon', 'senior', 'Amsterdam', 2008);
INSERT INTO salespersons VALUES(00008, 'Shonda Leer', 'junior', 'São Paulo', 2020);

-- Invoices
INSERT INTO invoices VALUES (852399038, '22-08-2018', 'DAM41UDN3CHU2WVF6', 10001, 00001, 500000, 0.10);
INSERT INTO invoices VALUES (731166526, '31-12-2018', 'HKNDGS7CU31E9Z7JW', 20001, 00008, 400000, 0.03);
INSERT INTO invoices VALUES (271135104, '22-01-2019', 'ZM8G7BEUQZ97IH46V', 30001, 00005, 50000, 0.05);
