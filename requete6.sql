/*Requête 6*/
SELECT distinct valler.aéroportdépartcode, valler.aéroportarrivéecode, valler.id, valler.heuredépart, valler.heurearrivée, vretour.heuredépart
FROM atasco.public.vol valler, atasco.public.vol vretour, atasco.public.aviondeligne adl
WHERE valler.avionid = adl.id
  and valler.aéroportdépartcode = vretour.aéroportarrivéecode
  and valler.aéroportarrivéecode = vretour.aéroportdépartcode
  and valler.heuredépart::date = valler.heurearrivée::date
  and valler.heurearrivée::date - vretour.heuredépart::date = 0
  and valler.heuredépart::time > '07:00:00'
  and vretour.heuredépart::time - valler.heurearrivée::time > '07:00:00'