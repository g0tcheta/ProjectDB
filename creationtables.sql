-- DROP

DROP TABLE IF EXISTS Athlete;
DROP TABLE IF EXISTS Pays;
DROP TABLE IF EXISTS Epreuve;
DROP TABLE IF EXISTS Categorie_Sport;
DROP TABLE IF EXISTS Resultat;
DROP TABLE IF EXISTS Date;



-- CREATION



CREATE TABLE Athlete
(
id SERIAL PRIMARY KEY,
id_pays INT,
FOREIGN KEY (id_pays) REFERENCES Pays(id),
nom VARCHAR(100),
genre VARCHAR(100),
age INT,
discipline VARCHAR(100),
FOREIGN KEY (discipline) REFERENCES Epreuve(nom)
);

CREATE TABLE Pays
(
id SERIAL PRIMARY KEY,
nom VARCHAR(100)
);

CREATE TABLE Categorie_Sport
(
id SERIAL PRIMARY KEY,
nom VARCHAR(100),
nbr_epreuve INT
);

CREATE TABLE Epreuve
(
id SERIAL PRIMARY KEY,
nom VARCHAR(100),
solo_multi VARCHAR(100),
date DATE,
FOREIGN KEY (date) REFERENCES Date(date),
heure TIME,
FOREIGN KEY (heure) REFERENCES Date(heure),
categorie VARCHAR(100),
FOREIGN KEY (categorie) REFERENCES Categorie_Sport(id)
);

CREATE TABLE Resultat
(
id SERIAL PRIMARY KEY,
epreuve VARCHAR(100),
FOREIGN KEY (epreuve) REFERENCES Epreuve(nom),
gagnant VARCHAR(100),
FOREIGN KEY (epreuve) REFERENCES Athlete(nom),
medaille VARCHAR(100),
score INT,
temps TIME
);

CREATE TABLE Date
(
id SERIAL PRIMARY KEY,
date DATE,
heure TIME
);



-- INSERTION



INSERT INTO Athlete (id_pays,nom,genre,age,discipline) VALUES
(1,'Bob','M',38,'Athletisme');

INSERT INTO Categorie_Sport (nom, nbr_epreuve) VALUES
('Athletisme',1),
('Aviron',1),
('Badminton',1),
('Basket-ball',1),
('Boxe',1),
('Canoe-kayak',2),
('Cyclisme',4),
('Equitation',3),
('Escrime',1),
('Football',1),
('Golf',1),
('Gymnastique',3),
('Halterophilie',1),
('Handball',1),
('Hockey sur gazon',1),
('Judo',1),
('Lutte',2),
('Sports aquatique',4),
('Pentathlon moderne',1),
('Rugby a sept',1),
('Taekwondo',1),
('Tennis',1),
('Tennis de table',1),
('Tir',3),
('Tir a larc',1),
('Triathlon',1),
('Voile',1),
('Volley-ball',2);


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
