--
drop schema if exists bibliotheque_bda cascade;
create schema bibliotheque_bda;
set search_path to bibliotheque_bda;


CREATE TABLE auteurs (
  PRIMARY KEY (num_auteur),
  num_auteur    integer NOT NULL,
  nom_auteur    text,
  prenom_auteur text
);

CREATE TABLE emprunts (
  PRIMARY KEY (num_oeuvre, num_exemplaire, date_emprunt),
  num_oeuvre     integer NOT NULL,
  num_exemplaire integer NOT NULL,
  date_emprunt   date NOT NULL,
  date_retour    date,
  num_usager     integer NOT NULL
);

CREATE TABLE exemplaires (
  PRIMARY KEY (num_oeuvre, num_exemplaire),
  num_oeuvre      integer NOT NULL,
  num_exemplaire  integer NOT NULL,
  date_exemplaire date
);

CREATE TABLE oeuvres (
  PRIMARY KEY (num_oeuvre),
  num_oeuvre   integer NOT NULL,
  titre_oeuvre text,
  annee_oeuvre integer
);

CREATE TABLE est_auteur (
  PRIMARY KEY (num_auteur, num_oeuvre),
  num_auteur integer NOT NULL,
  num_oeuvre integer NOT NULL
);

CREATE TABLE usagers (
  PRIMARY KEY (num_usager),
  num_usager    integer NOT NULL,
  nom_usager    text,
  prenom_usager text
);

ALTER TABLE emprunts ADD constraint fk_emprunt_usager FOREIGN KEY (num_usager) REFERENCES usagers (num_usager);
ALTER TABLE emprunts ADD FOREIGN KEY (num_oeuvre, num_exemplaire) REFERENCES exemplaires (num_oeuvre, num_exemplaire);

ALTER TABLE exemplaires ADD FOREIGN KEY (num_oeuvre) REFERENCES oeuvres (num_oeuvre);

ALTER TABLE est_auteur ADD FOREIGN KEY (num_auteur) REFERENCES auteurs (num_auteur);
ALTER TABLE est_auteur ADD FOREIGN KEY (num_oeuvre) REFERENCES oeuvres (num_oeuvre);




begin;
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (1, 'Hugo', 'Victor');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (2, 'Zola', 'Émile');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (3, 'Dumas', 'Alexandre');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (4, 'Balzac', 'Honoré de');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (5, 'Flaubert', 'Gustave');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (6, 'Proust', 'Marcel');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (7, 'Camus', 'Albert');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (8, 'Voltaire', NULL);
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (9, 'Maupassant', 'Guy de');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (10, 'de Saint-Exupéry', 'Antoine');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (11, 'Edmont', 'de Goncourt');
INSERT INTO bibliotheque_bda.auteurs (num_auteur, nom_auteur, prenom_auteur) VALUES (12, 'Jules', 'de Goncourt');



INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (1, 'Les Misérables', 1862);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (2, 'Germinal', 1885);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (3, 'Les Trois Mousquetaires', 1844);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (4, 'Le Père Goriot', 1835);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (5, 'Madame Bovary', 1856);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (6, 'À la recherche du temps perdu', 1913);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (7, 'L"Etranger', 1942);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (8, 'Candide', 1759);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (9, 'Bel-Ami', 1885);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (10, 'Le Petit Prince', 1943);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (11, 'Notre-Dame de Paris', 1831);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (12, 'Thérèse Raquin', 1867);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (13, 'L"Homme qui rit"', 1869);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (14, 'Nana', 1880);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (15, 'Le Comte de Monte-Cristo', 1851);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (16, 'Germinie Lacerteux', 1865);
INSERT INTO bibliotheque_bda.oeuvres (num_oeuvre, titre_oeuvre, annee_oeuvre) VALUES (17, 'Ali Baba et les quarante voleurs', 1832);



INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (5, 8, '1980-03-12');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (1, 4, '1980-08-19');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (5, 10, '1980-10-14');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (9, 10, '1981-01-21');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (12, 5, '1981-02-13');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (2, 4, '1981-08-01');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (7, 8, '1981-11-18');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (2, 7, '1982-03-02');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (7, 2, '1982-08-03');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (1, 1, '1983-03-07');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (4, 8, '1984-01-20');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (8, 7, '1984-05-08');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (15, 6, '1984-09-13');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (16, 4, '1984-10-19');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (3, 5, '1984-12-15');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (3, 4, '1985-05-31');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (2, 10, '1985-07-29');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (17, 7, '1985-10-29');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (3, 7, '1985-11-25');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (7, 4, '1985-12-07');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (6, 7, '1985-12-28');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (6, 5, '1986-04-29');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (8, 5, '1986-09-04');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (2, 6, '1987-01-04');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (14, 1, '1987-04-26');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (14, 6, '1987-05-29');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (5, 6, '1987-08-05');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (11, 1, '1987-10-28');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (17, 3, '1987-12-19');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (8, 10, '1988-03-11');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (6, 3, '1988-04-15');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (5, 3, '1988-08-14');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (14, 3, '1988-11-23');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (7, 10, '1989-05-06');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (9, 3, '1989-08-11');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (16, 9, '1989-08-26');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (8, 6, '1990-02-24');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (5, 1, '1990-06-03');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (9, 6, '1990-07-06');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (1, 5, '1991-02-05');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (13, 7, '1991-03-05');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (13, 9, '1991-03-27');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (16, 6, '1991-04-06');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (9, 7, '1991-05-19');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (12, 7, '1991-06-27');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (15, 7, '1991-10-03');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (17, 1, '1991-10-03');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (17, 9, '1991-11-28');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (11, 8, '1992-05-03');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (15, 2, '1992-07-28');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (13, 4, '1992-08-07');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (4, 6, '1992-12-06');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (3, 8, '1993-01-20');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (11, 3, '1993-02-01');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (1, 10, '1993-04-06');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (11, 5, '1994-08-29');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (6, 10, '1994-09-15');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (8, 9, '1994-11-20');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (12, 4, '1994-12-13');
INSERT INTO bibliotheque_bda.exemplaires (num_oeuvre, num_exemplaire, date_exemplaire) VALUES (1, 8, '1995-08-19');



INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (28, 'Petit', 'Alexandre');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (29, 'Durand', 'Emma');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (30, 'Leroy', 'Lucas');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (31, 'Moreau', 'Camille');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (32, 'Simon', 'Mathilde');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (33, 'Laurent', 'Antoine');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (34, 'Michel', 'Manon');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (35, 'Garcia', 'Hugo');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (36, 'David', 'Chloé');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (37, 'Bertrand', 'Thomas');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (38, 'Roux', 'Léa');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (39, 'Vincent', 'Arthur');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (40, 'Fournier', 'Louise');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (41, 'Nguyen', 'Thi');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (42, 'Gomez', 'Diego');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (43, 'Ali', 'Amina');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (44, 'Cohen', 'Sarah');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (45, 'Lopez', 'Gabriel');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (46, 'Bouvier', 'Leila');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (47, 'Moreno', 'Raphael');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (48, 'Roy', 'Sofia');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (49, 'Fischer', 'Mohamed');
INSERT INTO bibliotheque_bda.usagers (num_usager, nom_usager, prenom_usager) VALUES (50, 'Girard', 'Inès');



INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2020-05-22', '2020-07-23', 40);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2020-04-24', '2020-05-11', 40);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 8, '2020-11-19', '2020-12-01', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 2, '2021-03-14', '2021-03-16', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 4, '2021-05-11', '2021-07-29', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 10, '2020-06-24', '2020-07-05', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2020-05-28', '2020-07-31', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2020-01-11', '2020-02-07', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2021-08-07', '2022-03-08', 31);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-07-24', '2020-08-04', 31);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2023-05-03', '2023-07-03', 31);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2020-10-19', '2020-10-27', 31);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2021-09-03', '2021-12-02', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2021-02-05', '2021-02-27', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2021-06-26', '2021-07-17', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 7, '2022-01-06', '2022-07-03', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 5, '2022-03-05', '2022-06-05', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 3, '2020-01-02', '2020-11-13', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 10, '2023-11-09', NULL, 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2021-09-26', '2021-11-01', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2021-11-28', '2022-01-17', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2020-11-16', '2021-04-01', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2023-02-15', '2023-03-14', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2020-04-11', '2020-04-20', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2023-01-24', '2023-06-26', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2023-05-26', '2023-05-30', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2021-04-09', '2021-04-18', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2022-08-22', '2022-10-30', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2020-09-28', '2021-02-03', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2022-02-28', '2022-05-18', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2020-08-18', '2020-08-22', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2022-03-24', '2022-09-05', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2020-09-07', '2021-04-10', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2020-11-09', '2021-03-23', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2020-06-14', '2020-09-19', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2022-12-24', '2023-03-12', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2021-04-23', '2021-04-23', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2023-06-12', '2023-07-13', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2022-09-18', '2022-10-10', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-08-08', '2020-10-08', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2022-11-05', '2023-03-11', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2022-12-06', '2023-01-09', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2021-12-22', '2022-02-06', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2021-04-10', '2021-04-17', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2022-07-17', '2022-07-30', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2020-05-06', '2020-06-10', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-01-22', '2020-02-07', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2020-08-04', '2020-12-26', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2021-10-18', '2021-11-19', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2023-01-04', '2023-05-20', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2022-09-19', '2022-12-12', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2022-06-26', '2022-08-06', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2022-01-17', '2022-02-02', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2021-05-10', '2021-05-12', 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2022-12-13', '2023-04-05', 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2023-10-04', NULL, 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2020-05-05', '2020-08-26', 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 8, '2022-06-25', '2022-08-07', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 2, '2023-08-14', NULL, 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 4, '2020-11-27', '2021-03-01', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 10, '2020-11-30', '2021-01-05', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2022-06-22', '2023-04-11', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2021-08-26', '2022-06-09', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2020-07-22', '2021-08-21', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2020-04-08', '2020-04-20', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2020-06-30', '2020-07-10', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2020-05-24', '2020-06-16', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2021-04-14', '2021-06-23', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2021-09-07', '2022-07-12', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2021-08-05', '2021-08-25', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2021-05-18', '2021-08-10', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2022-07-14', '2022-08-10', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2021-12-19', '2022-06-05', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 7, '2021-07-03', '2021-09-16', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 4, '2020-07-27', '2022-01-30', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2022-07-24', '2022-08-02', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2022-02-14', '2022-02-18', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2021-05-25', '2021-07-19', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2021-11-24', '2021-11-27', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2021-05-27', '2022-02-01', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2023-03-23', '2023-03-27', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2022-06-20', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2022-04-10', '2022-07-07', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2022-03-14', '2022-06-29', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2021-04-27', '2021-05-03', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2020-08-14', '2020-09-04', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 7, '2021-11-27', '2022-07-29', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 9, '2020-06-30', '2020-09-16', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 4, '2020-06-18', '2020-07-20', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (1, 4, '2021-09-25', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (1, 1, '2023-04-08', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (1, 5, '2023-08-09', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (1, 10, '2023-09-22', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (1, 8, '2022-11-23', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 6, '2022-02-28', '2022-06-12', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 7, '2020-03-13', '2020-06-05', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 2, '2020-04-10', '2020-08-22', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2020-10-05', '2020-10-13', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-07-08', '2020-07-22', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2021-03-06', '2021-03-12', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2022-02-26', '2022-10-10', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 7, '2020-09-10', '2022-09-22', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 3, '2020-06-25', '2020-07-11', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 9, '2021-11-17', '2022-08-25', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 10, '2022-08-12', '2023-01-29', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 3, '2022-09-17', NULL, 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 1, '2023-09-25', '2023-10-14', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2021-03-03', '2021-03-19', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-05-08', '2020-07-01', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2020-03-15', '2020-07-24', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 1, '2020-07-27', '2021-03-31', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2022-10-25', NULL, 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2020-05-27', '2020-11-30', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2021-11-16', '2021-11-30', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2022-10-09', '2023-04-24', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2021-06-13', '2021-10-19', 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2023-01-15', '2023-05-20', 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2022-07-19', NULL, 39);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 7, '2020-01-15', '2020-08-26', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 3, '2020-11-04', '2021-12-01', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 1, '2021-05-07', '2021-09-30', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 9, '2020-07-29', '2021-01-31', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2021-07-04', '2021-07-17', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2022-08-14', '2022-10-22', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2023-01-13', '2023-05-02', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2022-10-30', '2022-10-31', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2020-08-29', '2020-10-06', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2022-01-25', '2022-05-13', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2020-01-07', '2020-08-04', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2020-02-16', '2020-02-20', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 8, '2022-01-26', '2022-03-01', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 2, '2021-06-04', '2022-09-15', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 4, '2020-02-06', '2020-04-08', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 10, '2021-12-13', '2022-06-18', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2023-11-11', '2023-11-19', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-02-27', '2020-03-03', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2022-01-16', '2022-02-13', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2021-10-01', '2021-10-04', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 8, '2022-07-26', '2022-09-30', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 6, '2022-10-31', '2022-11-12', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 3, '2021-03-12', '2022-01-29', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 7, '2022-08-28', '2023-02-11', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 9, '2022-10-16', '2022-11-08', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 4, '2023-01-21', '2023-03-08', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2020-12-01', '2020-12-23', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2021-06-28', '2021-08-13', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2023-05-17', '2023-05-23', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2020-10-13', '2020-10-22', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2022-05-23', '2022-08-17', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2022-04-08', '2022-04-23', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2020-04-25', '2020-12-15', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2022-07-10', '2022-07-19', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2020-03-16', '2020-03-20', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2021-10-23', '2021-10-29', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2020-04-17', '2020-04-21', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2023-08-26', '2023-08-31', 45);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2021-01-03', '2021-01-06', 45);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2022-12-14', '2022-12-24', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2020-10-18', '2021-01-03', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2022-07-05', '2022-10-30', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2020-06-04', '2020-06-18', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2020-08-21', '2020-10-09', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2021-01-23', '2021-02-08', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2020-06-13', '2020-07-07', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2021-05-08', '2021-08-30', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 6, '2023-07-02', NULL, 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 7, '2023-05-28', '2023-05-31', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 2, '2021-03-29', '2022-02-10', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2023-07-02', '2023-10-14', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2020-11-01', '2021-02-04', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2020-02-02', '2020-02-27', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2023-05-18', '2023-05-21', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2020-02-11', '2020-08-09', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2021-09-22', '2022-04-19', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2022-08-05', '2022-08-08', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2022-02-10', '2022-02-25', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2022-12-14', '2023-04-07', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2021-06-23', '2021-06-27', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2021-04-11', '2021-04-15', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 6, '2023-06-20', '2023-06-30', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 7, '2022-05-02', '2022-05-24', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 2, '2022-12-18', '2022-12-18', 42);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2021-09-11', '2022-02-09', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2023-09-08', NULL, 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2021-04-19', '2021-05-04', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 7, '2023-05-03', NULL, 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 9, '2020-12-14', '2020-12-22', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 7, '2020-03-15', '2021-02-20', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 5, '2021-11-21', '2022-02-28', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 10, '2022-08-23', '2022-11-07', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2021-02-16', '2021-03-22', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2021-03-12', '2021-11-11', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2020-11-08', '2020-11-09', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2023-11-28', NULL, 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2020-06-15', '2020-06-23', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 5, '2021-07-22', '2021-09-01', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 3, '2022-05-04', '2022-06-20', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 10, '2023-09-28', '2023-10-29', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2021-10-13', '2022-05-12', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2020-07-21', '2020-08-08', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2022-04-16', '2022-10-09', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2023-07-18', '2023-10-13', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2021-04-02', '2021-04-08', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 7, '2021-02-28', '2021-05-05', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 5, '2022-08-05', '2023-03-05', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 3, '2021-12-01', '2021-12-01', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 10, '2023-09-01', '2023-09-13', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2022-08-29', '2022-10-22', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2020-08-23', '2020-08-25', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2020-11-29', '2020-12-22', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 6, '2021-07-10', '2021-08-21', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2021-05-12', '2021-06-14', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2022-02-18', '2022-10-30', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2022-09-21', '2023-04-02', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2023-06-22', '2023-10-14', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 7, '2022-07-30', '2022-09-27', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 3, '2021-12-05', '2022-04-06', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 10, '2022-01-24', '2022-06-05', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2021-04-29', '2021-05-25', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2023-05-11', '2023-09-08', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2021-10-25', '2021-12-14', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2022-10-10', '2022-10-13', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 10, '2022-02-08', '2022-06-15', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2022-01-25', '2022-02-11', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 6, '2023-08-06', '2023-08-26', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2022-07-05', '2022-07-11', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2023-05-14', '2023-08-21', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2021-04-25', '2021-06-18', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 6, '2020-06-03', '2020-06-18', 48);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 1, '2023-09-03', NULL, 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2021-02-27', '2022-01-11', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 3, '2021-01-29', '2021-08-21', 29);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2023-01-10', '2023-08-23', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2020-06-20', '2020-10-14', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2020-07-21', '2020-08-12', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2023-05-28', NULL, 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 7, '2021-06-07', '2021-06-13', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 9, '2020-12-28', '2022-01-03', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 4, '2022-08-17', '2022-12-06', 43);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2020-01-01', '2020-03-12', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2021-08-15', '2021-08-24', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2022-02-18', '2022-04-27', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2022-10-27', '2022-10-29', 32);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2020-07-27', '2020-08-03', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2020-12-09', '2021-01-20', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2021-09-06', '2022-04-01', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 6, '2021-07-21', '2022-08-18', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 9, '2023-01-23', '2023-02-15', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 2, '2021-02-20', '2021-03-03', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2021-07-03', '2021-07-29', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 7, '2021-11-14', '2021-12-17', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2020-08-24', '2020-08-27', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 9, '2023-04-27', '2023-05-23', 40);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (14, 6, '2023-05-24', '2023-06-12', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 7, '2023-12-04', '2023-12-11', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 1, '2023-11-30', '2023-12-01', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 3, '2023-09-22', '2023-10-12', 38);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 10, '2023-11-04', '2023-11-09', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (9, 3, '2023-06-22', '2023-06-23', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 9, '2023-10-12', '2023-11-01', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 1, '2021-10-11', '2021-10-29', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 8, '2023-07-26', '2023-08-02', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 6, '2023-03-27', '2023-04-07', 49);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 5, '2023-08-01', '2023-08-05', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 7, '2023-01-04', '2023-02-03', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 3, '2022-11-29', '2022-12-04', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (17, 9, '2022-09-11', '2022-10-07', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (11, 8, '2023-10-19', '2023-11-12', 36);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 4, '2023-03-01', '2023-03-07', 46);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 10, '2023-05-15', '2023-05-18', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (5, 1, '2023-11-06', '2023-11-14', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 5, '2023-11-27', '2023-12-09', 50);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (12, 5, '2023-08-25', '2023-08-27', 45);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (16, 4, '2023-09-03', '2023-09-13', 41);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (4, 8, '2021-08-10', '2021-08-12', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (4, 6, '2023-04-27', '2023-05-25', 34);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (13, 4, '2023-07-15', '2023-07-20', 44);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 3, '2023-03-09', '2023-03-24', 35);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 7, '2022-09-29', '2022-10-21', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 7, '2023-06-03', '2023-07-02', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (15, 2, '2022-12-29', '2023-01-28', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (6, 5, '2023-11-27', '2023-11-27', 47);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (8, 7, '2023-09-24', '2023-10-10', 33);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 8, '2022-10-03', '2022-10-17', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 4, '2022-10-05', '2022-10-08', 37);
INSERT INTO bibliotheque_bda.emprunts (num_oeuvre, num_exemplaire, date_emprunt, date_retour, num_usager) VALUES (7, 10, '2022-11-22', '2022-11-30', 37);


--
-- Data for Name: est_auteur; Type: TABLE DATA; Schema: bibliotheque; Owner: fabien
--

INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (1, 1);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (2, 2);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (3, 3);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (4, 4);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (5, 5);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (6, 6);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (7, 7);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (8, 8);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (9, 9);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (10, 10);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (1, 11);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (2, 12);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (3, 13);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (4, 14);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (5, 15);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (11, 16);
INSERT INTO bibliotheque_bda.est_auteur (num_auteur, num_oeuvre) VALUES (12, 16);



commit;