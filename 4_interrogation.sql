-- SCENARIO 1
-- 1. QUI CONSULTE AVANT LES REUNIONS ET AVANT AUTORISATION?
SELECT Utilisateur_editeur, COUNT(*) as accès_nuit
FROM Metadonnee_Acces 
WHERE HOUR(Date_d_acces) BETWEEN 7 AND 9
GROUP BY Utilisateur_editeur
ORDER BY accès_nuit DESC;

-- 2. QUELS DOSSIERS SONT CIBLÉS ?
SELECT d.Num_dossier, d.Type_infraction, COUNT(*) as consultations_nocturnes
FROM CONSULTER c
JOIN Dossier d ON c.Num_dossier = d.Num_dossier
JOIN Metadonnee_Acces m ON c.ID_Metadonnee = m.ID_Metadonnee
WHERE HOUR(m.Date_d_acces) BETWEEN 7 AND 9
GROUP BY d.Num_dossier, d.Type_infraction
ORDER BY consultations_nocturnes DESC;

-- 3. CET AGENT TRAVAILLE SUR QUOI ?
SELECT Unite from acteur_interne WHERE Nom_acteur_int='Dupont';

-- SCENARIO 2

-- 1. PREUVE DU RÉSEAU
SELECT Numero_bancaire, COUNT(DISTINCT Num_dossier) as affaires_liées
FROM Flux_financier 
GROUP BY Numero_bancaire 
HAVING COUNT(DISTINCT Num_dossier) > 1;

-- 2. QUELS CRIMES FINANCE-T-IL ?
SELECT f.Numero_bancaire, d.Num_dossier, d.Type_infraction, f.Montant_transaction
FROM Flux_financier f
JOIN Dossier d ON f.Num_dossier = d.Num_dossier
WHERE f.Numero_bancaire = 'FR76-3000-4000-5000';

-- 3. QUI UTILISE CE COMPTE ?
SELECT ae.Nom_acteur_ext, ae.Role, d.Num_dossier
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext  
JOIN Dossier d ON c.Num_dossier = d.Num_dossier
JOIN Flux_financier f ON d.Num_dossier = f.Num_dossier
WHERE f.Numero_bancaire = 'FR76-3000-4000-5000'
AND ae.Role = 'suspect';

-- SCENARIO 3

-- 1. Victimes apparassant dans plusieurs dossiers 
SELECT ae.Nom_acteur_ext, COUNT(DISTINCT d.Num_dossier) as nb_affaires
FROM Acteur_externe ae
INNER JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
INNER JOIN Dossier d ON c.Num_dossier = d.Num_dossier
WHERE ae.Role = 'victime'
GROUP BY ae.Nom_acteur_ext
HAVING COUNT(DISTINCT d.Num_dossier) > 1;

--  victimes avec des transactions à montants élevés voir suspectes
SELECT ae.Nom_acteur_ext, f.Montant_transaction
FROM Acteur_externe ae
INNER JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
INNER JOIN Flux_financier f ON c.Num_dossier = f.Num_dossier
WHERE ae.Role = 'victime'
AND f.Montant_transaction > ANY (
    SELECT AVG(Montant_transaction)
    FROM Flux_financier
);

-- Vérifions si ces victimes ont des témoignages succincts ou brefs
SELECT ae.Nom_acteur_ext, ae.Temoignage
FROM Acteur_externe ae
WHERE ae.Role = 'victime'
AND NOT EXISTS (
    SELECT 1
    FROM COLLABORER c
    INNER JOIN Dossier d ON c.Num_dossier = d.Num_dossier
    WHERE c.ID_acteur_ext = ae.ID_acteur_ext
    AND LENGTH(ae.Temoignage) > 100
);

-- SCENARIO 4

-- Qui travaille avec qui sur les mêmes dossiers ?
SELECT DISTINCT ae1.Nom_acteur_ext as Personne1, ae1.Role as Role1,
                ae2.Nom_acteur_ext as Personne2, ae2.Role as Role2,
                d.Num_dossier, d.Type_infraction
