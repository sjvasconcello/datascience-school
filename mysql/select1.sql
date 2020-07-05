SELECT name, email, gender FROM clients
WHERE gender = "F";

SELECT YEAR(NOW()) - YEAR(birthdate)
FROM clients;
SELECT name , YEAR(NOW()) - YEAR(birthdate) AS years
FROM clients;


SELECT name, email ,YEAR(NOW()) - YEAR(birthdate) AS age, gender
FROM clients 
WHERE gender = "F" AND name LIKE "%Lop%";