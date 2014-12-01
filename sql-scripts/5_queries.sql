-- Authors: Marko Gucanin, Philipp Küng

-- 1. Eine sinnvolle Query mit DISTINCT.
-- Verwendete Passwörter auflisten
SELECT DISTINCT passwort FROM Spieler;

--    passwort
-- --------------
--  passwort1234
--  12441234
--  keyboard
--  passwort
--  admin1234
--  jahlkfaadsf
-- (6 rows)

-- 2. Eine sinnvolle Query, die einen JOIN über drei (wenn nicht anders möglich über zwei) Tabellen enthält.
-- Alle Spieler die im 'A-Team' sind.
SELECT s.spielerName FROM Spieler s
JOIN IstMitglied i ON (s.spielerName=i.spielerName)
JOIN Team t ON (i.teamName=t.teamName)
WHERE t.teamName='A-Team';

--  spielername
-- -------------
--  Eddy
--  Bulba
--  Tyran
--  Akke
-- (4 rows)


-- 3. Eine Query mit einer Unterabfrage (wenn immer möglich korreliert).
-- Spieler im 'A-Team' anzeigen welche in nur einem Team sind.
SELECT membershipCount.spielerName
FROM
  (SELECT s.spielerName, COUNT(s.spielerName)
  FROM
    (SELECT u.spielerName
    FROM Spieler u 
    JOIN IstMitglied i ON (u.spielerName=i.spielerName)
    JOIN Team t ON (i.teamName=t.teamName)
    WHERE t.teamName='A-Team'
  ) AS s
  JOIN IstMitglied i ON (s.spielerName=i.spielerName)
  GROUP BY s.spielerName
) AS membershipCount
WHERE membershipCount.count=1;

-- 4. Eine Query mit einer GROUP BY-Klausel
-- bereits oben verwendet

-- 5. Eine Query, die entweder ein ANY oder ein IN oder ein NOT IN enthält.
-- Teams welche Spieler haben welche, Passwort 'passwort1234' verwendet
SELECT DISTINCT t.teamName FROM Team t
JOIN IstMitglied i ON (i.teamName=t.teamName)
JOIN Spieler s ON (s.spielerName=i.spielerName)
WHERE s.passwort IN ('passwort1234')
ORDER BY t.teamName;

-- Aufgabe 3.1
-- Subquery die ein Team mit der maximalen Anzahl an Punkten liefert.
-- Die zweite Subquery ist nicht unkorreliert
BEGIN;
SELECT * 
FROM team 
WHERE teamname = 
	(SELECT teamname 
	FROM teamzuspiel 
	WHERE punkte = 
		(SELECT max(punkte) 
		FROM teamzuspiel) LIMIT 1);
-- COMMON TABLE EXPRESSION
WITH sub1 AS (
	SELECT teamname FROM teamzuspiel
	WHERE punkte = (SELECT max(punkte) FROM teamzuspiel) LIMIT 1
)
SELECT * FROM sub1;

-- forget all changes made since BEGIN
ROLLBACK;

-- Aufgabe 3.2
-- WINDOW-Function: Alle Punkte eines Teams zusammenzählen
BEGIN;
SELECT teamname, sum(punkte) OVER (PARTITION BY teamname) FROM TeamZuSpiel;
-- forget all changes made since BEGIN
ROLLBACK;

-- Aufgabe 4.1
-- VIEW Turnierspielliste des Turniers 3
BEGIN;
CREATE VIEW Turnierspielliste (SpielId, Zeit, Team) AS
	SELECT szta.spielid, s.zeit, t.teamname FROM spiel AS s 
		INNER JOIN spielzuturnieraustragung AS szta ON s.spielid = szta.spielid
			INNER JOIN teamzuspiel AS t ON t.spielid = s.spielid
	WHERE turnierId = 3;

SELECT * FROM Turnierspielliste;

-- forget all changes made since BEGIN
ROLLBACK;

-- Aufgabe 4.2
-- VIEW Spielernamen
BEGIN;
CREATE VIEW Spielernamen (spielername, name, vorname) AS SELECT spielerName, name, vorname FROM Spieler;
SELECT * FROM Spielernamen;
UPDATE Spielernamen SET name = 'Blue' WHERE spielerName = 'Akke';
SELECT * FROM Spielernamen;
SELECT * FROM Spieler;

-- forget all changes made since BEGIN
ROLLBACK;
