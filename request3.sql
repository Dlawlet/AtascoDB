-- This request return all the "vol" with the highest number of "reservation" i-e of passenger
SELECT v.id, v.aéroportdépartcode, v.aéroportarrivéecode, v.heuredépart, v.heurearrivée
FROM  vol v, (SELECT volid, count(volid) count
              FROM réservation
              GROUP BY volid) sub
WHERE v.id = sub.volid AND sub.count =
        (SELECT max(count)
         from (SELECT volid, count(volid) count
              FROM réservation
              GROUP BY volid) bi)
