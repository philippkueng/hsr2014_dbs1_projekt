-- Authors: Marko Gucanin, Philipp Küng

ALTER TABLE TurnierAustragung
ADD CONSTRAINT fk_TurnierAustragung
  FOREIGN KEY (turnierId) REFERENCES Turnier (turnierId)
  ON DELETE CASCADE
;

ALTER TABLE IstMitglied
ADD CONSTRAINT fk_IstMitgliedSpielerName
  FOREIGN KEY (spielerName) REFERENCES Spieler (spielerName),
ADD CONSTRAINT fk_IstMitgliedTeamName
  FOREIGN KEY (teamName) REFERENCES Team (teamName)
;

ALTER TABLE Anmeldung
ADD CONSTRAINT fk_AnmeldungTeamName
  FOREIGN KEY (teamName) REFERENCES Team (teamName),
ADD CONSTRAINT fk_AnmeldungTurnierId
  FOREIGN KEY (turnierId) REFERENCES Turnier (turnierId)
;

ALTER TABLE TeamZuSpiel
ADD CONSTRAINT fk_TeamZuSpielTeamName
  FOREIGN KEY (teamName) REFERENCES Team (teamName),
ADD CONSTRAINT fk_TeamZuSpielTurnierId
  FOREIGN KEY (spielId) REFERENCES Spiel (spielId)
;

ALTER TABLE SpielZuTurnierAustragung
ADD CONSTRAINT fk_SpielZuTurnierAustragungSpielId
  FOREIGN KEY (spielId) REFERENCES Spiel (spielId)
;
