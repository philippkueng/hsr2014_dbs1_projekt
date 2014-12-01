-- Authors: Marko Gucanin, Philipp Küng

CREATE DOMAIN plz AS TEXT
CHECK(
   VALUE ~ '^\d{4}$'
);

-- Da wir aktuell keine IDs haben welche keine n:m Beziehungen haben, fügen wir eine neue id Column hier ein.
-- Anhand des types 'serial' wird der modifier 'not null default nextval('spieler_id_seq'::regclass)' automatisch gesetzt.
CREATE TABLE Spieler (
  id SERIAL,
  spielerName VARCHAR(255),
  name VARCHAR(255) NOT NULL,
  vorname VARCHAR(255) NOT NULL,
  plz plz,
  email VARCHAR(255) NOT NULL,
  passwort VARCHAR(255) NOT NULL,
  likesMuffins BOOLEAN DEFAULT TRUE,
  PRIMARY KEY (spielerName)
);

CREATE TABLE Team (
  teamName VARCHAR(255),
  PRIMARY KEY (teamName)
);

CREATE TYPE turnierStatus AS ENUM ('Anmeldung offen','Anmeldung geschlossen','Turnier wird ausgetragen','Turnier wird nicht ausgetragen','Turnier beendet');
CREATE TABLE Turnier (
  turnierId INTEGER, 
  gameName VARCHAR(255) NOT NULL, 
  teamAnzahlMin INTEGER NOT NULL, 
  teamAnzahlMax INTEGER NOT NULL, 
  teamGroesse INTEGER NOT NULL, 
  anmeldungFrist TIMESTAMP NOT NULL, 
  turnierStatus turnierStatus,
  PRIMARY KEY (turnierId)
);

CREATE TYPE turnierModus AS ENUM ('se','de','ava');
CREATE TABLE TurnierAustragung (
  turnierId INTEGER,
  startDatum TIMESTAMP NOT NULL,
  turnierModus turnierModus,
  PRIMARY KEY (turnierId)
);

CREATE TYPE spielModus AS ENUM ('bo5','bo4','bo3','bo2','bo1');
CREATE TABLE Spiel (
  spielId INTEGER,
  zeit TIMESTAMP NOT NULL,
  spielModus spielModus,
  PRIMARY KEY (spielId)
);

CREATE TABLE IstMitglied (
  spielerName VARCHAR(255), 
  teamName VARCHAR(255),
  PRIMARY KEY (spielerName, teamName)
);

CREATE TABLE Anmeldung (
  teamName VARCHAR(255), 
  turnierId INTEGER,
  PRIMARY KEY (teamName, turnierId)
);

CREATE TABLE TeamZuSpiel (
  teamName VARCHAR(255), 
  spielId INTEGER, 
  punkte INTEGER,
  PRIMARY KEY (teamName, spielId)
);

CREATE TABLE SpielZuTurnierAustragung (
  spielId INTEGER,
  turnierId INTEGER,
  PRIMARY KEY (spielId, turnierId)
);

