# Testat 1

## Klassen

* Person
* Spieler <- erbt von Person
* Team <- kann 1..* Spieler enthalten, Komposition - ohne Spieler existiert das Team nicht
* Spiel (Begegnung, identisch zu einem vollen Fussball-Spiel SUI vs ARG)
* TeamZuSpiel (Relation zwischen Team und Spiel mit dieser Klasse als Assoziationsklasse)
    + punkte
    + team (FOREIGN KEY Team)
    + spiel (FOREIGN KEY Spiel)
* Turnier <- besteht aus mehreren Spielen (1..*) (identisch zu der ganzen WM, als Beschreibung)
    + game name
    + modus (eg. best of 5, best of 1)
    + team anzahl
    + team grösse (anzahl spieler pro team)
* TurnierAustragung <- Komposition zu Turnier (führt das ganze Turnier aus, identisch zu allen Fussball-Spielen an der WM)
    + Aggregation von Spielen
    + StartDatum/Zeit

## Bedingungen

* Ein Nutzer kann nicht in mehreren Teams am gleichen Turnier teilnehmen
* Bei der Erstellungen kann ein Turnier noch keine Teams enthalten, jedoch braucht es für die TurnierAustragung mindestens 2 Teams.
* Ein Team kann nicht gegen sich selbst spielen
* Bei einem Spiel gewinnt jeweils immer ein Team (gibt keine Abbrüche oder Unentschieden)