DROP TABLE IF EXISTS Athlete;
CREATE TABLE Athlete
(
id INT PRIMARY KEY NOT NULL,
id_pays INT FOREIGN KEY REFERENCES Pays(id),
nom VARCHAR(100),
genre VARCHAR(100),
age INT,
discipline VARCHAR FOREIGN KEY REFERENCES Epreuve(nom)
)

DROP TABLE IF EXISTS Pays;
CREATE TABLE Pays
(
id INT PRIMARY KEY NOT NULL,
nom VARCHAR(100)
)

DROP TABLE IF EXISTS Epreuve;
CREATE TABLE Epreuve
(
id INT PRIMARY KEY NOT NULL,
nom VARCHAR(100),
solo_multi VARCHAR(100),
date DATE FOREIGN KEY REFERENCES Date(date),
heure TIME FOREIGN KEY REFERENCES Date(heure),
categorie VARCHAR FOREIGN KEY REFERENCES Categorie_Sport(id)
)

DROP TABLE IF EXISTS Categorie_Sport;
CREATE TABLE Categorie_Sport
(
id INT PRIMARY KEY NOT NULL,
Nbr_epreuve INT
)

DROP TABLE IF EXISTS Date;
CREATE TABLE Date
(
date DATE,
heure TIME
)

DROP TABLE IF EXISTS Resultat;
CREATE TABLE Resultat
(
epreuve VARCHAR FOREIGN KEY REFERENCES Epreuve(nom),
gagnant VARCHAR FOREIGN KEY REFERENCES Athlete(nom),
medaille VARCHAR(100),
score INT,
temps TIME
)

INSERT INTO Athlete (nom,genre,age) VALUES
('Steve', 'M', '25'),
('John', 'M', '24'),
('Maria', 'F', '29');

zizi