FROM Acteur_externe ae1
INNER JOIN COLLABORER c1 ON ae1.ID_acteur_ext = c1.ID_acteur_ext
INNER JOIN COLLABORER c2 ON c1.Num_dossier = c2.Num_dossier
INNER JOIN Acteur_externe ae2 ON c2.ID_acteur_ext = ae2.ID_acteur_ext
INNER JOIN Dossier d ON c1.Num_dossier = d.Num_dossier
WHERE ae1.ID_acteur_ext != ae2.ID_acteur_ext
AND ae1.Role IN ('suspect', 'informateur')
AND ae2.Role IN ('suspect', 'informateur')
ORDER BY d.Num_dossier;

-- Quels suspects ont des liens avec des informateurs ?
SELECT ae.Nom_acteur_ext, ae.Role, ae.Adresse_IP
FROM Acteur_externe ae
WHERE ae.Role = 'suspect'
AND EXISTS (
    SELECT 1
    FROM COLLABORER c1
    JOIN COLLABORER c2 ON c1.Num_dossier = c2.Num_dossier
    JOIN Acteur_externe ae2 ON c2.ID_acteur_ext = ae2.ID_acteur_ext
    WHERE c1.ID_acteur_ext = ae.ID_acteur_ext
    AND ae2.Role = 'informateur'
)
ORDER BY ae.Nom_acteur_ext;

-- Trouvons les transactions supérieures à la moyenne
SELECT DISTINCT ae.Nom_acteur_ext, ae.Role,
                f.Montant_transaction, f.Montant_crypto
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Flux_financier f ON c.Num_dossier = f.Num_dossier
WHERE f.Montant_transaction > ANY (
    SELECT AVG(Montant_transaction) * 1.5
    FROM Flux_financier
    WHERE Montant_transaction > 0
)
AND ae.Role IN ('suspect', 'informateur')
ORDER BY f.Montant_transaction DESC;

-- Trouvons les comptes généralement associés à des crimes. 
SELECT f.Numero_bancaire,
       COUNT(DISTINCT d.Num_dossier) as nb_dossiers,
       GROUP_CONCAT(DISTINCT d.Type_infraction) as crimes_financés,
       SUM(f.Montant_transaction) as volume_total
FROM Flux_financier f
JOIN Dossier d ON f.Num_dossier = d.Num_dossier
WHERE f.Numero_bancaire IN (
    SELECT Numero_bancaire
    FROM Flux_financier
    GROUP BY Numero_bancaire
    HAVING COUNT(DISTINCT Num_dossier) > 1
)
GROUP BY f.Numero_bancaire
HAVING COUNT(DISTINCT d.Type_infraction) > 1;

-- -- Où opèrent-ils ? 
SELECT DISTINCT o.Lieu_arrestation, 
       l.Coordonnees_GPS,
       COUNT(DISTINCT d.Num_dossier) as nb_operations,
       GROUP_CONCAT(DISTINCT d.Type_infraction) as types_crimes,
       GROUP_CONCAT(DISTINCT ae.Nom_acteur_ext) as suspects_impliques
FROM Operation o
LEFT JOIN Localisation l ON o.ID_Operation = l.ID_Operation
LEFT JOIN Dossier d ON o.Num_dossier = d.Num_dossier
LEFT JOIN COLLABORER c ON d.Num_dossier = c.Num_dossier
LEFT JOIN Acteur_externe ae ON c.ID_acteur_ext = ae.ID_acteur_ext AND ae.Role = 'suspect'
GROUP BY o.Lieu_arrestation, l.Coordonnees_GPS
ORDER BY nb_operations DESC;

-- Qui a été le plus actif récemment ?
SELECT ae.Nom_acteur_ext, ae.Role,
       o.Date_perquisition, d.Type_infraction,
       (SELECT COUNT(*) 
        FROM COLLABORER c2 
        WHERE c2.ID_acteur_ext = ae.ID_acteur_ext) as total_implications
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Dossier d ON c.Num_dossier = d.Num_dossier
JOIN Operation o ON d.Num_dossier = o.Num_dossier
WHERE o.Date_perquisition = (
    SELECT MAX(o2.Date_perquisition)
    FROM Operation o2
    JOIN Dossier d2 ON o2.Num_dossier = d2.Num_dossier
    JOIN COLLABORER c2 ON d2.Num_dossier = c2.Num_dossier
    WHERE c2.ID_acteur_ext = ae.ID_acteur_ext
)
AND ae.Role IN ('suspect', 'informateur')
ORDER BY o.Date_perquisition DESC, total_implications DESC;

