SELECT * FROM public.consolidado;

--Agrupamiento para calcular la afluencia 

SELECT * 
FROM public.consolidado c
JOIN public.estacion e 
ON c.id_estacion = e.id_estacion
JOIN public.linea l 
ON e.id_linea = l.id_linea;

--promedio por linea

SELECT l.nombre, avg(afluencia)
FROM public.consolidado c
JOIN public.estacion e 
ON c.id_estacion = e.id_estacion
JOIN public.linea l 
ON e.id_linea = l.id_linea
GROUP BY l.nombre;

SELECT l.nombre, avg(afluencia)
FROM public.consolidado c
JOIN public.estacion e 
ON c.id_estacion = e.id_estacion
JOIN public.linea l 
ON e.id_linea = l.id_linea
GROUP BY l.nombre
ORDER BY 2;

-- Calcular la afluencia total por estacion
SELECT e.nombre,
sum	 (c.afluencia)
FROM public.estacion e
JOIN public.consolidado c
	ON e.id_estacion = c.id_estacion
	GROUP BY e.nombre
	ORDER BY 1;

--Calcular la afluencia minima y maxima por año

SELECT EXTRACT (YEAR FROM fecha) AS  anio,
	min (afluencia),
	max (afluencia)
FROM public.consolidado
	WHERE afluencia > 10
	GROUP BY 1;

--Contar el numero de registros por tipo de pago
SELECT tp. nombre, sum (c.afluencia)
FROM public.consolidado c
	JOIN public.tipo_pago tp
	ON c.id_tipo_pago = tp.id_tipo_pago
	GROUP BY 1;

--