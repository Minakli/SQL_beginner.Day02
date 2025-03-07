SELECT
  (SELECT pizza_name
   FROM menu
   WHERE menu.id = person_order.menu_id) AS pizza_name,

  (SELECT name
   FROM pizzeria
   WHERE id =
       (SELECT pizzeria_id
        FROM menu
        WHERE menu.id = person_order.menu_id)) AS pizzeria_name
FROM person_order
WHERE person_id IN
    (SELECT id
     FROM person
     WHERE name IN ('Denis',
                    'Anna'))
ORDER BY 1,
         2;

-- Вариант с JOIN
SELECT m.pizza_name,
       p.name AS pizzeria_name
FROM person_order AS po
INNER JOIN menu AS m ON po.menu_id = m.id
INNER JOIN pizzeria AS p ON m.pizzeria_id = p.id
WHERE po.person_id IN
    (SELECT id
     FROM person
     WHERE name IN ('Denis',
                    'Anna'))
ORDER BY 1,
         2;