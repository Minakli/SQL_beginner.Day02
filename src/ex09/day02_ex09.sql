WITH tmp1 AS
  (SELECT p.name
   FROM person_order AS po
   INNER JOIN person AS p ON po.person_id = p.id
   AND p.gender = 'female'
   INNER JOIN menu AS m ON po.menu_id = m.id
   AND m.pizza_name LIKE 'pepper%'),
     tmp2 AS
  (SELECT p.name
   FROM person_order AS po
   INNER JOIN person AS p ON po.person_id = p.id
   AND p.gender = 'female'
   INNER JOIN menu AS m ON po.menu_id = m.id
   AND m.pizza_name LIKE 'cheese%')
SELECT name
FROM tmp1
WHERE name IN
    (SELECT name
     FROM tmp2)
ORDER BY 1;

-- ИИ подсказал, как упростить
SELECT p.name
FROM person_order AS po
INNER JOIN person AS p ON po.person_id = p.id
AND p.gender = 'female'
INNER JOIN menu AS m ON po.menu_id = m.id
WHERE m.pizza_name LIKE 'pepper%'
  OR m.pizza_name LIKE 'cheese%'
GROUP BY p.name
HAVING COUNT(DISTINCT m.pizza_name) = 2
ORDER BY p.name;