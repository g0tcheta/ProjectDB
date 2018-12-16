SELECT DISTINCT athlete.nom
FROM athlete , event , resultat
WHERE id_medaille != 0
AND pays = 'Italie'

SELECT DISTINCT athlete.nom,
pays,
athlete.id_sport,
id_medaille as type_medaille
FROM  athlete , resultat , sport
WHERE athlete.id_sport = 1
OR athlete.id_sport = 2
OR athlete.id_sport = 3

SELECT DISTINCT athlete.nom
FROM athlete ,team
WHERE athlete.genre = 'F'
AND athlete.id_sport = 24
AND age < 25

SELECT DISTINCT id_medaille,
temps,
sport.nom,
athlete.nom as athlete
FROM sport JOIN event ON sport.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event
JOIN participant ON event.id_participant = participant.id_participant
JOIN athlete ON participant.id_athlete = athlete.id_athlete
WHERE athlete.nom  = 'Michael Phelps'

SELECT nom
FROM sport
WHERE multi = 'multi'

SELECT MIN(temps) as record_marathon
FROM resultat JOIN event ON resultat.id_event = event.id_event
WHERE event.id_sport = 46

SELECT AVG(temps) as moyenne_temps,
pays
FROM resultat JOIN event ON resultat.id_event = event.id_event
JOIN participant ON event.id_participant = participant.id_participant
JOIN athlete ON participant.id_athlete = athlete.id_athlete
WHERE athlete.id_sport = 28
GROUP BY pays
