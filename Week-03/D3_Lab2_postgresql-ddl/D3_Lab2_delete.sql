-- Bonus Challenge - Deleting Database Records

-- Deleting duplicated car entry for VIN `DAM41UDN3CHU2WVF6`

DELETE FROM cars
	WHERE vehicle_id = 'DAM41UDN3CHU2WVF6' AND model = 'V60';
	
SELECT * FROM cars;