-- Création de la table Dossier
CREATE TABLE Dossier (
    Num_dossier INT PRIMARY KEY,
    Type_infraction VARCHAR(50),
    Etat_dossier VARCHAR(50)
);

-- Création de la table Acteur_externe
CREATE TABLE Acteur_externe (
    ID_acteur_ext INT PRIMARY KEY,
    Nom_acteur_ext VARCHAR(50),
    Date_naissance DATE,
    Adresse_IP VARCHAR(50),
    Role VARCHAR(50),
    Temoignage VARCHAR(50),
    Adresse_mail VARCHAR(50)
);

-- Création de la table Institution
CREATE TABLE Institution (
    ID_institution INT PRIMARY KEY,
    Nom_institution VARCHAR(50),
    Type_institution VARCHAR(50)
);

-- Création de la table Preuve
CREATE TABLE Preuve (
    ID_preuve INT PRIMARY KEY,
    Type_malware VARCHAR(50),
    Type_bien_saisi VARCHAR(50),
    Log_activite_cyber VARCHAR(50),
    Num_dossier INT,
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier)
);

-- Création de la table Flux_financier
CREATE TABLE Flux_financier (
    ID_flux INT PRIMARY KEY,
    Numero_bancaire VARCHAR(50),
    Valeur_saisie DOUBLE,
    Montant_transaction DOUBLE,
    Montant_crypto DOUBLE,
    Num_dossier INT,
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier)
);

-- Création de la table Operation
CREATE TABLE Operation (
    ID_Operation INT PRIMARY KEY,
    Date_perquisition DATETIME,
    Lieu_arrestation VARCHAR(50),
    Num_dossier INT,
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier)
);

-- Création de la table Doc_judiciaire
CREATE TABLE Doc_judiciaire (
    ID_Document INT PRIMARY KEY,
    Num_mandat VARCHAR(50),
    Decision_justice VARCHAR(50),
    Num_dossier INT,
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier)
);

-- Création de la table Fichier_media
CREATE TABLE Fichier_media (
    ID_Fichier INT PRIMARY KEY,
    Nom_fichier VARCHAR(50),
    Type_media VARCHAR(50),
    Num_dossier INT,
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier)
);

-- Création de la table Localisation
CREATE TABLE Localisation (
    ID_localisation INT PRIMARY KEY,
    Coordonnees_GPS VARCHAR(50),
    Date_evenement DATE,
    Heure_evenement TIME,
    ID_Operation INT,
    FOREIGN KEY (ID_Operation) REFERENCES Operation(ID_Operation)
);

-- Création de la table Chaine_Garde
CREATE TABLE Chaine_Garde (
    ID_Chaine INT PRIMARY KEY,
    Nom_agent_responsable VARCHAR(50),
    Date_acces_donnees DATETIME,
    ID_preuve INT,
    FOREIGN KEY (ID_preuve) REFERENCES Preuve(ID_preuve)
);

-- Création de la table Metadonnee_Acces
CREATE TABLE Metadonnee_Acces (
    ID_Metadonnee INT PRIMARY KEY,
    Utilisateur_editeur VARCHAR(50),
    Date_d_acces DATETIME
);

-- Création de la table Acteur_interne
CREATE TABLE Acteur_interne (
    ID_Acteur_Int INT PRIMARY KEY,
    Nom_acteur_int VARCHAR(50),
    Unite VARCHAR(50),
    Email_Pro VARCHAR(50),
    Prenom_acteur VARCHAR(50)
);

-- Création de la table COLLABORER (table de liaison)
CREATE TABLE COLLABORER (
    Num_dossier INT,
    ID_acteur_ext INT,
    ID_institution INT,
    ID_Acteur_Int INT,
    PRIMARY KEY (Num_dossier, ID_acteur_ext, ID_institution, ID_Acteur_Int),
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier),
    FOREIGN KEY (ID_acteur_ext) REFERENCES Acteur_externe(ID_acteur_ext),
    FOREIGN KEY (ID_institution) REFERENCES Institution(ID_institution),
    FOREIGN KEY (ID_Acteur_Int) REFERENCES Acteur_interne(ID_Acteur_Int)
);

-- Création de la table CONSULTER (table de liaison)
CREATE TABLE CONSULTER (
    Num_dossier INT,
    ID_Metadonnee INT,
    PRIMARY KEY (Num_dossier, ID_Metadonnee),
    FOREIGN KEY (Num_dossier) REFERENCES Dossier(Num_dossier),
    FOREIGN KEY (ID_Metadonnee) REFERENCES Metadonnee_Acces(ID_Metadonnee)
);

-- Création de la table SUPERVISER (table de liaison)
CREATE TABLE SUPERVISER (
    ID_Acteur_Int INT,
    ID_Acteur_Int_1 INT,
    PRIMARY KEY (ID_Acteur_Int, ID_Acteur_Int_1),
    FOREIGN KEY (ID_Acteur_Int) REFERENCES Acteur_interne(ID_Acteur_Int),
    FOREIGN KEY (ID_Acteur_Int_1) REFERENCES Acteur_interne(ID_Acteur_Int)
);