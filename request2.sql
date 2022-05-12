-- This request return the intersection of "pilotes" and "passagers"
SELECT id
FROM pilote
INTERSECT
SELECT id
FROM voyageur

/*
 SELECT v.id
FROM voyageur v, pilote p
WHERE p.id = v.id
 */