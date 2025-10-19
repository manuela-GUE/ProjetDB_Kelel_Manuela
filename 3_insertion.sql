-- =============================================
-- INSERTION DES DONNÉES DE BASE (SANS CLÉS ÉTRANGÈRES)
-- =============================================

-- Table Dossier (10 lignes)
INSERT INTO Dossier (Num_dossier, Type_infraction, Etat_dossier) VALUES
(1, 'enlèvement avec rançon', 'ouvert'),
(2, 'meurtre lié à rançon', 'en cours'),
(3, 'cyber-rançon', 'clos'),
(4, 'enlèvement avec rançon', 'ouvert'),
(5, 'meurtre lié à rançon', 'en cours'),
(6, 'cyber-rançon', 'ouvert'),
(7, 'enlèvement avec rançon', 'clos'),
(8, 'meurtre lié à rançon', 'ouvert'),
(9, 'cyber-rançon', 'en cours'),
(10, 'enlèvement avec rançon', 'ouvert');

-- Table Acteur_externe (15 lignes)
INSERT INTO Acteur_externe (ID_acteur_ext, Nom_acteur_ext, Date_naissance, Adresse_IP, Role, Temoignage, Adresse_mail) VALUES
(1, 'Sophie Martin', '1985-03-15', '192.168.1.105', 'victime', 'J ai été enlevée le 15 janvier 2025 vers 20h30 devant mon domicile. Les ravisseurs demandaient 50 000€ en Bitcoin.', 'sophie.martin@email.com'),
(2, 'Ahmed Al-Farsi', '1990-07-22', '10.0.0.47', 'suspect', 'Je nie toute implication dans cette affaire. J étais en réunion au moment des faits.', 'ahmed.alfarsi@protonmail.com'),
(3, 'Maria Rodriguez', '1982-11-30', '172.16.23.89', 'témoin', 'J ai vu un véhicule suspect, une Renault Clio grise, stationnée devant l immeuble vers 20h15.', 'maria.rodriguez@mail.org'),
(4, 'Kenji Tanaka', '1978-05-14', '192.168.2.156', 'informateur', 'Le groupe utilise des wallets Bitcoin basés aux Seychelles pour blanchir l argent.', 'kenji.tanaka@securemail.jp'),
(5, 'Léa Dubois', '1995-09-08', '10.1.2.78', 'victime', 'Mon frère a été tué après que nous ayons refusé de payer la rançon de 75 000€.', 'lea.dubois@personal.fr'),
(6, 'Marco Bellini', '1988-12-03', '172.17.45.210', 'suspect', 'Je négocie les rançons mais je ne participe pas aux enlèvements.', 'marco.bellini@darknet.it'),
(7, 'Aisha Bello', '1992-04-18', '192.168.3.92', 'témoin', 'J ai entendu des cris provenant de l appartement du 3ème étage vers minuit.', 'aisha.bello@yahoo.com'),
(8, 'Wei Zhang', '1980-08-25', '10.2.1.143', 'informateur', 'Ils utilisent le malware "ShadowCrypt" pour chiffrer les données des victimes.', 'wei.zhang@chinamail.cn'),
(9, 'Fatima Nkosi', '1987-01-12', '172.18.67.54', 'victime', 'Ma famille a payé 25 000€ en Ethereum mais ils n ont pas libéré mon père.', 'fatima.nkosi@safemail.za'),
(10, 'Carlos Mendez', '1993-06-28', '192.168.4.201', 'suspect', 'Je gère les communications avec les familles via Telegram chiffré.', 'carlos.mendez@privacy.com'),
(11, 'Yuki Nakamura', '1984-10-05', '10.3.4.87', 'témoin', 'J ai vu deux hommes masqués forcer une personne dans un fourgon.', 'yuki.nakamura@japanmail.jp'),
(12, 'Omar Hassan', '1979-02-19', '172.19.12.98', 'informateur', 'Le chef du réseau réside à Berlin et voyage fréquemment à Dubaï.', 'omar.hassan@middleeast.ae'),
(13, 'Isabella Costa', '1991-07-07', '192.168.5.134', 'victime', 'Ils ont menacé de me tuer si la rançon de 100 000€ n était pas payée en 48h.', 'isabella.costa@brasilmail.br'),
(14, 'Rashid Al-Jaber', '1986-11-14', '10.4.5.176', 'suspect', 'Je crée les logiciels de rançon utilisés dans les cyber-attaques.', 'rashid.aljaber@secure.qa'),
(15, 'Chloe Moreau', '1994-03-21', '172.20.34.67', 'témoin', 'J ai enregistré une conversation suspecte entre deux hommes au café.', 'chloe.moreau@francemail.f');

