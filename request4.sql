-- get the name of every "aviondefret" 's "pilote"
select sub.nom
from (select distinct u.nom, u.id
from utilisateur u , pilote p, aviondefret af, vol v
where u.id = p.id and v.avionid = af.id and v.piloteid= p.id) sub
