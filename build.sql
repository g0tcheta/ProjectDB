

-- DROP


DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Team CASCADE;
DROP TABLE IF EXISTS Membre CASCADE;
DROP TABLE IF EXISTS Participant CASCADE;
DROP TABLE IF EXISTS Sport CASCADE;
DROP TABLE IF EXISTS Event CASCADE;
DROP TABLE IF EXISTS Resultat CASCADE;
DROP TABLE IF EXISTS Medaille CASCADE;


-- CREATION
CREATE TABLE Categorie
(
  id_categorie SERIAL PRIMARY KEY,
  nom VARCHAR(255),
  nbr_sport INT
);

CREATE TABLE Sport
(
  id_sport SERIAL PRIMARY KEY,
  nom VARCHAR(255),
  id_categorie INT,
  FOREIGN KEY (id_categorie) REFERENCES Categorie(id_categorie),
  multi VARCHAR(255)
);

CREATE TABLE Athlete
(
  id_athlete SERIAL PRIMARY KEY,
  id_sport INT,
  FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
  nom VARCHAR(255),
  genre VARCHAR(255),
  age INT,
  pays VARCHAR(255)
);

CREATE TABLE Team
(
  id_team SERIAL PRIMARY KEY,
  id_sport INT,
  FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
  nom VARCHAR(255),
  genre VARCHAR(255),
  pays VARCHAR(255)
);

CREATE TABLE Membre
(
  id_athlete int,
  FOREIGN KEY (id_athlete) REFERENCES Athlete(id_athlete),
  id_team int,
  FOREIGN KEY (id_team) REFERENCES Team(id_team),
  PRIMARY KEY (id_athlete, id_team)
);

CREATE TABLE Participant
(
  id_participant SERIAL PRIMARY KEY,
  id_athlete int,
  FOREIGN KEY (id_athlete) REFERENCES Athlete(id_athlete),
  id_team int,
  FOREIGN KEY (id_team) REFERENCES Team(id_team)
);


CREATE TABLE Event
(
  id_event SERIAL PRIMARY KEY,
  id_sport INT,
  FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
  id_participant INT,
  FOREIGN KEY (id_participant) REFERENCES Participant(id_participant),
  date DATE
);