-- Table Institution (10 lignes)
INSERT INTO Institution (ID_institution, Nom_institution, Type_institution) VALUES
(1, 'Banque Centrale Européenne', 'banque'),
(2, 'Interpol Lyon', 'agence internationale'),
(3, 'Tribunal de Grande Instance Paris', 'tribunal'),
(4, 'Cabinet d Avocats Dupont & Associés', 'avocat'),
(5, 'FBI Cyber Division', 'agence internationale'),
(6, 'Banque Crypto International', 'banque'),
(7, 'Europol Cybercrime Centre', 'agence internationale'),
(8, 'Cour d Appel de Versailles', 'tribunal'),
(9, 'Cabinet Juridique International', 'avocat'),
(10, 'Banque de France', 'banque');

-- Table Metadonnee_Acces (15 lignes)
INSERT INTO Metadonnee_Acces (ID_Metadonnee, Utilisateur_editeur, Date_d_acces) VALUES
(1, 'agent.dupont', '2025-01-20 09:15:00'),
(2, 'analyste.martin', '2025-01-20 14:30:00'),
(3, 'tech.gonzalez', '2025-01-21 10:45:00'),
(4, 'enqueteur.khan', '2025-01-21 16:20:00'),
(5, 'superviseur.leclerc', '2025-01-22 08:30:00'),
(6, 'expert.diop', '2025-01-22 11:15:00'),
(7, 'analyste.wei', '2025-01-23 13:45:00'),
(8, 'agent.petrov', '2025-01-23 15:30:00'),
(9, 'tech.patel', '2025-01-24 09:00:00'),
(10, 'enqueteur.alami', '2025-01-24 17:45:00'),
(11, 'expert.ramirez', '2025-01-25 10:30:00'),
(12, 'analyste.nkosi', '2025-01-25 14:15:00'),
(13, 'agent.nguyen', '2025-01-26 08:45:00'),
(14, 'tech.benali', '2025-01-26 12:30:00'),
(15, 'superviseur.rossi', '2025-01-27 16:00:00');
INSERT INTO Metadonnee_Acces (ID_Metadonnee, Utilisateur_editeur, Date_d_acces) VALUES
(16, 'agent.dupont', '2025-01-02 08:00:46'),
(17, 'agent.dupont', '2025-01-29 07:32:44');


-- Table Acteur_interne (10 lignes)
INSERT INTO Acteur_interne (ID_Acteur_Int, Nom_acteur_int, unite, Email_Pro, Prenom_acteur) VALUES
(1, 'Dubois', 'Unité Homicide', 'jean.dubois@fbi.gov', 'Jean'),
(2, 'Gonzalez', 'Unité Enlèvements et Rançons', 'maria.gonzalez@fbi.gov', 'Maria'),
(3, 'Khan', 'Unité Cyber-Rançons', 'ahmed.khan@fbi.gov', 'Ahmed'),
(4, 'Leclerc', 'Unité Forensics Numériques', 'sophie.leclerc@fbi.gov', 'Sophie'),
(5, 'Diop', 'Unité Homicide', 'moussa.diop@fbi.gov', 'Moussa'),
(6, 'Wei', 'Unité Enlèvements et Rançons', 'li.wei@fbi.gov', 'Li'),
(7, 'Petrov', 'Unité Cyber-Rançons', 'elena.petrov@fbi.gov', 'Elena'),
(8, 'Patel', 'Unité Forensics Numériques', 'raj.patel@fbi.gov', 'Raj'),
(9, 'Alami', 'Unité Homicide', 'fatima.alami@fbi.gov', 'Fatima'),
(10, 'Ramirez', 'Unité Enlèvements et Rançons', 'carlos.ramirez@fbi.gov', 'Carlos');
INSERT INTO Acteur_interne (ID_Acteur_Int, Nom_acteur_int, unite, Email_Pro, Prenom_acteur) VALUES
(11,'Dupont','Unité Homicide','charles.dupont@fbi.gov','Charles');

