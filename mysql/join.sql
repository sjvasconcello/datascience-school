SELECT b.book_id, a.name, b.title, a.author_id
FROM books as b
JOIN authors as a 
ON a.author_id = b.author_id
WHERE a.author_id BETWEEN 1 AND 5;

SELECT c.name, b.title, a.name, t.type
FROM transactions AS t 
JOIN books AS b ON t.book_id = b.book_id
JOIN clients AS c ON t.client_id = c.client_id
JOIN authors AS a ON b.author_id = a.author_id
WHERE c.gender = "F" AND t.type IN ("sell","lend");