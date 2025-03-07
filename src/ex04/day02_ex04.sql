SELECT pizza_name, (SELECT name FROM pizzeria WHERE pizzeria.id = menu.pizzeria_id) AS pizzeria_name, price
FROM menu
WHERE pizza_name LIKE 'pepp%' OR pizza_name LIKE 'mush%'
ORDER BY 1, 2;