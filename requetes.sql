SELECT COUNT(Medaille.idmedaille), Athlete.Pays
FROM Medaille, Resultat, Event, Participation, Athlete
WHERE Medaille.IdMedaille = Resultat.Idrésulat
AND Resulat.ideven = event.idevent
AND Event.idparticipant = Participation.id_participant
AND Participation.IdAthlete = Athlete.Idathlete
GROUP BY Athlete.Pays;
