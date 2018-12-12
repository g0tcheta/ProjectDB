DROP TABLE IF EXISTS Athlete;
CREATE TABLE Athlete
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_pays INT FOREIGN KEY REFERENCES Pays(id),
nom VARCHAR(100),
genre VARCHAR(100),
age INT,
discipline VARCHAR FOREIGN KEY REFERENCES Epreuve(nom)
)

DROP TABLE IF EXISTS Pays;
CREATE TABLE Pays
(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
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


INSERT INTO Athlete (id_pays,nom,genre,age,discipline) VALUES
(),
();

INSERT INTO Pays (nom) VALUES -- On ne prend que les pays avec 50 ou plus athletes.
-- AFRIQUE
('Afrique du Sud'),
('Algerie'),
('Egypte'),
('Kenya'),
('Maroc'),
('Nigeria'),
('Tunisie'),
-- AMERIQUES
('Argentine'),
('Bresil'),
('Canada'),
('Colombie'),
('Cuba'),
('Etats-Unis'),
('Jamaique'),
('Mexique'),
('Venezuela'),
-- ASIE
('Chine'),
('Coree du Sud'),
('Inde'),
('Iran'),
('Israel'),
('Japon'),
('Kazakhstan'),
('Ouzbékistan'),
('Taipei Chinois'),
('Thailande'),
-- EUROPE
('Allemagne'),
('Autriche'),
('Azerbaidjan'),
('Belgique'),
('Bielorussie'),
('Bulgarie'),
('Croatie'),
('Danemark'),
('Estonie'),
('Espagne'),
('Finlande'),
('France'),
('Grande Bretagne'),
('Grece'),
('Hongrie'),
('Irlande'),
('Italie'),
('Lituanie'),
('Norvege'),
('Pays Bas'),
('Pologne'),
('Portugal'),
('Republique tcheque'),
('Roumanie'),
('Russie'),
('Serbie'),
('Slovaquie'),
('Slovenie'),
('Suede'),
('Suisse'),
('Turquie'),
('Ukraine'),
-- OCEANIE
('Australie'),
('Fidji'),
('Nouvelle Zelande');
