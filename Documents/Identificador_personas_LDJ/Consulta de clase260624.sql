SELECT * FROM public.match;
SELECT * FROM public.datosgenerales;

SELECT distinct (matches), avg (edad)
FROM public.match m
	JOIN public.datosgenerales d
	ON m.id_datos = d.id_datosgenerales
	GROUP BY matches
ORDER BY matches desc limit 5;

SELECT edad, COUNT (matches) AS mayoredad
	FROM public.match m
	JOIN public.datosgenerales d
	ON m.id_datos = d.id_datosgenerales
	WHERE matches = 160
	GROUP BY edad
	ORDER BY mayoredad desc
	limit 1;

SELECT matches, edad, COUNT (matches) AS mayoredad
	FROM public.match m
	JOIN public.datosgenerales d
	ON m.id_datos = d.id_datosgenerales
	WHERE matches IN (120,130,140,150,160)
	GROUP BY matches, edad
	ORDER BY mayoredad desc;

SELECT matches, edad, COUNT (matches) AS mayoredad
	FROM public.match m
	JOIN public.datosgenerales d
	ON m.id_datos = d.id_datosgenerales
	WHERE matches IN (120,130,140,150,160)
	GROUP BY matches, edad
	HAVING MAX (edad = 
	ORDER BY mayoredad desc, edad desc;