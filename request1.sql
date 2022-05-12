-- This request return the total amount of "vol" operated by all "aviondefret"
SELECT count(*)
FROM vol v, aviondefret af
WHERE v.avionid = af.id