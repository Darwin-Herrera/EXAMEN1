-- ITEMS 1 --
SELECT u.university_name AS UNIVERSIDAD, c.country_name AS UBICACIÓN
FROM university u
INNER JOIN country c ON u.country_id = c.id;

-- ITEMS 2 --
SELECT c.country_name AS PAIS, COUNT(u.id) AS CANTIDAD_UNIVERSIDADES
FROM country c
INNER JOIN university u ON c.id = u.country_id
GROUP BY c.country_name
ORDER BY c.country_name ASC;
