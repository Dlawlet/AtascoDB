/*Requête4
  Description : Sélectionnez le nom des pilotes n'ayant conduit que des avions de ligne dans la base de
donnée*/
/*On garde l'id dans le select car il existe 2 personnes avec les mêmes noms et prénoms dans la base de données
  QUESTION : Gregory Taylor est-il un employé de 2 compagnies ou pas ? */
/*SELECT distinct u.nom, u.prénom, u.id
FROM atasco.public.utilisateur u, atasco.public.pilote p, atasco.public.aviondeligne adl, atasco.public.vol v
WHERE v.avionid = adl.id AND v.piloteid = p.id AND u.id = p.id*/

SELECT u.nom, u.prénom, u.id
FROM atasco.public.utilisateur u, atasco.public.pilote p
WHERE u.id NOT IN(
    SELECT v.piloteid
    FROM atasco.public.aviondeligne adl, atasco.public.vol v
    WHERE v.avionid != adl.id
        AND v.piloteid = p.id
    )
AND u.id = p.id
