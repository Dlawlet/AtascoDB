/*Requête5
  Description : Pour chacune des compagnies suivantes, 'ABX Air Inc', 'ADVANCED AIR, LLC', il vous est demandé de
sélectionner, pour chaque jour, la distance moyenne parcourue par ses avions.*/

SELECT distinct c.nom, v.distance, v.id,v.avionid
FROM
    atasco.public.company c, avion a, vol v
WHERE (c.nom = 'ABX Air Inc'
   or c.nom = 'ADVANCED AIR, LLC')
    and c.id = a.compagnieid and a.id = v.avionid
GROUP BY c.nom, v.distance, v.id, v.avionid
ORDER BY c.nom