-- Qui est le chef de Spectre ?
SELECT ae.Nom_acteur_ext, ae.Role, COUNT(DISTINCT c.Num_dossier) as nb_dossiers
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
WHERE ae.Role IN ('suspect', 'informateur')
GROUP BY ae.Nom_acteur_ext, ae.Role
HAVING COUNT(DISTINCT c.Num_dossier) >= 3;

-- a t-il des collaborateurs ?
SELECT ae.Nom_acteur_ext, ae.Role, 
       COUNT(DISTINCT c.Num_dossier) as nb_dossiers,
       COUNT(DISTINCT c.ID_institution) as nb_institutions
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
WHERE ae.Role IN ('suspect', 'informateur')
GROUP BY ae.Nom_acteur_ext, ae.Role
HAVING COUNT(DISTINCT c.Num_dossier) = 2
AND COUNT(DISTINCT c.ID_institution) >= 2;

-- SCENARIO 5

-- Toutes les preuves du dossier meurtre
SELECT p.ID_preuve, p.Type_malware, p.Type_bien_saisi, p.Log_activite_cyber
FROM Preuve p
WHERE p.Num_dossier = 5;

-- Quel est le dernier témoigange de la victime ?
SELECT ae.Temoignage, ae.Date_naissance, ae.Adresse_IP, ae.Adresse_mail
FROM Acteur_externe ae
WHERE ae.Nom_acteur_ext = 'Léa Dubois' AND ae.Role = 'victime';

-- Qui a bénéficié de sa rançon ?
SELECT f.Numero_bancaire, f.Montant_transaction, f.Montant_crypto,
       (SELECT COUNT(*) 
        FROM Flux_financier f2 
        WHERE f2.Numero_bancaire = f.Numero_bancaire) as usage_du_compte
FROM Flux_financier f
WHERE f.Num_dossier = 5;

-- Vérifier CHACUN des 3 comptes dans d'autres crimes
SELECT f.Numero_bancaire, 
       COUNT(DISTINCT f.Num_dossier) as nb_dossiers_lies,
       GROUP_CONCAT(DISTINCT d.Type_infraction) as types_crimes,
       GROUP_CONCAT(DISTINCT ae.Nom_acteur_ext) as suspects_associes
FROM Flux_financier f
JOIN Dossier d ON f.Num_dossier = d.Num_dossier
JOIN COLLABORER c ON d.Num_dossier = c.Num_dossier
JOIN Acteur_externe ae ON c.ID_acteur_ext = ae.ID_acteur_ext
WHERE f.Numero_bancaire IN (
    SELECT Numero_bancaire 
    FROM Flux_financier 
    WHERE Num_dossier = 5
)
AND d.Num_dossier != 5
AND ae.Role = 'suspect'
GROUP BY f.Numero_bancaire
ORDER BY nb_dossiers_lies DESC;

-- Qui connaissait Léa mais n'apparaît pas dans son dossier ?
SELECT DISTINCT ae.Nom_acteur_ext, ae.Role, d2.Type_infraction
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Dossier d2 ON c.Num_dossier = d2.Num_dossier
WHERE ae.ID_acteur_ext NOT IN (
    SELECT c2.ID_acteur_ext
    FROM COLLABORER c2
    WHERE c2.Num_dossier = 5
)
AND EXISTS (
    SELECT 1
    FROM COLLABORER c3
    JOIN Acteur_externe ae3 ON c3.ID_acteur_ext = ae3.ID_acteur_ext
    WHERE c3.Num_dossier = d2.Num_dossier
    AND ae3.Nom_acteur_ext = 'Léa Dubois'
)
AND ae.Role = 'suspect';

