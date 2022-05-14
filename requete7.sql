
/*Requête 7*/
/*Renvoie la moyenne des vols ayant moins de 20 réservations par compagnie */
SELECT c.id, c.nom, avg(vn.nbpassager)
FROM avion a, company c, vol v, (SELECT v.avionid, v.id, count(r.siègeid) nbpassager
                                    FROM réservation r, vol v
                                    WHERE r.volid = v.id
                                    GROUP BY v.id
                                    HAVING count(r.siègeid) < 20) vn
WHERE v.avionid = a.id
  and c.id = a.compagnieid
  and vn.id = v.id
  and v.avionid = a.id
GROUP BY c.id, c.nom