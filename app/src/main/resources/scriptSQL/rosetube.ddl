DROP DATABASE  IF EXISTS rosetube;
CREATE DATABASE rosetube;
USE rosetube;
CREATE TABLE Artiste (nom varchar(255) NOT NULL, biographie text, pays varchar(255), urlPhoto varchar(255) , PRIMARY KEY (nom));
CREATE TABLE Commentaire (titreid int(10) NOT NULL, utilisateurPseudo varchar(255) NOT NULL, id int(10) NOT NULL AUTO_INCREMENT, commentaire text NOT NULL, `date` int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE LikeOuDislike (id int(10) NOT NULL AUTO_INCREMENT, likeOuDislike int(10) NOT NULL, titreId int(10) NOT NULL, utilisateurPseudo varchar(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE Playlist (id int(10) NOT NULL AUTO_INCREMENT, utilisateurPseudo varchar(255) NOT NULL, nom varchar(255) NOT NULL, dateCreation date , PRIMARY KEY (id));
CREATE TABLE Titre (id int(10) NOT NULL AUTO_INCREMENT, nomArtiste VARCHAR(255) NOT NULL, nom varchar(255) NOT NULL, url varchar(255) NOT NULL UNIQUE, duree VARCHAR(255), urlImage varchar(255) UNIQUE, dateSortie VARCHAR(255), genre VARCHAR(255), titreAlbum varchar(255), PRIMARY KEY (id));
CREATE TABLE Titre_Playlist (titreId int(10) NOT NULL, playlistId int(10) NOT NULL, PRIMARY KEY (titreId, playlistId));
CREATE TABLE Utilisateur (pseudo varchar(255) NOT NULL, courriel varchar(50) NOT NULL, motPasse varchar(255) NOT NULL, PRIMARY KEY (pseudo));
ALTER TABLE LikeOuDislike ADD CONSTRAINT FKLikeOuDisl172807 FOREIGN KEY (TitreId) REFERENCES Titre (id);
ALTER TABLE LikeOuDislike ADD CONSTRAINT FKLikeOuDisl334912 FOREIGN KEY (UtilisateurPseudo) REFERENCES Utilisateur (pseudo);
ALTER TABLE Playlist ADD CONSTRAINT FKPlaylist63323 FOREIGN KEY (UtilisateurPseudo) REFERENCES Utilisateur (pseudo);
ALTER TABLE Commentaire ADD CONSTRAINT FKCommentair768160 FOREIGN KEY (titreid) REFERENCES Titre (id);
ALTER TABLE Commentaire ADD CONSTRAINT FKCommentair232032 FOREIGN KEY (utilisateurPseudo) REFERENCES Utilisateur (pseudo);
ALTER TABLE Titre ADD CONSTRAINT FKTitre361371 FOREIGN KEY (nomArtiste) REFERENCES Artiste (nom);
ALTER TABLE Titre_Playlist ADD CONSTRAINT FKTitre_Play36931 FOREIGN KEY (playlistId) REFERENCES Playlist (id);
ALTER TABLE Titre_Playlist ADD CONSTRAINT FKTitre_Play48210 FOREIGN KEY (titreId) REFERENCES Titre (id);
