-- inner join
SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    inner join public.pokemones b 
    on a.pokedex=b.pokedex
    
-- left join, en este caso me trae 199 datos
SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    left join public.pokemones b 
    on a.pokedex=b.pokedex

-- full outer, en este caso me trae 242 datos
SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a
    full outer join public.pokemones b 
    on a.pokedex=b.pokedex

-- Nombre de los pokemones que fueron obtenidos por huevos
SELECT b.nombre, fecha_captura, lugar, huevo, peso, estatura
	FROM public.mis_pokemones a 
    inner join public.pokemones b 
    on a.pokedex=b.pokedex
    where a.huevo='true'

-- nombre d e los pokemones capturados que tienen un peso >200
SELECT b.nombre
	FROM public.mis_pokemones a 
    inner join public.pokemones b 
    on a.pokedex=b.pokedex
    where a.peso>200

