ALTER TABLE Dossier
    MODIFY Type_infraction VARCHAR(50) NOT NULL,
    MODIFY Etat_dossier VARCHAR(20) NOT NULL,
    ADD CONSTRAINT type_infraction_ibfk_1 CHECK (Type_infraction IN ('enlèvement avec rançon', 'meurtre lié à rançon', 'cyber-rançon')),
    ADD CONSTRAINT etat_dossier_ibfk_1 CHECK (Etat_dossier IN ('ouvert', 'en cours', 'clos'));

ALTER TABLE Acteur_externe
    MODIFY Nom_acteur_ext VARCHAR(100) NOT NULL,
    MODIFY Date_naissance DATE, 
    MODIFY Adresse_IP VARCHAR(45),
    MODIFY Role VARCHAR(20) NOT NULL,
    ADD CONSTRAINT role_ibfk_1 CHECK (Role IN ('suspect', 'témoin', 'victime', 'informateur')),
    ADD UNIQUE (Adresse_mail); 

ALTER TABLE Institution
    MODIFY Nom_institution VARCHAR(100) NOT NULL,
    MODIFY Type_institution VARCHAR(50) NOT NULL,
    ADD CONSTRAINT type_institution_ibfk_1 CHECK (Type_institution IN ('banque', 'agence internationale', 'avocat', 'tribunal'));

ALTER TABLE Preuve
    MODIFY Num_dossier INT NOT NULL;

ALTER TABLE Flux_financier
    MODIFY Valeur_saisie DECIMAL(15,2), 
    MODIFY Montant_transaction DECIMAL(15,2),
    MODIFY Montant_crypto DECIMAL(15,2),
    ADD CONSTRAINT valeur_saisie_ibfk_1 CHECK (Valeur_saisie >= 0 OR Valeur_saisie IS NULL),
    ADD CONSTRAINT montant_transaction_ibfk_1 CHECK (Montant_transaction >= 0 OR Montant_transaction IS NULL),
    ADD CONSTRAINT montant_crypto_ibfk_1 CHECK (Montant_crypto >= 0 OR Montant_crypto IS NULL);


ALTER TABLE Operation
    MODIFY Date_perquisition DATETIME NOT NULL,
    MODIFY Num_dossier INT NOT NULL;
    

ALTER TABLE Doc_judiciaire
    ADD UNIQUE (Num_mandat),
    MODIFY Num_dossier INT NOT NULL;

ALTER TABLE Fichier_media
    MODIFY Nom_fichier VARCHAR(255) NOT NULL,
    MODIFY Type_media VARCHAR(20) NOT NULL,
    ADD CONSTRAINT type_media_ibfk_1 CHECK (Type_media IN ('video', 'audio', 'photo'));

ALTER TABLE Localisation
    MODIFY Date_evenement DATE NOT NULL,
    MODIFY ID_Operation INT NOT NULL;


ALTER TABLE Chaine_Garde
    MODIFY Nom_agent_responsable VARCHAR(100) NOT NULL,
    MODIFY Date_acces_donnees DATETIME NOT NULL;
    

ALTER TABLE Metadonnee_Acces
    MODIFY Utilisateur_editeur VARCHAR(50) NOT NULL,
    MODIFY Date_d_acces DATETIME NOT NULL;


ALTER TABLE Acteur_interne
    MODIFY Nom_acteur_int VARCHAR(100) NOT NULL,
    MODIFY Unite VARCHAR(50) NOT NULL,
    ADD CONSTRAINT chk_unite CHECK (Unite IN ('Unité Homicide', 'Unité Enlèvements et Rançons', 'Unité Cyber-Rançons', 'Unité Forensics Numériques')),
    MODIFY Email_Pro VARCHAR(100) NOT NULL,
    ADD UNIQUE (Email_Pro),
    MODIFY Prenom_acteur VARCHAR(100) NOT NULL;


ALTER TABLE COLLABORER
    MODIFY Num_dossier INT NOT NULL,
    MODIFY ID_acteur_ext INT NOT NULL,
    MODIFY ID_institution INT NOT NULL,
    MODIFY ID_Acteur_Int INT NOT NULL;


ALTER TABLE CONSULTER
    MODIFY Num_dossier INT NOT NULL,
    MODIFY ID_Metadonnee INT NOT NULL;


ALTER TABLE SUPERVISER
    MODIFY ID_Acteur_Int INT NOT NULL,
    MODIFY ID_Acteur_Int_1 INT NOT NULL;
    
ALTER TABLE acteur_externe MODIFY temoignage VARCHAR (300);

ALTER TABLE preuve MODIFY log_activite_cyber VARCHAR (300);

	ALTER TABLE Doc_judiciaire MODIFY Decision_justice VARCHAR(300);