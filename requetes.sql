1*

1)
Select gagnant 
from Resultat

2)
Select nom , id_pays , medaille
from Athlète join Resultat on nom = gagnant
where epreuve = '100m' and epreuve = '200m' and epreuve = '400m'
order by medaille

3)
select nom , prenom 
from Athlète join epreuve on discipline = epreuve.nom
where epreuve.nom = 'handball' and age < 25 and genre = 'femme'

4)
Select médaille , score , epreuve
from resultat join athlète on nom = gagnant 
where nom = 'Michael Phelps'

5)
select nom 
from epreuve 
where indiv/equipê = 'equipe'

6)
select max(score)
from resusltat 
where epreuve ='marathon'


2*

1)
select AVG(score) , id_pays
from resultat join athlète on gagnant = nom
where epreuve = '200m nage libre'
order by id_pays
