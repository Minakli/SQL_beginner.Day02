SELECT DISTINCT pz.name
FROM  person_visits AS pv
INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id 
AND pz.id IN 
    (SELECT pizzeria_id 
    FROM menu 
    WHERE price < 800)
INNER JOIN person AS p ON pv.person_id = p.id
WHERE pv.visit_date = '2022-01-08';

-- Вариант без подзапроса
SELECT DISTINCT pz.name
FROM  person_visits AS pv
INNER JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
INNER JOIN person AS p ON pv.person_id = p.id
INNER JOIN menu AS m ON pz.id = m.pizzeria_id AND m.price < 800
WHERE pv.visit_date = '2022-01-08';