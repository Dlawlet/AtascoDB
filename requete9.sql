CREATE TABLE ExpertAvecTiret(
    newexisting varchar(100) NOT NULL,
    débutnomination timestamp NOT NULL ,
    PRIMARY KEY (newexisting)
);

COPY atasco.public.expertavectiret(newexisting, débutnomination)
FROM 'C:\Users\rmang\Downloads\csv_file.csv'
DELIMITER ',';

CREATE TABLE CorrespondanceNouveau(
    NouveauExpert varchar(100) NOT NULL,
    nouveau boolean NOT NULL,
    PRIMARY KEY (NouveauExpert)
);

INSERT INTO correspondancenouveau(NOUVEAUEXPERT, NOUVEAU)
VALUES ('new-expert', true);

INSERT INTO correspondancenouveau(NOUVEAUEXPERT, NOUVEAU)
VALUES ('existing-expert', false);

CREATE TABLE expert1(
    piloteid uuid NOT NULL,
    datenomination timestamp NOT NULL,
    nouveau varchar NOT NULL,
    PRIMARY KEY (piloteid)
);

INSERT INTO expert1
SELECT substring(e.newexisting from 2 + position('--' in e.newexisting))::uuid piloteid,
       e.débutnomination,
       substring(e.newexisting from 1 for position('--' in e.newexisting) - 1)::varchar(100) nouveau
FROM expertavectiret e;

CREATE TABLE expert AS
SELECT e.piloteid, e.datenomination::date, c.nouveau
FROM expert1 e, correspondancenouveau c
WHERE e.nouveau = c.nouveauexpert;

ALTER TABLE expert
ADD CONSTRAINT expert_pk PRIMARY KEY (piloteid)