CREATE TABLE Medaille
(
  id_medaille SERIAL PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE Resultat
(
  id_resultat SERIAL PRIMARY KEY,
  id_medaille INT,
  FOREIGN KEY (id_medaille) REFERENCES Medaille(id_medaille),
  id_event INT,
  FOREIGN KEY (id_event) REFERENCES Event(id_event),
  temps TIME,
  score VARCHAR(11)
);




-- INSERTION

INSERT INTO Categorie (nom, nbr_sport) VALUES
('Athletisme',3),
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
('Volley-ball',2),
('Marathon',1);

INSERT INTO Sport (nom, id_categorie, multi) VALUES
('100m',1,'solo'),
('200m',1,'solo'),
('400m',1,'solo'),
('Aviron',2,'multi'),
('Badminton',3,'multi'),
('Basket-ball',4,'multi'),
('Boxe',5,'solo'),
('Canoe-kayak course',6,'multi'),
('Canoe-kayak slalom',6,'solo'),
('Cyclisme',7,'solo'),
('Cyclisme VTT',7,'solo'),
('Cyclisme BMX',7,'solo'),
('Cyclisme Piste',7,'solo'),
('Equitation Saut',8,'solo'),
('Equitation Dressage',8,'solo'),
('Equitation Concours',8,'solo'),
('Escrime',9,'solo'),
('Football',10,'multi'),
('Golf',11,'solo'),
('Gymnastique artistique',12,'solo'),
('Gymnastique trampoline',12,'solo'),
('Gymnastique rythmique',12,'solo'),
('Halterophilie',13,'solo'),
('Handball',14,'multi'),
('Hockey sur gazon',15,'multi'),
('Judo',16,'solo'),
('Lutte',17,'solo'),
('200m',18,'solo'),
('400m',18,'solo'),
('Plongeon',18,'solo'),
('Nage Synchronisée',18,'multi'),
('Pentathlon moderne',19,'solo'),
('Rugby a sept',20,'multi'),
('Taekwondo',21,'solo'),
('Tennis',22,'solo'),
('Tennis equipe',22,'multi'),
('Tennis de table',23,'solo'),
('Tennis de table equipe',23,'multi'),
('Tir',24,'solo'),
('Carabine',24,'solo'),
('Pistolet',24,'solo'),
('Tir a larc',25,'solo'),
('Triathlon',26,'solo'),
('Voile',27,'solo'),
('Volley-ball',28,'multi'),
('Beach-volley',28,'multi'),
('Marathon',29,'solo');

INSERT INTO Athlete (id_sport,nom,genre,age,pays) VALUES
(1,'Usain Bolt','M',30,'Jamaique'),
(2,'Usain Bolt','M',30,'Jamaique'),
(42,'Laure Gonzalez','F',21,'France'),
(20,'Nemo Zhang','M',23,'France'),
(25,'Aldana Smith','M',35,'France'),
(6,'Jeanne Berger','F',20,'France'),
(3,'Laure Dupont','F',27,'France'),
(26,'Julien Perez','M',22,'France'),
(28,'Michael Phelps','M',33,'Etats-Unis'),
(23,'Nemo Silva','M',29,'Etats-Unis'),
(30,'Julien Roosvelt','M',22,'Etats-Unis'),
(37,'Peter Bryan','M',24,'Etats-Unis'),
(29,'Eva Bryan','F',35,'Etats-Unis'),
(22,'Marie Garcia','F',35,'Etats-Unis'),
(39,'Jeanne Bryan','F',29,'Grande-Bretagne'),
(26,'Peter Berger','M',20,'Grande-Bretagne'),
(43,'Marie Lebron','F',30,'Grande-Bretagne'),
(7,'Julie Hernandez','F',30,'Grande-Bretagne'),
(29,'Peter Dupont','M',28,'Grande-Bretagne'),
(25,'Lee Garcia','M',20,'Grande-Bretagne'),
(15,'Ariana Silva','F',31,'Afrique du Sud'),
(24,'Aldana Perez','M',27,'Afrique du Sud'),
(38,'Brigitte Dupont','F',31,'Afrique du Sud'),
(12,'Morena Simpson','F',21,'Afrique du Sud'),
(10,'Marie Nguyen','F',35,'Afrique du Sud'),
(19,'Julie Roosvelt','F',24,'Afrique du Sud'),
(40,'James Hernandez','M',32,'Australie'),
(15,'Marie Hernandez','F',33,'Australie'),
(19,'Hind Dupont','F',24,'Australie'),
(26,'James Berger','M',35,'Australie'),
(21,'Lee Hernandez','M',27,'Australie'),
(23,'Thomas Dupont','M',34,'Australie'),
(19,'Julie Silva','F',28,'Chine'),
(27,'Fred Silva','M',21,'Chine'),
(1,'Aldana Dupont','M',35,'Chine'),
(11,'Arthur Dupont','M',22,'Chine'),
(35,'Morena Dupont','F',35,'Chine'),
(37,'Bruce Hernandez','M',32,'Chine'),
(36,'Nemo Lebron','M',23,'Russie'),
(16,'Will Dupont','M',28,'Russie'),
(44,'Marie Perez','F',21,'Russie'),
(3,'Aldana Muller','M',22,'Russie'),
(17,'James Zhang','M',21,'Russie'),
(13,'Donald Perez','M',26,'Russie'),
(23,'Leana Garcia','F',22,'Corée du Sud'),
(40,'Arthur Nguyen','M',24,'Corée du Sud'),
(26,'Arthur Dupont','M',20,'Corée du Sud'),
(41,'Hind Murphy','F',26,'Corée du Sud'),
(21,'Eva Simpson','F',32,'Corée du Sud'),
(3,'Bruce Simpson','M',32,'Corée du Sud'),
(44,'Arthur Smirnov','M',30,'Italie'),
(35,'Bruce Perez','M',32,'Italie'),
(33,'Will Zhang','M',35,'Italie'),
(24,'Kobe Berger','M',20,'Italie'),
(29,'Thomas Murphy','M',32,'Italie'),
(29,'Julien Smith','M',24,'Italie'),
(39,'Morena Murphy','F',22,'Pays-Bas'),
(24,'Laure Garcia','F',22,'Pays-Bas'),
(24,'Lea Dupont','F',29,'Pays-Bas'),
(24,'Lin Simpson','F',35,'Pays-Bas'),
(24,'Ariana Dupont','F',23,'Pays-Bas'),
(30,'Bruce Smirnov','M',32,'Pays-Bas'),
(17,'Thomas Roosvelt','M',35,'Hongrie'),
(27,'James Muller','M',25,'Hongrie'),
(37,'Sabine Zhang','F',25,'Hongrie'),
(34,'Donald Silva','M',33,'Hongrie'),
(12,'Laure Simpson','F',24,'Hongrie'),
(1,'Nemo Roosvelt','M',23,'Hongrie'),
(14,'Kobe Hernandez','M',35,'Bresil'),
(13,'Aldana Hernandez','M',30,'Bresil'),
(40,'Lee Roosvelt','M',31,'Bresil'),
(35,'Marie Smirnov','F',27,'Bresil'),
(29,'Nemo Simpson','M',32,'Bresil'),
(24,'Arthur Perez','M',32,'Bresil'),
(13,'Kobe Garcia','M',22,'Espagne'),
(24,'Jeanne Hernandez','F',26,'Espagne'),
(30,'James Nguyen','M',25,'Espagne'),
(30,'Will Muller','M',30,'Espagne'),
(14,'Thomas Silva','M',31,'Espagne'),
(2,'Julien Muller','M',25,'Espagne'),
(32,'James Roosvelt','M',27,'Inde'),
(2,'Arthur Silva','M',23,'Inde'),
(28,'Sabine Perez','F',29,'Inde'),
(38,'James Berger','M',23,'Inde'),
(29,'Julien Nguyen','M',23,'Inde'),
(18,'Thomas Perez','M',35,'Inde'),
(38,'Hind Hernandez','F',30,'Japon'),
(17,'James Garcia','M',31,'Japon'),
(2,'Hind Bryan','F',29,'Japon'),
(12,'Peter Dupont','M',22,'Japon'),
(33,'Leana Gonzalez','F',24,'Japon'),
(31,'Julien Silva','M',27,'Japon'),
(21,'Eva Perez','F',23,'Allemagne'),
(31,'Hind Smith','F',26,'Allemagne'),
(27,'Peter Bryan','M',21,'Allemagne'),
(23,'Jeanne Smirnov','F',33,'Allemagne'),
(23,'Lea Murphy','F',29,'Allemagne'),
(47,'Gandoulf Mariachi','M',35,'Allemagne'),
(47,'Tiger Weed','M',27,'Japon');

INSERT INTO Team (id_sport,nom,genre,pays) VALUES
(23,'DEU','F','Allemagne'),
(30,'ESP','M','Espagne'),
(24,'NLD','F','Pays-Bas'),
(29,'ITA','M','Italie');

INSERT INTO Membre (id_athlete, id_team) VALUES
(97,1),
(96,1),
(77,2),
(78,2),
(58,3),
(59,3),
(60,3),
(61,3),
(55,4),
(56,4);

INSERT INTO Participant (id_athlete, id_team) VALUES
(1,NULL),
(2,NULL),
(3,NULL),
(4,NULL),
(5,NULL),
(6,NULL),
(7,NULL),
(8,NULL),
(9,NULL),
(10,NULL),
(11,NULL),
(12,NULL),
(13,NULL),
(14,NULL),
(15,NULL),
(16,NULL),
(17,NULL),
(18,NULL),
(19,NULL),
(20,NULL),
(21,NULL),
(22,NULL),
(23,NULL),
(24,NULL),
(25,NULL),
(26,NULL),
(27,NULL),
(28,NULL),
(29,NULL),
(30,NULL),
(31,NULL),
(32,NULL),
(33,NULL),
(34,NULL),
(35,NULL),
(36,NULL),
(37,NULL),
(38,NULL),
(39,NULL),
(40,NULL),
(41,NULL),
(42,NULL),
(43,NULL),
(44,NULL),
(45,NULL),
(46,NULL),
(47,NULL),
(48,NULL),
(49,NULL),
(50,NULL),
(51,NULL),
(52,NULL),
(53,NULL),
(54,NULL),
(55,4),
(56,4),
(57,NULL),
(58,3),
(59,3),
(60,3),
(61,3),
(62,NULL),
(63,NULL),
(64,NULL),
(65,NULL),
(66,NULL),
(67,NULL),
(68,NULL),
(69,NULL),
(70,NULL),
(71,NULL),
(72,NULL),
(73,NULL),
(74,NULL),
(75,NULL),
(76,NULL),
(77,2),
(78,2),
(79,NULL),
(80,NULL),
(81,NULL),
(82,NULL),
(83,NULL),
(84,NULL),
(85,NULL),
(86,NULL),
(87,NULL),
(88,NULL),
(89,NULL),
(90,NULL),
(91,NULL),
(92,NULL),
(93,NULL),
(94,NULL),
(95,NULL),
(96,1),
(97,1),
(98,NULL),
(99,NULL);

INSERT INTO Event (id_sport, id_participant, date) VALUES
(1,1,DATE '2016-08-15'), -- temps
(1,35,DATE '2016-08-20'), -- temps
(1,68,DATE '2016-08-16'), -- temps
(2,89,DATE '2016-08-18'), -- temps
(2,82,DATE '2016-08-12'), -- temps
(2,80,DATE '2016-08-14'), -- temps
(3,7,DATE '2016-08-13'), -- temps
(3,42,DATE '2016-08-10'), -- temps
(3,50,DATE '2016-08-21'), -- temps
(4,69,DATE '2016-08-14'), -- temps
(5,76,DATE '2016-08-18'), -- point
(5,76,DATE '2016-08-9'), -- point
(6,6,DATE '2016-08-12'), -- point
(7,18,DATE '2016-08-12'), -- point
(8,12,DATE '2016-08-11'), -- temps
(9,33,DATE '2016-08-7'), -- temps
(10,25,DATE '2016-08-6'), -- temps
(11,36,DATE '2016-08-19'), -- temps
(12,24,DATE '2016-08-7'), -- temps
(12,67,DATE '2016-08-11'), -- temps
(13,44,DATE '2016-08-8'), -- temps
(13,70,DATE '2016-08-10'), -- temps
(14,79,DATE '2016-08-19'), -- temps
(15,21,DATE '2016-08-20'), -- point
(15,28,DATE '2016-08-8'), -- point
(16,40,DATE '2016-08-12'), -- point
(17,63,DATE '2016-08-21'), -- point
(17,88,DATE '2016-08-12'), -- point
(18,86,DATE '2016-08-12'), -- point
(19,26,DATE '2016-08-19'), -- point
(19,29,DATE '2016-08-15'), -- point
(20,4,DATE '2016-08-16'), -- point
(21,31,DATE '2016-08-11'), -- point
(21,49,DATE '2016-08-14'), -- point
(21,93,DATE '2016-08-9'), -- point
(22,14,DATE '2016-08-13'), -- point
(23,45,DATE '2016-08-20'), -- point
(23,96,DATE '2016-08-6'), -- point
(23,97,DATE '2016-08-18'), -- point
(24,58,DATE '2016-08-17'), -- point
(24,59,DATE '2016-08-17'), -- point
(24,60,DATE '2016-08-16'), -- point
(24,61,DATE '2016-08-16'), -- point
(24,54,DATE '2016-08-15'), -- point
(25,5,DATE '2016-08-21'), -- point
(25,20,DATE '2016-08-8'), -- point
(26,8,DATE '2016-08-7'), -- point
(26,16,DATE '2016-08-11'), -- point
(26,30,DATE '2016-08-9'), -- point
(27,64,DATE '2016-08-10'), -- point
(27,95,DATE '2016-08-6'), -- point
(27,34,DATE '2016-08-21'), -- point
(28,9,DATE '2016-08-6'), -- temps
(28,83,DATE '2016-08-9'), -- temps
(29,55,DATE '2016-08-14'), -- point
(29,56,DATE '2016-08-15'), -- point
(29,73,DATE '2016-08-15'), -- point
(29,85,DATE '2016-08-8'), -- point
(29,13,DATE '2016-08-9'), -- point
(30,62,DATE '2016-08-8'), -- temps
(30,77,DATE '2016-08-20'), -- temps
(30,78,DATE '2016-08-20'), -- temps
(30,11,DATE '2016-08-8'), -- temps
(31,92,DATE '2016-08-9'), -- point
(31,94,DATE '2016-08-10'), -- point
(32,81,DATE '2016-08-15'), -- point
(33,91,DATE '2016-08-6'), -- point
(33,53,DATE '2016-08-7'), -- point
(34,66,DATE '2016-08-13'), -- point
(34,74,DATE '2016-08-11'), -- point
(35,72,DATE '2016-08-16'), -- point
(35,37,DATE '2016-08-8'), -- point
(35,52,DATE '2016-08-19'), -- point
(36,39,DATE '2016-08-9'), -- point
(36,47,DATE '2016-08-15'), -- point
(37,38,DATE '2016-08-13'), -- point
(37,65,DATE '2016-08-13'), -- point
(38,84,DATE '2016-08-17'), -- point
(38,87,DATE '2016-08-21'), -- point
(38,23,DATE '2016-08-17'), -- point
(39,15,DATE '2016-08-7'), -- point
(39,57,DATE '2016-08-10'), -- point
(40,71,DATE '2016-08-9'), -- point
(40,27,DATE '2016-08-16'), -- point
(40,46,DATE '2016-08-13'), -- point
(41,48,DATE '2016-08-14'), -- temps
(41,75,DATE '2016-08-12'), -- temps
(41,90,DATE '2016-08-14'), -- temps
(42,3,DATE '2016-08-13'), -- temps
(42,10,DATE '2016-08-21'), -- temps
(42,19,DATE '2016-08-16'), -- temps
(43,17,DATE '2016-08-10'), -- point
(43,43,DATE '2016-08-19'), -- point
(44,41,DATE '2016-08-11'), -- point
(44,51,DATE '2016-08-18'), -- point
(45,32,DATE '2016-08-11'), -- point
(45,22,DATE '2016-08-10'), -- point
(46,98,DATE '2016-08-12'),--temps
(46,99,DATE '2016-08-12');--temps

INSERT INTO Medaille (type) VALUES
('Rien'),
('Bronze'),
('Argent'),
('Or');

INSERT INTO Resultat (id_medaille, id_event, temps, score) VALUES
(4,1,'00:09:58',NULL),
(2,2,'00:10:19',NULL),
(1,3,'00:10:50',NULL),

(4,4,'00:19:19',NULL),
(3,5,'00:19:45',NULL),
(1,6,'00:20:15',NULL),

(4,7,'00:43:03',NULL),
(3,8,'00:43:00',NULL),
(1,9,'00:44:10',NULL),

(3,10,NULL,'2e'),

(3,11,NULL,'2e'),
(4,12,NULL,'1er'),

(4,13,NULL,'1er'),

(2,14,NULL,'3e'),

(2,15,'00:40:50',NULL),

(2,16,'00:23:56',NULL),

(4,17,'00:28:42',NULL),

(2,18,'00:38:26',NULL),

(4,19,'00:32:03',NULL),
(1,20,'00:35:56',NULL),

(2,21,'00:15:56',NULL),
(4,22,'00:13:55',NULL),


(4,23,'00:45:52',NULL),

(1,24,NULL,'14e'),
(4,25,NULL,'1er'),

(3,26,NULL,'2e'),

(2,27,NULL,'3e'),
(3,28,NULL,'2e'),

(4,29,NULL,'1er'),

(1,30,NULL,'6e'),
(4,31,NULL,'1er'),

(3,32,NULL,'2e'),

(1,33,NULL,'6e'),
(3,34,NULL,'2e'),
(1,35,NULL,'5e'),

(2,36,NULL,'3e'),

(2,37,NULL,'3e'),
(3,38,NULL,'2e'),
(4,39,NULL,'1er'),

(3,40,NULL,'2e'),
(1,41,NULL,'2e'),
(3,42,NULL,'2e'),
(2,43,NULL,'2e'),
(3,44,NULL,'3e'),

(3,45,NULL,'2e'),
(2,46,NULL,'3e'),

(4,47,NULL,'1er'),
(2,48,NULL,'3e'),
(3,49,NULL,'2e'),

(4,50,NULL,'1er'),
(2,51,NULL,'3e'),
(1,52,NULL,'4e'),

(4,53,'00:34:08',NULL),
(2,54,'00:38:50',NULL),

(4,55,NULL,'1er'),
(4,56,NULL,'1er'),
(1,57,NULL,'4e'),
(3,58,NULL,'2e'),
(1,59,NULL,'6e'),

(4,60,'00:52:23',NULL),
(1,61,'00:55:25',NULL),
(2,62,'00:54:12',NULL),
(1,63,'00:58:20',NULL),

(1,64,NULL,'5e'),
(3,65,NULL,'2e'),

(4,66,NULL,'1er'),

(1,67,NULL,'5e'),
(3,68,NULL,'2e'),

(2,69,NULL,'3e'),
(3,70,NULL,'2e'),

(1,71,NULL,'6e'),
(2,72,NULL,'3e'),
(3,73,NULL,'2e'),

(1,74,NULL,'9e'),
(3,75,NULL,'2e'),

(2,76,NULL,'3e'),
(3,77,NULL,'2e'),

(3,78,NULL,'2e'),
(4,79,NULL,'1er'),
(2,80,NULL,'3e'),

(1,81,NULL,'5e'),
(4,82,NULL,'1er'),

(4,83,NULL,'1er'),
(1,84,NULL,'5e'),
(3,85,NULL,'2e'),

(2,86,'00:48:20',NULL),
(3,87,'00:45:30',NULL),
(1,88,'00:50:40',NULL),

(1,89,'00:50:03',NULL),
(1,90,'00:45:45',NULL),
(4,91,'00:38:50',NULL),

(3,92,NULL,'2e'),
(2,93,NULL,'3e'),

(4,94,NULL,'1er'),
(1,95,NULL,'5e'),

(3,96,NULL,'2e'),
(2,97,NULL,'3e'),

(4,98,'02:21:46',NULL),
(3,99,'02:35:12',NULL);
