-- pregunta 1
-- Cargar el respaldo de la base de datos unidad2.sql.








-- pregunta 2
-- -- El cliente usuario01 ha realizado la siguiente compra:
-- ● producto: producto9.
-- ● cantidad: 5.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento 
-- y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock.

-- (entonces hay que hacer uptdate a tabla producto)

BEGIN TRANSACTION;
INSERT INTO public.compra(
	 cliente_id, fecha)
	VALUES (1, now());
INSERT INTO public.detalle_compra(
	 producto_id, compra_id, cantidad)
	VALUES (9, (SELECT MAX(id) FROM compra), 5);
    UPDATE public.producto SET stock=stock-5 WHERE id=9;
    COMMIT;
    SELECT * FROM producto;


-- pregunta 3
-- El cliente usuario02 ha realizado la siguiente compra:
-- ● producto: producto1, producto 2, producto 8.
-- ● cantidad: 3 de cada producto.
-- ● fecha: fecha del sistema.
-- Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento
--  y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra.

BEGIN TRANSACTION;
INSERT INTO public.compra(
	 cliente_id, fecha)
	VALUES (2, now());
INSERT INTO public.detalle_compra(
	 producto_id, compra_id, cantidad)
	VALUES (1, (SELECT MAX(id) FROM compra), 3);
    UPDATE public.producto SET stock=stock-3 WHERE id=1;
INSERT INTO public.detalle_compra(
	 producto_id, compra_id, cantidad)
	VALUES (2, (SELECT MAX(id) FROM compra), 3);
    UPDATE public.producto SET stock=stock-3 WHERE id=2;
    SAVEPOINT checkpoint;
  INSERT INTO public.detalle_compra(
	 producto_id, compra_id, cantidad)
	VALUES (8, (SELECT MAX(id) FROM compra), 3);
    UPDATE public.producto SET stock=stock-3 WHERE id=8; 
    ROLLBACK TO checkpoint;
    COMMIT;
    SELECT * FROM producto;




-- pregunta 4 
-- Realizar las siguientes consultas
-- a. Deshabilitar el AUTOCOMMIT .
-- b. Insertar un nuevo cliente.
-- c. Confirmar que fue agregado en la tabla cliente.
-- d. Realizar un ROLLBACK.
-- e. Confirmar que se restauró la información, sin considerar la inserción del
-- punto b.
-- f. Habilitar de nuevo el AUTOCOMMIT.
