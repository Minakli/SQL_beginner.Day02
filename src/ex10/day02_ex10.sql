SELECT p.name AS person_name1,
       p1.name AS person_name2,
       p.address AS common_address
FROM person AS p
INNER JOIN person AS p1 ON p.id < p1.id
                        AND p.address = p1.address
ORDER BY 1, 2, 3;