-- =============================================
-- INSERTION DES TABLES AVEC CLÉS ÉTRANGÈRES
-- =============================================

-- Table Preuve (15 lignes)
INSERT INTO Preuve (ID_preuve, Type_malware, Type_bien_saisi, Log_activite_cyber, Num_dossier) VALUES
(1, 'Ransomware', 'Ordinateur portable', '2025-01-15 20:35:12 - Infection par ShadowCrypt détectée', 1),
(2, 'Trojan', 'Smartphone', '2025-01-16 14:22:45 - Communication avec serveur C&C en Russie', 2),
(3, 'Spyware', 'Tablette', '2025-01-17 09:15:33 - Surveillance des emails de la victime', 3),
(4, 'Keylogger', 'Ordinateur de bureau', '2025-01-18 16:45:21 - Capture des identifiants bancaires', 4),
(5, 'Botnet', 'Serveur cloud', '2025-01-19 11:30:54 - Participation à DDoS contre infrastructure', 5),
(6, 'Rootkit', 'Disque dur externe', '2025-01-20 13:25:47 - Dissimulation de fichiers sensibles', 6),
(7, 'Worm', 'NAS entreprise', '2025-01-21 08:40:19 - Propagation dans le réseau local', 7),
(8, 'Adware', 'Téléphone mobile', '2025-01-22 15:55:28 - Installation d applications malveillantes', 8),
(9, 'Cryptojacking', 'PC gaming', '2025-01-23 10:20:41 - Minage de cryptomonnaie détecté', 9),
(10, 'Ransomware', 'MacBook Pro', '2025-01-24 12:35:59 - Chiffrement complet du système', 10),
(11, 'Trojan', 'Android phone', '2025-01-25 17:10:33 - Vol de données personnelles', 1),
(12, 'Spyware', 'iPad', '2025-01-26 14:45:22 - Enregistrement audio clandestin', 2),
(13, 'Keylogger', 'PC portable', '2025-01-27 09:30:44 - Interception mots de passe', 3),
(14, 'Botnet', 'Serveur web', '2025-01-28 11:25:38 - Attaque coordonnée lancée', 4),
(15, 'Rootkit', 'Station de travail', '2025-01-29 16:40:51 - Accès administrateur caché', 5);

