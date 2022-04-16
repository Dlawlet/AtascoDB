-- This request return the intersection of "pilotes" and "passagers"
SELECT id
FROM pilote
INTERSECT
SELECT id
FROM voyageur