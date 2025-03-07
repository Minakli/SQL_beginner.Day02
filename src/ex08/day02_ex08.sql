SELECT DISTINCT p.name
FROM person_order AS po
INNER JOIN person AS p ON po.person_id = p.id 
AND p.gender = 'male' 
AND p.address IN ('Moscow',
                  'Samara')
INNER JOIN menu AS m ON po.menu_id = m.id 
AND m.pizza_name IN ('pepperoni pizza',
                     'mushroom pizza')
ORDER BY 1 DESC;