SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a 
JOIN books AS b 
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;

SELECT a.author_id, a.name, a.nationality, b.title
FROM authors AS a 
LEFT JOIN books AS b 
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
ORDER BY a.author_id DESC;


SELECT a.author_id, a.name, a.nationality, COUNT(b.title)
FROM authors AS a 
LEFT JOIN books AS b 
ON b.author_id = a.author_id
WHERE a.author_id BETWEEN 1 AND 5
GROUP BY a.author_id 
ORDER BY a.author_id DESC;
