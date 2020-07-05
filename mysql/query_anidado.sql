INSERT INTO books (title, author_id) V
ALUES ('El laberinto de la Soledad', 6);

INSERT INTO books(title, author_id, `year`)
VALUES("Vuelta al Laberinto de la Soledad",(
SELECT author_id FROM authors
WHERE `name` = "Octavio Paz"
LIMIT 1),1920);