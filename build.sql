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
  nom VARCHAR(100),
  genre VARCHAR(100),
  age INT,
  pays VARCHAR(100)
);

CREATE TABLE Team
(
  id_team SERIAL PRIMARY KEY,
  id_sport INT,
  FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
  nom VARCHAR(100),
  genre VARCHAR(100),
  pays VARCHAR(100),
)

CREATE TABLE MembreDe
(
  id_athlete int,
  FOREIGN KEY (id_athlete) REFERENCES Athlete(id_athlete),
  id_team int,
  FOREIGN KEY (id_team) REFERENCES Team(id_team),
  PRIMARY KEY (id_athlete, id_team)
)


CREATE TABLE Sport
(
  id_sport SERIAL PRIMARY KEY,
  nom VARCHAR(100),
  categorie VARCHAR(100),
  multi VARCHAR(100)
);

CREATE TABLE Event
  (
    id_event SERIAL PRIMARY KEY,
    id_sport INT;
    FOREIGN KEY (id_sport) REFERENCES Sport(id_sport),
    id_particpant INT;
    FOREIGN KEY (id_particpant) REFERENCES Athlete(id_athlete) AND Team (id_team),
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
  score INT,
);

CREATE TABLE Medaille
(
  id_medaille SERIAL PRIMARY KEY,
  type VARCHAR(100)
);



-- INSERTION

INSERT INTO Athlete (id_sport,nom,genre,age,pays) VALUES
(''),
('');

INSERT INTO Sport (nom, categorie, multi) VALUES
(''),
('');

INSERT INTO Resultat (id_medaille, id_event, temps, score) VALUES
(''),
('');

INSERT INTO Medaille (type) VALUES
('NUL'),
('BRONZE'),
('ARGENT'),
('OR');
