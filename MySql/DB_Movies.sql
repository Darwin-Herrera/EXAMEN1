--- ITEMS 1 ---
SELECT m.title, 
       CASE WHEN ml.language_id IS NULL THEN 'NO' ELSE 'YES' END AS SPANISH  
FROM movie m
LEFT JOIN movie_languages ml ON m.movie_id = ml.movie_id  
AND ml.language_id IN (24580, 24582)
WHERE m.movie_id IS NOT NULL 
ORDER BY m.title;

--- ITEMS 2 ---
SELECT m.title, g.genre_name 
FROM movie m 
LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id 
INNER JOIN genre g ON mg.genre_id = g.genre_id 
ORDER BY m.title;

--- ITEMS 3 ---
SELECT pc.company_name, MAX(m.vote_count)
FROM movie m 
LEFT JOIN movie_company mc ON m.movie_id = mc.movie_id 
INNER JOIN production_company pc ON mc.company_id  = pc.company_id 
GROUP BY pc.company_name 
ORDER BY MAX(m.vote_count) DESC
LIMIT 5;

--- ITEMS 4 ---
SELECT p.person_name AS NOMBRE_ACTOR_ACTRIZ, mc.character_name AS PERSONAJE_INTERPRETADO
FROM movie m 
LEFT JOIN movie_cast mc ON m.movie_id = mc.movie_id 
INNER JOIN person p ON mc.person_id = p.person_id
GROUP BY p.person_name, mc.character_name
ORDER BY p.person_name ASC;

--- ITEMS 5 ---
SELECT d.department_name AS DEPARTAMENTO, COUNT(person_id) AS CANTIDAD_PERSONAS_ASIGNADAS, pc.company_name AS COMPAÑIA
FROM movie m 
LEFT JOIN movie_company mc ON m.movie_id = mc.movie_id 
INNER JOIN production_company pc ON mc.company_id  = pc.company_id 
LEFT JOIN movie_crew mc2 ON m.movie_id = mc2.movie_id 
INNER JOIN department d ON mc2.department_id = d.department_id 
GROUP BY d.department_name, pc.company_name
ORDER BY pc.company_name ASC;

--- ITEMS 6 ---
SELECT p.person_name AS NOMBRE_ACTOR_ACTRIZ, m.title AS NOMBRE_PELICULA_INTERPRETADA
FROM movie m 
LEFT JOIN movie_cast mc ON m.movie_id = mc.movie_id 
INNER JOIN person p ON mc.person_id = p.person_id
GROUP BY p.person_name, m.title, mc.character_name
ORDER BY p.person_name ASC;

--- ITEMS 7 ---
SELECT pc.company_name AS Nombre_Compañia, c.country_name AS Ubicación_Compañia
FROM movie m 
LEFT JOIN movie_company mc ON m.movie_id = mc.movie_id 
INNER JOIN production_company pc ON mc.company_id = pc.company_id 
LEFT JOIN production_country pc2 ON m.movie_id = pc2.movie_id 
INNER JOIN country c ON pc2.country_id = c.country_id 
GROUP BY pc.company_name, c.country_name 
ORDER BY pc.company_name ASC;

--- ITEMS 8 ---
SELECT m.title AS ELENCO, COUNT(mc.person_id) AS Mujeres_Participan, g.genre_name 
FROM movie m 
LEFT JOIN movie_genres mg ON m.movie_id = mg.movie_id 
INNER JOIN genre g ON mg.genre_id = g.genre_id
LEFT JOIN movie_cast mc ON mc.movie_id = m.movie_id 
INNER JOIN gender g2 ON mc.gender_id = g2.gender_id 
WHERE g.genre_id = 18
AND g2.gender_id = 1
GROUP BY m.title, g.genre_name
ORDER BY m.title;

--- ITEMS 9 ---
SELECT m.title AS PELICULA, COUNT(l.language_name) AS CANT_IDIOMAS_DOBLADA
FROM movie m 
LEFT JOIN movie_languages ml ON m.movie_id = ml.movie_id 
INNER JOIN language l ON ml.language_id = l.language_id 
GROUP BY m.title
ORDER BY m.title ASC;

--- ITEMS 10 ---
SELECT COUNT(k.keyword_id) AS Cantidad_Utilizadas, k.keyword_name 
FROM movie m
LEFT JOIN movie_keywords mk ON m.movie_id = mk.movie_id 
INNER JOIN keyword k ON mk.keyword_id = k.keyword_id 
GROUP BY k.keyword_name 
ORDER BY Cantidad_Utilizadas DESC
LIMIT 8;


