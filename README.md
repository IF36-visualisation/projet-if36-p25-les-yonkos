![image](https://github.com/user-attachments/assets/a392c1d8-ad64-4b2e-b25f-da361023c37a)


**Membres :**
- Samy EHSANI
- Romain GOLDENCHTEIN
- Jasser CHATBA
- Mohamed AAZOUZ

**Analyse des données de combats UFC**

**Contexte du jeu de données**
Nous avons choisi le dataset "Complete UFC Data" car il offre une richesse d'informations concernant les combats d'arts martiaux mixtes (MMA) dans l'UFC. Les données sont variées et proviennent de multiples sources fiables.

Ce dataset contient des détails approfondis sur les événements, les combattants et les statistiques de combat, ainsi que des cotes de paris. Il permet d'analyser les performances des combattants, d'évaluer les probabilités de victoire et de découvrir les tendances dans les arts martiaux mixtes.

Nous avons choisi ce dataset pour explorer les facteurs qui influencent les résultats des combats et comprendre l'impact des différents paramètres tels que les attributs physiques, les styles de combat et les cotes de paris.

**Données**

**Jeu de données 1 :**

**Source :**  [Dataset 1](https://github.com/IF36-visualisation/projet-if36-p25-les-yonkos/blob/8ccc7471f0bf261cf8f63c86eb9681003086312d/data/complete_ufc_data.csv)

**Format :** CSV

**Structure du jeu de données :**
Ce dataset contient 7340 entrées et 42 colonnes.

**Colonnes de données :**

| Caractéristiques                           | Descriptions                                             | Type         |
|------------------------------------------------|----------------------------------------------------------|--------------|
| event_date                                     | Date de l'événement.                                   | Date (YYYY-MM-DD) |
| event_name                                     | Nom de l'événement.                                   | String       |
| weight_class                                   | Catégorie de poids.                                     | String       |
| fighter1 / fighter2                            | Nom des deux combattants.                               | String       |
| favourite / underdog                           | Favori et outsider selon les cotes de paris.            | String       |
| favourite_odds / underdog_odds                 | Cotes attribuées aux combattants.                        | Float        |
| betting_outcome                                | Résultat par rapport aux cotes.                         | String       |
| outcome                                        | Résultat du combat.                                     | String       |
| method                                         | Méthode de victoire (KO, soumission, décision).         | String       |
| round                                          | Round lors duquel le combat s'est terminé.               | Integer      |
| fighter1/2_height                              | Taille des combattants.                                 | Float        |
| fighter1/2_curr_weight                         | Poids actuel des combattants.                           | Float        |
| fighter1/2_dob                                 | Date de naissance des combattants.                      | Date (YYYY-MM-DD) |
| fighter1/2_reach                               | Portée des combattants.                                 | Float        |
| fighter1/2_stance                              | Position de combat (Orthodoxe, Southpaw).               | String       |
| fighter1/2_sig_strikes_landed_pm               | Frappes significatives par minute.                      | Float        |
| fighter1/2_sig_strikes_accuracy                | Précision des frappes significatives.                   | Float        |
| fighter1/2_sig_strikes_absorbed_pm             | Frappes significatives subies par minute.               | Float        |
| fighter1/2_sig_strikes_defended                | Pourcentage de frappes défendues.                       | Float        |
| fighter1/2_takedown_avg_per15m                 | Moyenne des mises au sol par 15 minutes.                | Float        |
| fighter1/2_takedown_accuracy                   | Précision des mises au sol.                             | Float        |
| fighter1/2_takedown_defence                    | Pourcentage de défense contre les mises au sol.         | Float        |
| fighter1/2_submission_avg_attempted_per15m     | Tentatives de soumission par 15 minutes.                | Float        |
| events_extract_ts / odds_extract_ts            | Horodatage de l'extraction des événements et des cotes. | Date-Time    |

**Catégories :**
Informations sur l’événement
Informations sur le combat 
Information sur les combattants


**Jeu de données 2 :**

**Source :** [Dataset 2](https://github.com/IF36-visualisation/projet-if36-p25-les-yonkos/blob/8ccc7471f0bf261cf8f63c86eb9681003086312d/data/pro_mma_fighters.csv)

**Format :** CSV

**Structure du jeu de données :**
Le jeu de données contient 5151 entrées (combattants) et 22 colonnes. 

**Colonnes de données :**

| Caractéristiques        | Descriptions                                           | Type              |
|-------------------------|--------------------------------------------------------|-------------------|
| url                     | URL du profil du combattant.                          | String            |
| fighter_name            | Nom complet du combattant.                            | String            |
| nickname                | Surnom du combattant.                                 | String            |
| birth_date              | Date de naissance du combattant.                      | Date (YYYY-MM-DD) |
| age                     | Âge actuel du combattant.                             | Integer           |
| death_date              | Date de décès (si applicable).                        | Date (YYYY-MM-DD) |
| location                | Ville de résidence ou d’origine du combattant.        | String            |
| country                 | Pays d’origine.                                       | String            |
| height                  | Taille du combattant (en cm ou en pieds/pouces).      | Float             |
| weight                  | Poids du combattant (en livres ou kg).                | Float             |
| association             | Club ou équipe d’entraînement.                        | String            |
| weight_class            | Catégorie de poids.                                   | String            |
| wins                    | Nombre total de victoires.                            | Integer           |
| wins_ko                 | Nombre de victoires par KO.                           | Integer           |
| wins_submission         | Nombre de victoires par soumission.                   | Integer           |
| wins_decision           | Nombre de victoires par décision.                     | Integer           |
| wins_other              | Autres types de victoires.                            | Integer           |
| lossess                 | Nombre total de défaites *(probablement une faute de frappe)*. | Integer   |
| losses_ko              | Défaites par KO.                                       | Integer           |
| losses_submission       | Défaites par soumission.                              | Integer           |
| losses_decision         | Défaites par décision.                                | Integer           |
| losses_other            | Autres types de défaites.                             | Integer           |

**Catégories :**
Information sur les combattants


