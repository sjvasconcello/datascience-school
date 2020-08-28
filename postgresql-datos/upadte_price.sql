SELECT
    peliculas.pelicula_id,
    tipos_cambio.tipo_cambio_id,
    tipos_cambio.cambio_usd * peliculas.precio_renta AS precio_msn
FROM
    peliculas,
    tipos_cambio
WHERE
    tipos_cambio.codigo = 'MXN';


CREATE TRIGGER trigger_update_tipos_cambio
    AFTER INSERT OR UPDATE
    ON public.peliculas
    FOR EACH ROW 
    EXECUTE PROCEDURE public.precio_peliculas_tipo_cambio();


    