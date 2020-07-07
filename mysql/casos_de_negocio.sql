-- Que nacionalidades hay
SELECT DISTINCT nacionality FROM authors;

-- Cuantos escritores hay de cada nacionalidad
SELECT nationality, COUNT(author_id) AS c_authors
FROM authors 
WHERE nationality IS NOT NULL AND nationality <> "RUS"
GROUP BY nationality  
ORDER BY c_authors DESC, nationality ASC;

-- Cual es el promedio/desviacion standard del percio de los libros
-- SELECT title, price FROM books ORDER BY price ASC LIMIT 10;
SELECT nationality, COUNT(book_id) AS libros,AVG(price) AS prom, STDDEV(price) AS std 
FROM books AS b JOIN authors AS a ON a.author_id = b.author_id
GROUP BY nationality ORDER BY libros DESC;

-- Precio maximo de un libro
SELECT a.nationality , MAX(price), MIN(price)
FROM books AS b JOIN authors AS a 
ON a.author_id = b.author_id
GROUP BY nationality;

SELECT c.name, t.type, b.title, 
    CONCAT(a.name, " (",  a.nationality, ")") AS author,
    TO_DAYS(NOW()) - TO_DAYS(t.created_at) AS ago
FROM transactions AS t 
LEFT JOIN clients AS c 
ON c.client_id = t.client_id
LEFT JOIN books AS b 
ON b.book_id = t.book_id
LEFT JOIN authors AS a 
ON b.author_id = a.author_id;

SELECT TO_DAYS(NOW())