-- Y a-t-il un pattern dans les autres meurtres ?
SELECT ae.Nom_acteur_ext, ae.Role, ae.Temoignage,
       (SELECT COUNT(*) 
        FROM COLLABORER c2 
        WHERE c2.ID_acteur_ext = ae.ID_acteur_ext 
        AND c2.Num_dossier IN (
            SELECT Num_dossier 
            FROM Dossier 
            WHERE Type_infraction = 'meurtre lié à rançon'
        )) as implication_meurtres
FROM Acteur_externe ae
WHERE ae.Role = 'suspect'
AND ae.ID_acteur_ext = ANY (
    SELECT c.ID_acteur_ext
    FROM COLLABORER c
    JOIN Dossier d ON c.Num_dossier = d.Num_dossier
    WHERE d.Type_infraction = 'meurtre lié à rançon'
)
ORDER BY implication_meurtres DESC;

-- Qui avait accès aux informations de Léa ?
SELECT DISTINCT ae.Nom_acteur_ext, ae.Role, 
       p.Type_malware, p.Log_activite_cyber,
       (SELECT COUNT(*) 
        FROM COLLABORER c2 
        WHERE c2.ID_acteur_ext = ae.ID_acteur_ext 
        AND c2.Num_dossier IN (1, 4, 7, 10)) as liens_autres_victimes
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Preuve p ON c.Num_dossier = p.Num_dossier
WHERE p.Num_dossier = 5
AND ae.Role = 'suspect'
AND p.Type_malware IS NOT NULL;

-- Où étaient les suspects au moment du meurtre ?
SELECT ae.Nom_acteur_ext, o.Lieu_arrestation, o.Date_perquisition,
       l.Date_evenement, l.Heure_evenement
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Dossier d ON c.Num_dossier = d.Num_dossier
JOIN Operation o ON d.Num_dossier = o.Num_dossier
JOIN Localisation l ON o.ID_Operation = l.ID_Operation
WHERE ae.Role = 'suspect'
AND l.Date_evenement BETWEEN '2025-01-28' AND '2025-02-05'
ORDER BY l.Date_evenement, l.Heure_evenement;

-- Qui avait les compétences pour le malware trouvé dans le dossier 5 ?
SELECT DISTINCT ae.Nom_acteur_ext, p.Type_malware
FROM Acteur_externe ae
JOIN COLLABORER c ON ae.ID_acteur_ext = c.ID_acteur_ext
JOIN Preuve p ON c.Num_dossier = p.Num_dossier
WHERE ae.Nom_acteur_ext IN ('Carlos Mendez', 'Marco Bellini')
AND p.Type_malware = (
    SELECT Type_malware 
    FROM Preuve 
    WHERE Num_dossier = 5 
    AND Type_malware IS NOT NULL 
    LIMIT 1
);

-- L'assassin est ....
SELECT 
    ae.Nom_acteur_ext as ASSASSIN,
    CASE 
        WHEN ae.Nom_acteur_ext = 'Carlos Mendez' THEN
            'MOBILE: ' || ae.Temoignage || ' - Il gérait les communications et Léa le menaçait de le dénoncer'
        WHEN ae.Nom_acteur_ext = 'Marco Bellini' THEN
            'MOBILE: ' || ae.Temoignage || ' - Il négociait les rançons et Léa refusait de payer'
    END as MOTIF,
    (SELECT COUNT(*) FROM COLLABORER c WHERE c.ID_acteur_ext = ae.ID_acteur_ext) as ANCIENNETÉ,
    (SELECT GROUP_CONCAT(DISTINCT p.Type_malware) 
     FROM COLLABORER c 
     JOIN Preuve p ON c.Num_dossier = p.Num_dossier 
     WHERE c.ID_acteur_ext = ae.ID_acteur_ext) as ARME_DIGITALE
FROM Acteur_externe ae
WHERE ae.Nom_acteur_ext IN ('Carlos Mendez', 'Marco Bellini')
ORDER BY ANCIENNETÉ DESC
LIMIT 1;
