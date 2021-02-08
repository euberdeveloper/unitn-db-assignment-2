DROP TABLE IF EXISTS "Match";
DROP TABLE IF EXISTS "Stadium";
DROP TABLE IF EXISTS "Nationality";


CREATE TABLE "Nationality" (
    "country"       TEXT PRIMARY KEY,
    "continent"     TEXT NOT NULL,
    "group"         CHAR(1) NOT NULL
);

CREATE TABLE "Stadium" (
    "name"      TEXT PRIMARY KEY,
    "city"      TEXT NOT NULL,
    "country"   TEXT NOT NULL REFERENCES "Nationality"("country"),
    "capacity"  NUMERIC NOT NULL
);

CREATE TABLE "Match" (
    "stadium"   TEXT NOT NULL REFERENCES "Stadium"("name"),
    "date"      DATE NOT NULL,
    "time"      TIME NOT NULL,
    "home"      TEXT NOT NULL REFERENCES "Nationality"("country"),
    "guest"     TEXT NOT NULL REFERENCES "Nationality"("country"),
    PRIMARY KEY("stadium", "date", "time")
);