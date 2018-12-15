

-- DROP


DROP TABLE IF EXISTS Athlete CASCADE;
DROP TABLE IF EXISTS Pays CASCADE;
DROP TABLE IF EXISTS Epreuve CASCADE;
DROP TABLE IF EXISTS Categorie_Sport CASCADE;
DROP TABLE IF EXISTS Resultat CASCADE;
DROP TABLE IF EXISTS Date CASCADE;


-- CREATION


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
  pays VARCHAR(255),
)

CREATE TABLE Membre
(
  id_athlete int,
  FOREIGN KEY (id_athlete) REFERENCES Athlete(id_athlete),
  id_team int,
  FOREIGN KEY (id_team) REFERENCES Team(id_team),
  PRIMARY KEY (id_athlete, id_team)
)

CREATE TABLE Participant
(
  id_particpant SERIAL PRIMARY KEY,
  id_athlete int,
  FOREIGN KEY (id_athlete) REFERENCES Athlete(id_athlete),
  id_team int,
  FOREIGN KEY (id_team) REFERENCES Team(id_team),
);

CREATE TABLE Sport
(
  id_sport SERIAL PRIMARY KEY,
  nom VARCHAR(255),
  categorie VARCHAR(255),
  multi VARCHAR(255)
);

CREATE TABLE Event
(
  id_event SERIAL PRIMARY KEY,
  id_sport INT;
  FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
  id_particpant INT;
  FOREIGN KEY (id_particpant) REFERENCES ,
  date DATE
);

CREATE TABLE Resultat
(
  id_resultat SERIAL PRIMARY KEY,
  id_medaille INT,
  FOREIGN KEY (id_medaille) REFERENCES Medaille(id_medaille),
  id_event INT,
  FOREIGN KEY (id_event) REFERENCES Event(id_event),
  temps TIME,
  score VARCHAR(11),
);

CREATE TABLE Medaille
(
  id_medaille SERIAL PRIMARY KEY,
  type VARCHAR(255)
);


-- INSERTION


INSERT INTO Athlete (id_sport,nom,genre,age,pays) VALUES
(,'','',,''),
(,'','',,'');

INSERT INTO Team (id_sport,nom,genre,pays) VALUES
(,'','',''),
(,'','','');

INSERT INTO Membre (id_athlete, id_team) VALUES
(,),
(,);

INSERT INTO Participant (id_athlete, id_team) VALUES
(,),
(,);

INSERT INTO Sport (nom, categorie, multi) VALUES
('','',''),
('','','');

INSERT INTO Event (id_sport, id_particpant, date) VALUES
(,,DATE '2015-12-17'),
(,,DATE '2015-12-17');

INSERT INTO Resultat (id_medaille, id_event, temps, score) VALUES
(,,'00:00',''),
(,,'00:00','');

INSERT INTO Medaille (type) VALUES
('NUL'),
('BRONZE'),
('ARGENT'),
('OR');
