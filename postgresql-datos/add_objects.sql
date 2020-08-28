SELECT
    MIN(CAST(info -> 'items' ->> 'cantidad' AS integer)),
    MAX(CAST(info -> 'items' ->> 'cantidad' AS integer)),
    SUM(CAST(info -> 'items' ->> 'cantidad' AS integer)),
    AVG(CAST(info -> 'items' ->> 'cantidad' AS integer))
FROM
    ordenes;

