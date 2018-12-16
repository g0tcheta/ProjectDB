SELECT COUNT(resultat.id_medaille),
athlete.pays
FROM resultat JOIN event on resultat.id_event = event.id_event
JOIN athlete ON event.id_sport = athlete.id_sport
GROUP BY athlete.pays
