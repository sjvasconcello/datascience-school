CREATE TABLE ordenes (
    ID serial NOT NULL PRIMARY KEY,
    info json NOT NULL
);

INSERT INTO ordenes(info)
VALUES (
    '{
    "cliente": "David Sanchez",
    "items": {
        "producto":"Cerveza",
        "cantidad": 2
    }}'
),
(   
    '{
    "cliente": "David Sanchez",
    "items": {
        "producto":"Ron",
        "cantidad": 6
    }}'
),
(    
    '{"cliente": "David Pavez",
    "items": {
        "producto":"Vino",
        "cantidad": 3
    }}'
);

-- As Json
SELECT info -> 'cliente' AS cliente FROM ordenes;

-- As String
SELECT info ->> 'cliente' AS cliente FROM ordenes;

SELECT info ->> 'cliente' AS cliente  FROM ordenes
WHERE info -> 'items' ->> 'producto' = 'Ron';