![image](https://github.com/user-attachments/assets/4de07d0c-c5ff-4ffc-b4c4-9ff7a8bd85c3)


**Membres :**
- Samy EHSANI
- Romain GOLDENCHTEIN
- Jasser CHATBA
- Mohamed Aazouz

**Analyse des données de combats UFC**

**Contexte du jeu de données**
Nous avons choisi le dataset "Complete UFC Data" car il offre une richesse d'informations concernant les combats d'arts martiaux mixtes (MMA) dans l'UFC. Les données sont variées et proviennent de multiples sources fiables.

Ce dataset contient des détails approfondis sur les événements, les combattants et les statistiques de combat, ainsi que des cotes de paris. Il permet d'analyser les performances des combattants, d'évaluer les probabilités de victoire et de découvrir les tendances dans les arts martiaux mixtes.

Nous avons choisi ce dataset pour explorer les facteurs qui influencent les résultats des combats et comprendre l'impact des différents paramètres tels que les attributs physiques, les styles de combat et les cotes de paris.

**Données**

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


