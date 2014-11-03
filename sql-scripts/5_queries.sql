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
SELECT membershipCount.spielerName FROM
	(SELECT s.spielerName, COUNT(s.spielerName) FROM
		(SELECT u.spielerName FROM Spieler u 
			JOIN IstMitglied i ON (u.spielerName=i.spielerName)
			JOIN Team t ON (i.teamName=t.teamName)
			WHERE t.teamName='A-Team') AS s
		JOIN IstMitglied i ON (s.spielerName=i.spielerName)
		GROUP BY s.spielerName) AS membershipCount
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