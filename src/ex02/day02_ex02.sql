SELECT 
    '-' AS person_name, 
    NULL AS visit_date, 
    name AS pizzeria_name
FROM pizzeria
WHERE 
    id NOT IN (
        SELECT pizzeria_id 
        FROM person_visits 
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')

UNION

SELECT 
    (
        SELECT name 
        FROM person 
        WHERE person.id = person_visits.person_id) AS person_name, 
    visit_date, 
    (
        SELECT name 
        FROM pizzeria 
        WHERE pizzeria.id = person_visits.pizzeria_id)
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'

UNION

SELECT 
    name, 
    NULL AS visit_date, 
    '-' AS pizzeria_name
FROM person
WHERE 
    id NOT IN (
        SELECT person_id 
        FROM person_visits 
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
ORDER BY 1, 2, 3;