-- Table Flux_financier (15 lignes)
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(1, 'FR76-3000-4000-5000', 50000.00, 50000.00, 1.25, 1),
(2, 'US12-3456-7890-1234', 75000.00, 75000.00, 1.87, 2),
(3, 'DE98-7654-3210-9876', 25000.00, 25000.00, 0.63, 3),
(4, 'ES45-6789-0123-4567', 100000.00, 100000.00, 2.50, 4),
(5, 'IT32-1098-7654-3210', 30000.00, 30000.00, 0.75, 5),
(6, 'GB67-8901-2345-6789', 150000.00, 150000.00, 3.75, 6),
(7, 'CA23-4567-8901-2345', 45000.00, 45000.00, 1.13, 7),
(8, 'AU11-2233-4455-6677', 80000.00, 80000.00, 2.00, 8),
(9, 'JP99-8877-6655-4433', 20000.00, 20000.00, 0.50, 9),
(10, 'BR55-4433-2211-0099', 60000.00, 60000.00, 1.50, 10),
(11, 'CH88-7766-5544-3322', 35000.00, 35000.00, 0.88, 1),
(12, 'SE77-6655-4433-2211', 90000.00, 90000.00, 2.25, 2),
(13, 'NL66-5544-3322-1100', 55000.00, 55000.00, 1.38, 3),
(14, 'BE44-3322-1100-9988', 120000.00, 120000.00, 3.00, 4),
(15, 'DK33-2211-0099-8877', 40000.00, 40000.00, 1.00, 5);
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(16, 'FR76-3000-4000-5000', 45000.00, 45000.00, 1.13, 1),
(17, 'FR76-3000-4000-5000', 40000.00, 40000.00, 1.00, 10),
(18, 'FR76-3000-4000-5000', 120000.00, 120000.00,3.00,3),
(19, 'DK33-2211-0099-8877',35000.00, 35000.00, 0.88, 1),
(20, 'NL66-5544-3322-1100', 80000.00, 80000.00, 2.00, 8);
DELETE FROM Flux_financier WHERE ID_flux = 20;
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(20,'NL66-5544-3322-1100', 80000.00, 80000.00,2.00,5);
DELETE FROM Flux_financier WHERE ID_flux = 20;
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(20,'NL66-5544-3322-1100', 20000.00, 20000.00,2.00,0.50);
DELETE FROM Flux_financier WHERE ID_flux = 20;
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(20,'NL66-5544-3322-1100', 20000.00, 20000.00,0.50,5);
DELETE FROM Flux_financier WHERE ID_flux = 19;
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(19, 'DK33-2211-0099-8877',35000.00, 35000.00, 0.88, 5);
DELETE FROM Flux_financier WHERE ID_flux = 19;
INSERT INTO Flux_financier (ID_flux, Numero_bancaire, Valeur_saisie, Montant_transaction, Montant_crypto, Num_dossier) VALUES
(19, 'DK33-2211-0099-8877',35000.00, 35000.00, 0.88, 1);

-- Table Opération (15 lignes)
INSERT INTO operation (ID_Operation, Date_perquisition, Lieu_arrestation, Num_dossier) VALUES
(1, '2025-01-25 06:00:00', 'Paris 16ème arrondissement, France', 1),
(2, '2025-01-26 07:30:00', 'Berlin Mitte, Allemagne', 2),
(3, '2025-01-27 05:45:00', 'Madrid Centro, Espagne', 3),
(4, '2025-01-28 08:15:00', 'Londres Westminster, Royaume-Uni', 4),
(5, '2025-01-29 06:30:00', 'Rome Centro, Italie', 5),
(6, '2025-01-30 07:00:00', 'Bruxelles Centre, Belgique', 6),
(7, '2025-01-31 05:15:00', 'Amsterdam Centrum, Pays-Bas', 7),
(8, '2025-02-01 08:45:00', 'Vienne Innere Stadt, Autriche', 8),
(9, '2025-02-02 06:20:00', 'Prague Old Town, République Tchèque', 9),
(10, '2025-02-03 07:10:00', 'Lisbonne Baixa, Portugal', 10),
(11, '2025-02-04 05:50:00', 'Stockholm Gamla Stan, Suède', 1),
(12, '2025-02-05 08:25:00', 'Copenhague Indre By, Danemark', 2),
(13, '2025-02-06 06:40:00', 'Dublin City Centre, Irlande', 3),
(14, '2025-02-07 07:35:00', 'Helsinki Keskusta, Finlande', 4),
(15, '2025-02-08 05:25:00', 'Oslo Sentrum, Norvège', 5);

