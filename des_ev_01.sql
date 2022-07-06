-- desafio peliculas y reparto
-- preg 1:
-- Crear una base de datos llamada películas.
CREATE DATABASE peliculas
    WITH
    OWNER = mariajosewelkner
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- preg 2:
-- Cargar ambos archivos a su tabla correspondiente.
-- tabla peliculas
CREATE TABLE IF NOT EXISTS public.peliculas
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    pelicula character varying COLLATE pg_catalog."default" NOT NULL,
    ano_estreno character varying COLLATE pg_catalog."default" NOT NULL,
    director character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT peliculas_pkey PRIMARY KEY (id)
)
-- tabla reparto
CREATE TABLE IF NOT EXISTS public.reparto
(
    id integer NOT NULL,
    actor character varying COLLATE pg_catalog."default" NOT NULL
)

-- preg 3:
-- Obtener el ID de la película “Titanic”.
SELECT  id
	FROM public.peliculas
    where pelicula='Titanic';

-- preg 4: 
-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE ID=2 

-- preg 5:
-- Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT count(id) FROM reparto WHERE actor='Harrison Ford'

-- preg 6:
-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT pelicula  FROM  public.peliculas
    WHERE ano_estreno between '1990' and '1999'
    ORDER BY id ASC


-- preg 7:
-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.
SELECT pelicula,
    LENGTH(pelicula)
    AS longitud_titulo
    FROM  public.peliculas
   ORDER BY LENGTH(pelicula);


-- preg 8:
-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
   SELECT pelicula,
    LENGTH(pelicula)
    AS longitud_titulo
    FROM  public.peliculas
   ORDER BY LENGTH(pelicula)desc;


