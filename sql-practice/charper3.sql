SELECT * 
FROM dealerships
WHERE state='CA';

SELECT *
FROM salespeople
WHERE dealership_id in (2,5)
ORDER BY 1;