-- Table Doc_judiciaire (15 lignes)
INSERT INTO Doc_judiciaire (ID_Document, Num_mandat, Decision_justice, Num_dossier) VALUES
(1, 'M2025-001', 'Mandat de perquisition accordé pour le domicile du suspect principal', 1),
(2, 'M2025-002', 'Autorisation de surveillance électronique renouvelée pour 30 jours', 2),
(3, 'M2025-003', 'Gel des comptes bancaires des suspects ordonné par le juge', 3),
(4, 'M2025-004', 'Extension du mandat d arrêt international approuvée', 4),
(5, 'M2025-005', 'Audition des témoins protégés autorisée', 5),
(6, 'M2025-006', 'Saisie des biens criminels validée par la cour', 6),
(7, 'M2025-007', 'Collaboration avec Interpol officiellement établie', 7),
(8, 'M2025-008', 'Protection des victimes renforcée par décision judiciaire', 8),
(9, 'M2025-009', 'Accès aux données cryptographiques accordé', 9),
(10, 'M2025-010', 'Extradition des suspects principaux approuvée', 10),
(11, 'M2025-011', 'Surveillance téléphonique étendue à 6 numéros', 1),
(12, 'M2025-012', 'Blocage des wallets crypto identifiés', 2),
(13, 'M2025-013', 'Perquisition numérique des serveurs cloud autorisée', 3),
(14, 'M2025-014', 'Protection de l informateur maintenue', 4),
(15, 'M2025-015', 'Clôture de l enquête partielle approuvée', 5);

-- Table Fichier_media (15 lignes)
INSERT INTO Fichier_media (ID_Fichier, Nom_fichier, Type_media, Num_dossier) VALUES
(1, 'surveillance_cafe_20250115.mp4', 'video', 1),
(2, 'enregistrement_rançon_20250116.wav', 'audio', 2),
(3, 'photo_scene_crime_20250117.jpg', 'photo', 3),
(4, 'video_perquisition_20250118.mp4', 'video', 4),
(5, 'appel_suspect_20250119.m4a', 'audio', 5),
(6, 'empreintes_digitales_20250120.jpg', 'photo', 6),
(7, 'reconstitution_20250121.mp4', 'video', 7),
(8, 'temoignage_victime_20250122.wav', 'audio', 8),
(9, 'documents_saisis_20250123.jpg', 'photo', 9),
(10, 'arrestation_20250124.mp4', 'video', 10),
(11, 'analyse_forensics_20250125.jpg', 'photo', 1),
(12, 'négociation_rançon_20250126.m4a', 'audio', 2),
(13, 'carte_reseau_20250127.jpg', 'photo', 3),
(14, 'interrogatoire_20250128.mp4', 'video', 4),
(15, 'preuves_digitales_20250129.jpg', 'photo', 5);

-- Table Localisation (15 lignes)
INSERT INTO Localisation (ID_localisation, Coordonnees_GPS, Date_evenement, Heure_evenement, ID_Operation) VALUES
(1, '48.8566, 2.3522', '2025-01-15', '20:30:00', 1),
(2, '52.5200, 13.4050', '2025-01-16', '14:15:00', 2),
(3, '40.4168, -3.7038', '2025-01-17', '09:45:00', 3),
(4, '51.5074, -0.1278', '2025-01-18', '16:30:00', 4),
(5, '41.9028, 12.4964', '2025-01-19', '11:20:00', 5),
(6, '50.8503, 4.3517', '2025-01-20', '13:10:00', 6),
(7, '52.3676, 4.9041', '2025-01-21', '08:55:00', 7),
(8, '48.2082, 16.3738', '2025-01-22', '15:40:00', 8),
(9, '50.0755, 14.4378', '2025-01-23', '10:25:00', 9),
(10, '38.7223, -9.1393', '2025-01-24', '12:50:00', 10),
(11, '59.3293, 18.0686', '2025-01-25', '17:35:00', 11),
(12, '55.6761, 12.5683', '2025-01-26', '14:05:00', 12),
(13, '53.3498, -6.2603', '2025-01-27', '09:30:00', 13),
(14, '60.1695, 24.9354', '2025-01-28', '11:45:00', 14),
(15, '59.9139, 10.7522', '2025-01-29', '16:20:00', 15);

