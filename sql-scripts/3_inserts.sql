-- Authors: Marko Gucanin, Philipp Küng


-- Spieler
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Akke','Marxer','Markus','akke@example.com','admin1234', 1234);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Bulba','Widmer','Anna','bubla@wtf.com','passwort', 2512);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Chuan','Steiner','Hans','hansi@steiner.com','12441234', 2351);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Dandy','Affolter','Vreni','dandylion@affolter.com','jahlkfaadsf', 1251);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Franz','Müller','Franz','franz.mueller@gmail.com','passwort', 1235);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz, likesMuffins) VALUES ('Eddy','Meier','Max','meier.max.privat@bluewin.com','keyboard', 8357, false);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Kafka','Muster','Heiri','heiri.muster@yahoo.com','passwort1234', 8456);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Gustav','Muster','Gustav','gustav.muster@hotmail.com','passwort1234', 3457);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Snake','Schuler','Simon','schuler.simon@gmx.com','passwort1234', 3457);

-- Dieses Inserts werden nicht erfolgreich sein beim Daten einfügen, weil die Types nicht stimmen oder Domain checks nicht passen.
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz) VALUES ('Tyran','Tyran','Theodor','tyran-online@hsr.ch','passwort1234', 123);
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz, likesMuffins) VALUES ('Tyran','Tyran','Theodor','tyran-online@hsr.ch','passwort1234', 123, 'HELL NO!!');
INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz, likesMuffins) VALUES ('Tyran','Tyran','Theodor','tyran-online@hsr.ch','passwort1234', 123, 0);

INSERT INTO Spieler (spielerName, name, vorname, email, passwort, plz, likesMuffins) VALUES ('Tyran','Tyran','Theodor','tyran-online@hsr.ch','passwort1234', 9645, false);

-- Team
INSERT INTO Team (teamName) VALUES ('A-Team');
INSERT INTO Team (teamName) VALUES ('B-Team');
INSERT INTO Team (teamName) VALUES ('C-Team');
INSERT INTO Team (teamName) VALUES ('D-Team');
INSERT INTO Team (teamName) VALUES ('E-Team');
INSERT INTO Team (teamName) VALUES ('F-Team');
INSERT INTO Team (teamName) VALUES ('G-Team');

-- Turnier
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (1, 'Game 1', 2, 2, 2, TIMESTAMP '2005-05-13 07:15:31.123456789', 'Turnier beendet');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (2, 'Game 2', 2, 3, 2, TIMESTAMP '2005-05-14 07:15:31.123456789', 'Turnier beendet');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (3, 'Game 3', 2, 3, 2, TIMESTAMP '2005-05-15 07:15:31.123456789', 'Turnier beendet');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (4, 'Game 4', 2, 3, 2, TIMESTAMP '2005-05-16 07:15:31.123456789', 'Turnier wird ausgetragen');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (5, 'Game 5', 2, 2, 2, TIMESTAMP '2005-05-17 07:15:31.123456789', 'Anmeldung geschlossen');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (6, 'Game 6', 2, 2, 3, TIMESTAMP '2005-05-18 07:15:31.123456789', 'Anmeldung geschlossen');
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (7, 'Game 7', 2, 4, 2, TIMESTAMP '2005-05-19 07:15:31.123456789', 'Anmeldung offen');
-- Test which violates the check constraint added on that table for the column anmeldeFrist
INSERT INTO Turnier (turnierId, gameName, teamAnzahlMin, teamAnzahlMax, teamGroesse, anmeldungFrist, turnierStatus) VALUES (8, 'Game 7', 2, 4, 2, TIMESTAMP '2015-05-19 07:15:31.123456789', 'Anmeldung offen');

-- TurnierAustragung
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (1, TIMESTAMP '2005-05-14 07:15:31.123456789', 'se');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (2, TIMESTAMP '2005-05-15 07:15:31.123456789', 'se');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (3, TIMESTAMP '2005-05-16 07:15:31.123456789', 'de');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (4, TIMESTAMP '2005-05-17 07:15:31.123456789', 'de');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (5, TIMESTAMP '2005-05-18 07:15:31.123456789', 'de');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (6, TIMESTAMP '2005-05-19 07:15:31.123456789', 'ava');
INSERT INTO TurnierAustragung (turnierId, startDatum, turnierModus) VALUES (7, TIMESTAMP '2005-05-20 07:15:31.123456789', 'ava');

-- Spiel
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (1, TIMESTAMP '2005-05-14 07:15:31.123456789', 'bo5');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (2, TIMESTAMP '2005-05-15 07:15:31.123456789', 'bo3');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (3, TIMESTAMP '2005-05-16 07:15:31.123456789', 'bo1');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (4, TIMESTAMP '2005-05-17 07:15:31.123456789', 'bo2');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (5, TIMESTAMP '2005-05-18 07:15:31.123456789', 'bo1');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (6, TIMESTAMP '2005-05-19 07:15:31.123456789', 'bo3');
INSERT INTO Spiel (spielId, zeit, spielModus) VALUES (7, TIMESTAMP '2005-05-20 07:15:31.123456789', 'bo5');

-- IstMitglied
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Eddy','A-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Bulba','A-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Kafka','B-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Gustav','C-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Snake','D-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Tyran','A-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Akke','A-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Chuan','F-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Akke','G-Team');
INSERT INTO IstMitglied (spielerName, teamName) VALUES ('Gustav','B-Team');

-- Anmeldung
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('A-Team',1);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('B-Team',2);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('C-Team',3);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('D-Team',4);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('E-Team',1);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('F-Team',1);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('G-Team',2);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('A-Team',2);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('B-Team',4);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('C-Team',6);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('D-Team',2);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('E-Team',2);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('F-Team',4);
INSERT INTO Anmeldung (teamName, turnierId) VALUES ('G-Team',3);

-- TeamZuSpiel
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('A-Team',1,12);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('B-Team',1,43);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('C-Team',4,21);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('D-Team',4,15);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('A-Team',2,23);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('F-Team',2,85);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('E-Team',3,23);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('G-Team',3,53);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('E-Team',5,85);
INSERT INTO TeamZuSpiel (teamName, spielId, punkte) VALUES ('A-Team',5,16);

-- SpielZuTurnierAustragung
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (1,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (1,1);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (5,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (3,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (5,6);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (2,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (6,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (4,3);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (2,5);
INSERT INTO SpielZuTurnierAustragung (spielId, turnierId) VALUES (2,7);
