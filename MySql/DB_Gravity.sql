--- ITEMS 1 ---
SELECT b.title AS TITULO, a.author_name AS AUTOR, bl.language_name
FROM book b
LEFT JOIN book_author ba ON b.book_id = ba.book_id
INNER JOIN author a ON ba.author_id = a.author_id
LEFT JOIN book_language bl ON b.language_id = bl.language_id
ORDER BY b.title ASC;

--- ITEMS 5 ---
SELECT b.title AS TITULO, os.status_value AS ESTATUS
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.line_id
LEFT JOIN cust_order co ON ol.order_id = co.order_id
LEFT JOIN order_history oh ON ol.order_id = oh.order_id
INNER JOIN order_status os ON oh.status_id = os.status_id
WHERE os.status_id = 5
ORDER BY b.title ASC;

--- ITEMS 8 ---
SELECT COUNT(b.title) AS CANTIDAD_LIBROS, b.title AS TITULO, os.status_value AS ESTATUS
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.line_id
LEFT JOIN cust_order co ON ol.order_id = co.order_id
LEFT JOIN order_history oh ON ol.order_id = oh.order_id
INNER JOIN order_status os ON oh.status_id = os.status_id
WHERE os.status_id = 4
GROUP BY b.title, os.status_value
ORDER BY b.title ASC;