-- Table Chaine_Garde (15 lignes)
INSERT INTO Chaine_Garde (ID_Chaine, Nom_agent_responsable, Date_acces_donnees, ID_preuve) VALUES
(1, 'Agent Jean Dubois', '2025-01-25 10:00:00', 1),
(2, 'Expert Sophie Leclerc', '2025-01-25 11:30:00', 2),
(3, 'Analyste Ahmed Khan', '2025-01-25 14:15:00', 3),
(4, 'Technicien Maria Gonzalez', '2025-01-26 09:45:00', 4),
(5, 'Enquêteur Moussa Diop', '2025-01-26 16:20:00', 5),
(6, 'Spécialiste Li Wei', '2025-01-27 08:30:00', 6),
(7, 'Cyber-expert Elena Petrov', '2025-01-27 13:45:00', 7),
(8, 'Forensic Raj Patel', '2025-01-28 10:15:00', 8),
(9, 'Agent Fatima Alami', '2025-01-28 15:30:00', 9),
(10, 'Enquêteur Carlos Ramirez', '2025-01-29 11:00:00', 10),
(11, 'Superviseur Jean Dubois', '2025-01-29 17:45:00', 11),
(12, 'Expert Sophie Leclerc', '2025-01-30 09:20:00', 12),
(13, 'Analyste Ahmed Khan', '2025-01-30 14:50:00', 13),
(14, 'Technicien Maria Gonzalez', '2025-01-31 10:35:00', 14),
(15, 'Enquêteur Moussa Diop', '2025-01-31 16:10:00', 15);

-- =============================================
-- INSERTION DES TABLES DE RELATION
-- =============================================

-- Table COLLABORER (30 lignes)
INSERT INTO COLLABORER (Num_dossier, ID_acteur_ext, ID_institution, ID_Acteur_Int) VALUES
(1, 1, 1, 1), (1, 2, 2, 2), (1, 3, 3, 3), (1, 4, 4, 4), (1, 5, 5, 5),
(2, 6, 6, 6), (2, 7, 7, 7), (2, 8, 8, 8), (2, 9, 9, 9), (2, 10, 10, 10),
(3, 11, 1, 1), (3, 12, 2, 2), (3, 13, 3, 3), (3, 14, 4, 4), (3, 15, 5, 5),
(4, 1, 6, 6), (4, 2, 7, 7), (4, 3, 8, 8), (4, 4, 9, 9), (4, 5, 10, 10),
(5, 6, 1, 1), (5, 7, 2, 2), (5, 8, 3, 3), (5, 9, 4, 4), (5, 10, 5, 5),
(6, 11, 6, 6), (6, 12, 7, 7), (6, 13, 8, 8), (6, 14, 9, 9), (6, 15, 10, 10);
INSERT INTO COLLABORER (Num_dossier, ID_acteur_ext, ID_institution, ID_Acteur_Int) VALUES
(6, 4, 4, 7), (5, 4, 4, 10);

-- Table CONSULTER (30 lignes)
INSERT INTO CONSULTER (Num_dossier, ID_Metadonnee) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5),
(5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
(6, 11), (6, 12), (6, 13), (6, 14), (6, 15);

-- Table SUPERVISER (20 lignes)
INSERT INTO SUPERVISER (ID_Acteur_Int, ID_Acteur_Int_1) VALUES
(1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9),
(3, 10), (3, 1), (3, 2), (3, 3),
(4, 4), (4, 5), (4, 6), (4, 7),
(5, 8), (5, 9), (5, 10), (1, 6);

-- =============================================
-- VÉRIFICATION DES CONTRAINTES
-- =============================================

-- Vérification du nombre total de lignes
SELECT 
    (SELECT COUNT(*) FROM Dossier) as total_dossiers,
    (SELECT COUNT(*) FROM Acteur_externe) as total_acteurs_externes,
    (SELECT COUNT(*) FROM Acteur_interne) as total_acteurs_internes,
    (SELECT COUNT(*) FROM COLLABORER) as total_collaborations,
    (SELECT COUNT(*) FROM CONSULTER) as total_consultations,
    (SELECT COUNT(*) FROM SUPERVISER) as total_supervisions;

-- Vérification que tous les acteurs externes sont impliqués dans au moins un dossier
SELECT ae.ID_acteur_ext, ae.Nom_acteur_ext, COUNT(c.Num_dossier) as dossiers_impliqués
FROM Acteur_externe ae
LEFT JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
GROUP BY ae.ID_acteur_ext, ae.Nom_acteur_ext
HAVING COUNT(c.Num_dossier) = 0;