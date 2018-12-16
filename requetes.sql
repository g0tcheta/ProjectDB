-- 1.1
SELECT DISTINCT athlete.nom
FROM athlete , event , resultat
WHERE id_medaille != 0
AND pays = 'Italie';
 
-- 1.2
SELECT DISTINCT athlete.nom,
pays,
athlete.id_sport,
id_medaille as type_medaille
FROM  athlete , resultat , sport
WHERE athlete.id_sport = 1
OR athlete.id_sport = 2
OR athlete.id_sport = 3;
 
--1.3
SELECT DISTINCT athlete.nom
FROM athlete ,team
WHERE athlete.genre = 'F'
AND athlete.id_sport = 24
AND age < 25;
 
--1.4
SELECT DISTINCT id_medaille,
temps,
sport.nom,
athlete.nom as athlete
FROM sport JOIN event ON sport.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event
JOIN participant ON event.id_participant = participant.id_participant
JOIN athlete ON participant.id_athlete = athlete.id_athlete
WHERE athlete.nom  = 'Michael Phelps';
 
--1.5
SELECT nom
FROM sport
WHERE multi = 'multi';
 
--1.6
SELECT MIN(temps) as record_marathon
FROM resultat JOIN event ON resultat.id_event = event.id_event
WHERE event.id_sport = 46;
 
--2.1
SELECT AVG(temps) as moyenne_temps,
pays
FROM resultat JOIN event ON resultat.id_event = event.id_event
JOIN participant ON event.id_participant = participant.id_participant
JOIN athlete ON participant.id_athlete = athlete.id_athlete
WHERE athlete.id_sport = 28
GROUP BY pays;
 
--2.2
SELECT athlete.pays ,COUNT (pays) 
FROM Athlete JOIN Participant ON Athlete.id_athlete = Participant.id_athlete 
WHERE Participant.id_athlete IN
(SELECT Resultat.id_participant 
 FROM Resultat JOIN Participant ON Resultat.id_participant = Participant.id_participant 
 WHERE Resultat.id_medaille != 1) 
 GROUP BY pays;

--2.3
SELECT athlete.nom, athlete.pays, athlete.id_sport, medaille.type 
FROM Athlete JOIN Participant 
ON Athlete.id_athlete = Participant.id_athlete JOIN Resultat 
ON Participant.id_participant = Resultat.id_participant JOIN Medaille 
ON Resultat.id_medaille = Medaille.id_medaille
WHERE Participant.id_athlete IN
(SELECT Resultat.id_participant 
 FROM Resultat JOIN Participant 
 ON Resultat.id_participant = Participant.id_participant 
 WHERE Resultat.id_medaille = 4 OR Resultat.id_medaille = 3)
 ORDER BY medaille.type;

--2.4
SELECT athlete.nom 
FROM Athlete JOIN Participant 
ON Athlete.id_athlete = Participant.id_athlete JOIN Resultat 
ON Participant.id_participant = Resultat.id_participant
WHERE Participant.id_athlete NOT IN
(SELECT Resultat.id_participant 
 FROM Resultat JOIN Participant 
 ON Resultat.id_participant = Participant.id_participant 
 WHERE Resultat.id_medaille = 4);
 
--2.5
SELECT DISTINCT sport.nom
FROM sport JOIN event ON sport.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event
JOIN athlete ON sport.id_sport = athlete.id_sport
WHERE athlete.pays = 'France'
AND id_medaille = 1
AND sport.multi = 'solo'

--2.6
SELECT DISTINCT athlete.nom
FROM athlete JOIN event ON athlete.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event
WHERE athlete.id_sport = 1
AND temps <= '00:00:10'

--3.2
SELECT DISTINCT athlete.pays
FROM athlete JOIN event ON athlete.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event
JOIN sport ON athlete.id_sport = sport.id_sport
WHERE id_medaille != 1
GROUP BY pays
HAVING COUNT(DISTINCT sport.id_sport) > (SELECT COUNT (id_sport) FROM sport);

--3.4
SELECT COUNT (athlete.nom)*100/
(SELECT COUNT (id_medaille) 
 FROM Resultat 
 WHERE id_medaille != 1) 
 FROM Athlete JOIN Participant 
 ON Athlete.id_athlete = Participant.id_athlete JOIN Resultat 
 ON Participant.id_participant = Resultat.id_participant
WHERE Participant.id_athlete IN
(SELECT Resultat.id_participant 
 FROM Resultat JOIN Participant 
 ON Resultat.id_participant = Participant.id_participant 
 WHERE Resultat.id_medaille != 1) AND athlete.genre = 'F';
 
--3.6
WITH medaillepays (pays , nbr_medailles) AS (
SELECT DISTINCT athlete.pays,
COUNT(id_medaille)
FROM athlete JOIN event ON athlete.id_sport = event.id_sport
JOIN resultat ON event.id_event = resultat.id_event 
JOIN sport ON athlete.id_sport = sport.id_sport
GROUP BY athlete.pays ,sport.nom
)
SELECT medaillepays.pays 
FROM medaillepays
WHERE nbr_medailles > ALL (
SELECT nbr_medailles
  FROM medaillepays
  WHERE pays = 'France' 
    )

-- 4.1
-- Le pays avec le nom et l'age de l'athlete avec la medaille d'or en halterophilie ?
SELECT athlete.pays, athlete.age, athlete.nom FROM Athlete JOIN Participant ON Athlete.id_athlete = Participant.id_athlete JOIN Resultat ON Participant.id_participant = Resultat.id_participant JOIN Sport ON Athlete.id_sport = Sport.id_sport
WHERE Participant.id_athlete IN
(SELECT Resultat.id_participant FROM Resultat JOIN Participant ON Resultat.id_participant = Participant.id_participant WHERE Resultat.id_medaille = 4)AND Sport.nom = 'Halterophilie';
 
-- 4.2
-- Le pourcentage de medaille d'argent gagné par les hommes ?
SELECT COUNT (athlete.nom)*100/(SELECT COUNT (id_medaille) FROM Resultat WHERE id_medaille = 2) FROM Athlete JOIN Participant ON Athlete.id_athlete = Participant.id_athlete JOIN Resultat ON Participant.id_participant = Resultat.id_participant
WHERE id_medaille = 2 AND athlete.genre = 'M';
 
-- 4.3
-- Le nom et pays des non medaillés ?
SELECT athlete.nom, athlete.pays FROM athlete JOIN participant ON athlete.id_athlete = participant.id_athlete JOIN resultat ON participant.id_participant = resultat.id_participant WHERE id_medaille = 1;
