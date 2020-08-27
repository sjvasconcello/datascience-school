CREATE OR REPLACE FUNCTION movies_stats()
RETURNS VOID
LANGUAGE plpgsql
AS $$
-- Declare variables
DECLARE
    total_rated_r REAL := 0.0;
    total_larger_than_100 REAL := 0.0;
    total_published_2006 REAL := 0.0;
    averange_duration REAL := 0.0;
    averange_rental_price REAL := 0.0;
BEGIN
    total_rated_r := COUNT(*) FROM peliculas WHERE clasificacion = 'R';
    total_larger_than_100 := COUNT(*) FROM peliculas WHERE duracion > 100;
    total_published_2006 := COUNT(*) FROM peliculas WHERE anio_publicacion = 2006;
    averange_duration := AVG(duracion) FROM peliculas;
    averange_rental_price := AVG(precio_renta) FROM peliculas;
    
    TRUNCATE TABLE peliculas_estadisticas;

    INSERT INTO peliculas_estadisticas(tipo_estadistica, total)
    VALUES
        ('Peliculas con clasificacion R', total_rated_r),
        ('Peliculas de mas de 100 minutos', total_larger_than_100),
        ('Peliculas publicadas en 2006', total_published_2006),
        ('Promedio de duracion de las peliculas', averange_duration),
        ('Precio promedio de renta', averange_rental_price);
END
$$;

SELECT movies_stats();

SELECT * FROM peliculas_estadisticas;