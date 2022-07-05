-- preg 4
-- 4. Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT email, u.id, titulo
	FROM public.usuarios u
    inner join posts p 
    on u.id=p.usuario_id
    where u.id=5

-- preg 5
-- Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
-- por el usuario con email usuario06@hotmail.com.
SELECT email, u.id, texto, fecha
	FROM public.usuarios u
    inner join comentarios c 
    on u.id=c.usuario_id
    where u.email!='usuario06@hotmail.com'

