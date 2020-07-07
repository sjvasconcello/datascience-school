DELETE FROM authors WHERE author_id = 161 LIMIT 1;

UPDATE clients SET active = 0 WHERE client_id = 80 LIMIT 1;

-- Investigar como usar el LIKE

SELECT selleble, SUM(price*copies) FROM books GROUP BY selleble;

SELECT sellable, SUM(price*copies) FROM books GROUP BY sellable;

SELECT COUNT(book_id), SUM(IF(year< 1970,1,0)) AS `<1970` FROM books;


SELECT a.nationality, COUNT(book_id), 
    SUM(IF(year < 1950,1,0)) AS `<1950`,
    SUM(IF(year >= 1950 AND year < 1990,1,0)) AS `<1990` ,
    SUM(IF(year >= 1990 AND year < 2000,1,0)) AS `<2000` ,
    SUM(IF(year>= 2000,1,0)) AS `hoy`
FROM books AS b
JOIN authors AS a 
ON a.author_id = b.author_id
WHERE a.nationality IS NOT NULL
GROUP BY nationality;

