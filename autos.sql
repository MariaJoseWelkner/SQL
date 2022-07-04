CREATE DATABASE agencia_autos;
 CREATE TABLE IF NOT EXISTS public."autos"
(
    id bigint NOT NULL,
    marca text COLLATE pg_catalog."default" NOT NULL,
    modelo text COLLATE pg_catalog."default" NOT NULL,
    "año" integer NOT NULL,
    color character varying(20)[] COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Agencia_autos_pkey" PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.ventas
(
    id bigint NOT NULL,
    fecha date NOT NULL,
    cliente text COLLATE pg_catalog."default" NOT NULL,
    referencia text COLLATE pg_catalog."default",
    cantidad integer NOT NULL,
    id_auto bigint NOT NULL,
    CONSTRAINT ventas_pkey PRIMARY KEY (id),
    CONSTRAINT auto FOREIGN KEY (id_auto)
        REFERENCES public.autos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
\copy autos FROM '/Users/mariajosewelkner/Downloads/Apoyo Lectura - Base de datos relacionales
/autos.csv' csv header;
/*consulta con alias*/
SELECT marca, modelo, year as "año", color
	FROM public.autos;

/*punto 7*/
INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_auto)
	VALUES (1, '2020-01-05', 'Cesar Oses', 'compañero de trabajo', 2, 1);

INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_auto)
	VALUES (2, '2020-01-24', 'Miguel Angel', 'amigo', 1, 3);

/*punto 8, función suma*/
SELECT SUM(cantidad)as "autos vendidos" from ventas

/*punto 9, agregar columna*/
ALTER TABLE autos 
ADD estado text;

/*punto 10*/
INSERT INTO public.autos(
	id, marca, modelo, year, color, estado)
	VALUES (5, 'mazda', 'cx5', 2022, 'grafito', 'nuevo');

/*punto 11*/
UPDATE public.autos
	SET  marca='chevrolet', modelo='aveo'
	WHERE id=2;

/*punto 12*/
SELECT count(marca), marca
	FROM public.autos
    group by marca;