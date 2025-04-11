# Analyse des données de combats UFC

![image](https://github.com/user-attachments/assets/a392c1d8-ad64-4b2e-b25f-da361023c37a)

## Sommaire

1. [Objectif du projet](#objectif-du-projet)
2. [Membres de l'équipe](#membres-de-léquipe)
3. [Contexte du jeu de données](#contexte-du-jeu-de-données)
4. [Données](#données)
    - [Jeu de données 1: Complete UFC Data](#jeu-de-données-1)
    - [Jeu de données 2: Pro MMA Fighters](#jeu-de-données-2)

## Objectif du projet

Explorer les facteurs qui influencent les résultats des combats et comprendre l'impact des différents facteurs tels que les attributs physiques, les styles de combat et la psychologie des combattants.

## Membres de l'équipe

- Samy EHSANI
- Romain GOLDENCHTEIN
- Jasser CHATBA
- Mohamed AAZOUZ

## Contexte du jeu de données

Pour ce projet, nous avons utilisé deux jeux de données complémentaires qui offrent une vue d'ensemble riche et détaillée sur les combats de MMA dans l'UFC.

1. **Complete UFC Data** : Ce dataset fournit des informations détaillées sur les événements, les combattants, les statistiques de combat et les cotes des paris. Il permet d'analyser les performances des combattants, d'évaluer les probabilités de victoire et de découvrir des tendances en MMA. Il est assez volumineux et constitue une base solide pour explorer les facteurs influençant les résultats des combats. Les données s'étendent de 1994 à 2023.

2. **Pro MMA Fighters** : Ce dataset se concentre sur les combattants eux-mêmes, en détaillant leurs caractéristiques personnelles, physiques et leur bilan de carrière. Il permet de mieux comprendre les profils des athlètes, leurs forces et faiblesses, ainsi que leur évolution au fil du temps. Les données sont malheureusement à jour que jusqu'en 2022, ce qui rend l'exploitation des bilans de carrière difficile.

Nous avons choisi ces datasets pour explorer les facteurs qui influencent les résultats des combats et comprendre l'impact des différents paramètres tels que les attributs physiques, les styles de combat et les cotes des paris.

## Données

### Jeu de données 1

**Source :**  [Dataset 1](https://github.com/jansen88/ufc-data/)

**Format :** CSV

**Mise à jour :** Ce dataset est à jour jusqu'au **16/09/2023**.

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

**Catégories détaillées :**

1. **Informations sur l'événement**
    - **event_date**: Date à laquelle le combat a eu lieu (ex: 2023-05-15)
    - **event_name**: Nom complet de l'événement (ex: "UFC 280: Oliveira vs. Makhachev")

2. **Informations sur le combat**
    - **weight_class**: Catégorie de poids du combat (ex: "Lightweight", "Heavyweight", "Women's Strawweight")
    - **outcome**: Résultat final (ex: "fighter1_win", "fighter2_win", "draw", "no_contest")
    - **method**: Méthode par laquelle le combat s'est terminé (ex: "KO/TKO", "Submission", "Decision - Unanimous")
    - **round**: Round durant lequel le combat s'est terminé (ex: 1, 2, 3, 4, 5)
    - **favourite/underdog**: Identifie quel combattant était favori/outsider
    - **favourite_odds/underdog_odds**: Cotes de paris pour chaque combattant (ex: -250, +180)
    - **betting_outcome**: Si le favori ou l'outsider a gagné

3. **Information sur les combattants**
    - **Données biométriques**:
      - **fighter1/2_height**: Taille en cm
      - **fighter1/2_curr_weight**: Poids en kg
      - **fighter1/2_reach**: Allonge des bras en cm
      - **fighter1/2_dob**: Date de naissance (ex: 1988-07-14)

    - **Style de combat**:
      - **fighter1/2_stance**: Position de garde (ex: "Orthodox", "Southpaw", "Switch")

    - **Statistiques offensives**:
      - **fighter1/2_sig_strikes_landed_pm**: Moyenne de frappes significatives par minute
      - **fighter1/2_sig_strikes_accuracy**: Pourcentage de précision des frappes
      - **fighter1/2_takedown_avg_per15m**: Nombre moyen de projections au sol par 15 minutes

    - **Statistiques défensives**:
      - **fighter1/2_sig_strikes_absorbed_pm**: Frappes reçues en moyenne par minute
      - **fighter1/2_sig_strikes_defended**: Pourcentage de frappes bloquées
      - **fighter1/2_takedown_defence**: Pourcentage de défense contre les tentatives de projection

### Jeu de données 2

**Source :** [Dataset 2](https://www.kaggle.com/datasets/binduvr/pro-mma-fighters)

**Format :** CSV

**Mise à jour :** Ce dataset est à jour jusqu'au **11/08/2021**.

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
| location                | Ville de résidence ou d'origine du combattant.        | String            |
| country                 | Pays d'origine.                                       | String            |
| height                  | Taille du combattant (en cm ou en pieds/pouces).      | Float             |
| weight                  | Poids du combattant (en livres ou kg).                | Float             |
| association             | Club ou équipe d'entraînement.                        | String            |
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

**Catégories détaillées :**

1. **Informations personnelles**
    - **fighter_name**: Nom complet du combattant (ex: "Conor McGregor", "Khabib Nurmagomedov")
    - **nickname**: Surnom utilisé dans l'octogone (ex: "The Notorious", "The Eagle")
    - **birth_date**: Date de naissance complète (ex: "1988-07-14")
    - **age**: Âge
    - **death_date**: Date de décès si applicable (ex: "2020-03-14")

2. **Origine et affiliation**
    - **location**: Ville d'origine ou de résidence
    - **country**: Pays d'origine
    - **association**: Équipe ou camp d'entraînement (ex: "SBG Ireland", "American Top Team")

3. **Caractéristiques physiques**
    - **height**: Taille en pieds/pouces (ex: 5'9")
    - **weight**: Poids livres (ex: 155 lbs)
    - **weight_class**: Catégorie de poids officielle (ex: "Lightweight", "Heavyweight")

4. **Bilan de carrière**
    - **Victoires**:
      - **wins**: Nombre total de victoires
      - **wins_ko**: Victoires par KO/TKO
      - **wins_submission**: Victoires par soumission
      - **wins_decision**: Victoires par décision des juges
      - **wins_other**: Autres types de victoires (ex: disqualification)

    - **Défaites**:
      - **lossess**: Nombre total de défaites
      - **losses_ko**: Défaites par KO/TKO
      - **losses_submission**: Défaites par soumission
      - **losses_decision**: Défaites par décision
      - **losses_other**: Autres types de défaites (ex: disqualification)
