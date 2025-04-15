# Analyse des données de combats UFC

![image](https://github.com/user-attachments/assets/a392c1d8-ad64-4b2e-b25f-da361023c37a)

## Sommaire

1. [Objectif du projet](#objectif-du-projet)
2. [Membres de l'équipe](#membres-de-léquipe)
3. [Contexte du jeu de données](#contexte-du-jeu-de-données)
4. [Données](#données)
    - [Jeu de données 1: Complete UFC Data](#jeu-de-données-1)
    - [Jeu de données 2: Pro MMA Fighters](#jeu-de-données-2)
5. [Plan d'analyse](#plan-danalyse)

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

## Plan d'analyse

Notre objectif est d'explorer les facteurs qui influencent les résultats des combats et comprendre plus globalement l'impact de différents paramètres tels que les attributs physiques, les styles de combat ou la psychologie des combattants.

### Analyse stratégique et technique des combats
1. **Durant quel round la majorité des combats se terminent ?**
   
   L’objectif est d’obtenir des informations permettant d’identifier une tendance générale, d’analyser et comprendre la distribution des fins de combats par round.

   **- Interrogations :** 
   Durant quel round la majorité des combats se termine-t-elle ?<br>
   Y a-t-il un round spécifique où les combats ont tendance à s’arrêter plus souvent ?<br>
   Est-ce que certains rounds sont rarement atteints, ce qui pourrait indiquer des KO précoces ou une domination rapide (ex : victoire par soumission) ?<br>

   **- Variables à comparer :**
   
   round (valeurs de 1 à 5)

   **- Visualisation :**
   
   Pour répondre à cette question, le graphique le plus adapté est l’histogramme, car on désire compter le nombre de combats terminés par round et comparer la fréquence de chaque round. De plus, les rounds étant des 
   variables discrètes, ils se prêtent particulièrement bien à une visualisation par histogramme.

   **- Limites/problèmes :**
   
   Il y a deux types de combats : les combats en 3 rounds (une grande partie des combats) et les combats en 5 rounds (souvent l'événement principal et le combat de la ceinture). Il faudrait peut-être normaliser ou filtrer 
   cela.

2. **À quel point l’allonge peut être un avantage significatif pour gagner un combat ?**

   On cherche ici à savoir si l’allonge à un impact sur le déroulé du combat. Les combats sont organisés en catégories de poids, et non pas en catégories d’allonge : chaque combattant peut donc avoir une allonge différente.

   **- Interrogations :**
   
   Un combattant devrait-il accepter un combat face à un adversaire disposant d’une plus grande allonge ?<br>
   Avoir une grande allonge pousse-t-elle le combattant à utiliser son striking, ou tenter des takedowns ?

   **- Variables à comparer :**
   
   Allonge : fighter1_reach / fighter2_reach<br>
   Coups portés : fighter1_sig_strikes_landed_pm fighter2_sig_strikes_landed_pm<br>
   Takedowns : fighter1_takedown_avg_per15m / fighter2_takedown_avg_per15m<br>
   Resultat du combat : outcome 

   **- Visualisation :**
   
   Un boxplot pour voir le résultat du combat en fonction de l’allonge du combattant
   Un scatterplot pour voir si une meilleure allonge engendre plus de striking
   Un autre scatterplot pour voir si elle engendre plus de takedowns
   Un barplot pour vérifier les taux de victoire en fonction de la différence d’allonge des combattants (par exemple quand un combattant à -10 en allonge par rapport à son adversaire, -5…)

   **- Limites/problèmes :**
   
Les visualisations proposées permettent d’observer des tendances générales, mais elles ne prennent pas en compte d’autres variables réels comme le style de combat, l’expérience ou la stratégie adoptée. De plus, une corrélation visuelle ne signifie pas forcément qu’il y a un lien de cause à effet entre l’allonge et l’issue du combat.

3. **Quel type de garde est la plus dominante (southpaw, orthodox...) ?**

   On cherche à savoir si une des 5 gardes utilisées en MMA est plus efficace que les autres.
   Voici la description des 5 gardes présentes dans ce dataset :
   - Orthodox : Pied gauche devant, pied droit derrière (position pour droitier)
     C’est la garde la plus courante, considérée comme "classique"
   - Southpaw : Pied droit devant, pied gauche derrière (position pour gaucher)
     Moins courante, avantage stratégique contre les orthodoxes car elle peut créer des angles d’attaques inattendues
   - Switch : Capacité à changer de stance en combat (Orthodox / Southpaw)
     Grande flexibilité, adaptation aux styles adverses
   - OpenStance : Terme utilisé parfois pour désigner un affrontement orthodoxe vs southpaw.
     Accent mis sur l’angle d’attaque plus que la position proprement dite.
   - Sideways : Garde très latérale, inspirée du karaté ou taekwondo
     Excellente mobilité latérale et jeu de jambes

   **- Interrogations :**
   
   Quelle garde est la plus utilisée à l’UFC ?<br>
   Quelle garde a le meilleur taux de victoire ?

   **- Variables à comparer :**
   
   La garde utilisée lors d'un combat : fighter1_stance<br> fighter2_stance<br>
   Resultat du combat : outcome

   **- Visualisation :**
   
   Un multi-set bar chart avec pour chaque garde une barre représentant le nombre de combats durant lesquels la garde a été utilisée et une autre barre représentant le nombre de victoires.

   **- Limites/problèmes :**
   
   La cohérence de cette visualisation peut être faussée par les combattants de grappling (sol) qui utilisent une garde pour commencer un combat mais qui l’abandonnent très vite pour amener leur adversaire au sol. 

### Statistiques, prédictions et côtes

4. **Les notions de favori et d’underdog sont-elles respectées réellement ? Les bookmakers ont-ils raison ?**

   L'objectif est d'analyser la répartition des côtes et identifier la fréquence à laquelle le "favori" remporte effectivement le combat. Pareil pour les “underdog”

   **- Interrogations :**
   
    Qu’est-ce qui définit un favori ou un underdog dans les prédictions des bookmakers ? Nous voulons comparer ces classifications avec les résultats réels des combats.<br>
   Les cotes affichées avant un combat correspondent-elles globalement aux issues réelles des rencontres ?<br>
   Existe-t-il des cas significatifs où l’issue d’un combat contredit systématiquement le classement favori/underdog (par exemple, des surprises répétées) ?

   **- Variables à comparer :**
   
   favourite / underdog<br> favourite_odds<br> underdog_odds<br> betting_outcome<br> round
   Comparer la prédiction avec le résultat réel (taux de prédiction correct, erreur moyenne des cotes, etc.).

   **- Visualisation :**
   
   Un graphique en barres qui montre pour chaque catégorie (favori/underdog), le nombre de combats gagnés et perdus peut être affiché côte à côte ou en empilé. Cela permet directement de visualiser la proportion des cotes réellement respectées.
   Un scatterplot avec ligne de tendance qui montre avec les points les cotes en fonction de la victoire en nombre de rounds (nombres négatifs si défaite ?). Cela permettrait aussi de voir s'il y a une relation entre les côtes et le nombre de rounds pour obtenir la victoire.

   **- Limites/problèmes :**
   
   S’il y a des circonstances particulières d’un combat non reflétées dans la cote initiale qui font que la victoire est bien plus probable (ou moins probable).

### Facteur géographique

5. **Les combattants issus de différentes régions ou cultures adoptent-ils des styles de combat distincts ?**

   On veut identifier si le pays d'origine, la ville, ou l’association/camp d’entraînement influencent le style de combat d’un combattant ? Autrement dit : est-ce que certains pays/camps forment des combattants plus portés sur le striking, d'autres sur le grappling, d'autres plus défensifs ou agressifs ?

   **- Interrogations :**
   
    Y a-t-il des pays qui produisent des profils très offensifs (volume élevé, faible défense) ?<br>
   Certains camps forment-ils des grapplers plus que des strikers ?<br>
   Les combattants issus d’Amérique du Sud encaissent-ils plus de coups ?<br>
   Les combattants européens ont-ils une meilleure défense de takedown que les Asiatiques ?<br>
   Les combattants d’une même région (ex: Dagestan) partagent-ils un même profil statistique ?<br>

   **- Variables à comparer :**
   
   Style offensif : sig_strikes_landed_pm / sig_strikes_accuracy / takedown_avg_per15m<br>
   Style défensif : sig_strikes_absorbed_pm / sig_sirikes_defended / takedown_defence<br>
   Informations géographiques : country / association

   **- Visualisation :**
   
   Boxplots par pays (ou par camp) pour chaque variable, pour donner une idée du style offensif moyen par région.
   Radar charts pour comparer les profils moyens de certains pays, en faisant la moyenne des 6 variables clés listées plus haut par pays. Ça permettrait de comparer visuellement les profils types de combattants brésiliens vs russes vs américains...
   Heatmaps pour apercevoir des corrélations entre le pays/camps et les 6 variables

   **- Limites/problèmes :**
   
   Les visualisations peuvent masquer la diversité individuelle des combattants d’un même pays ou camp. Certaines régions peuvent aussi être sous-représentées dans les données, rendant les moyennes peu fiables ou biaisées. Enfin, le style peut dépendre de l’adversaire ou du contexte du combat, ce que les visus ne capturent pas.

### Evolutions et carrières des combattants

6. **Quels facteurs peuvent influencer considérablement la durée de carrière d’un combattant ?**

   On cherche à comprendre comment l’âge, le nombre de coups encaissés, la fréquence des combats ou la catégorie de poids impactent la durée de carrière.

   **- Interrogations :**
   Y a-t-il un lien entre le nombre de combats et la durée de carrière ? Et si un combattant fait énormément de combat sur une courte durée, sa carrière finit-elle plus vite ?<br>
   Y a-t-il un lien entre les catégories de poids ou la taille et la durée de carrière moyenne des combattants ?<br>
   Un combattant ayant reçu beaucoup de coups fait-il une carrière plus courte ?<br>
   Un combattant ayant reçu beaucoup de KO fait-il une carrière plus courte ?<br>
   Un combattant ayant eu beaucoup de défaites fait-il une carrière plus courte ? Et au contraire, faire beaucoup de victoires signifie-t-il toujours faire une carrière plus longue ?

   **- Variables à comparer :**
   
   fighter1/2_dob, event_date (pour déduire l’âge exact et les périodes d’inactivités)<br> fighter1/2_height<br> weight_class<br> method<br> outcome<br> fighter1/2_sig_strikes_landed_pm<br> fighter1/2_sig_strikes_absorbed_pm<br>
   Regrouper les combattants par tranche d’âge, ou par niveau d’exposition aux coups encaissés pour observer s’il existe des patterns récurrents peut être une bonne idée.

   **- Visualisation :**
   
   Un heatmap pour montrer la corrélation directe entre chaque facteur. Par exemple, s’il existe un lien direct entre l’âge ou la taille et le nombre de coups reçus. À partir de là, on peut évoluer sur d’autres visualisations où il y a des corrélations.
   Pourquoi pas séparer en 3 catégories de longévité de carrière et regarder pour chaque le nombre de coups et KO reçus durant les premières années.
   Scatterplot (avec courbe de tendance) pour montrer comment évolue le nombre de combats en fonction de l’âge des combattants avec une longue carrière.

   **- Limites/problèmes :**
   
   Certains facteurs peuvent être corrélés entre eux (par exemple, âge et expérience) rendant plus difficile l’isolation des effets individuels. Aussi, l’analyse de ces effets peut nécessiter des approches complexes,
   surtout lorsque plusieurs variables interagissent simultanément. En effet, la question est multifactorielle. Chaque combattant pouvant évoluer différemment et accéder à sa carrière à tout moment, il est difficile de
   dire qu’un critère est absolument plus important qu’un autre ; mais des tendances peuvent se dessiner.
   Dû à cette multitude de facteurs, il est probable que les visualisations ne représenteront qu’une partie des corrélations avec la longévité de la carrière.

7. **Quel combattant a montré la progression la plus spectaculaire dans ses performances ?**

   Le but principal de cette question est d’identifier un ou plusieurs combattants ayant montré une courbe de progression dite “positive”. Cela va donc nous permettre d’identifier le meilleur palmarès, le meilleur rapport victoire/défaite/nul (plus de victoires) et l’amélioration des statistiques au fil du temps (précision, takedowns, défense,etc.).
   De plus, on pourra déterminer et établir des tendances à partir des performances lors des combats afin d’identifier le pic de carrière.

   **- Interrogations :**
   
   Quel combattant a le plus progressé au cours de sa carrière ?<br>
   Comment mesurer objectivement cette progression ?<br>
   Peut-on observer une évolution significative dans ses performances statistiques (frappes, takedowns, victoires...) ?<br>
   Y a-t-il des combattants qui étaient médiocres au départ mais sont devenus très performants ?

   **- Variables à comparer :**

   Variables temporelles/évolutives :
   event_date : permet de suivre la chronologie des combats<br>
   fighter_name ou fighter1 / fighter2 : pour filtrer par combattant.

   Variables de performance :
   outcome : a-t-il gagné ou perdu ?<br>
   method : le type de victoire (plus de KO ? plus de combats à la décision ?)<br>
   fighter1/2_sig_strikes_landed_pm : connaître le volume d’attaque debout<br>
   fighter1/2_sig_strikes_accuracy : obtenir la précision des coups<br>
   fighter1/2_sig_strikes_absorbed_pm : savoir si le combattant prend beaucoup de coups (facteur qui peut influer la longévité de carrière)<br>
   fighter1/2_sig_strikes_defended : défense des coups<br>
   fighter1/2_takedown_avg_per15m : le maintien au sol (domination ?)<br>
   fighter1/2_takedown_accuracy : précision des attaques au sol (bonnes performances ?)<br>
   fighter1/2_takedown_defence : savoir si le combattant peut contrer les attaques de son adversaire<br>
   fighter1/2_submission_avg_attempted_per15m : connaître le volume d’attaque au sol

   **- Visualisation :**
   
   Pour répondre à cette question graphiquement, le plus judicieux est d’établir plusieurs graphiques :
   un bar chart pour montrer les meilleurs combattants et mettre en évidence celui qui a la meilleure progression globale
   un line chart pour visualiser l’évolution des performances du combattant ayant la meilleure progression

   **- Limites/problèmes :**
   
   Il faut plusieurs combats pour évaluer une progression et cela souligne la possibilité de devoir ignorer les combattants avec peu de combats.
   Il est compliqué d’établir un seul combattant sur l’ensemble des catégories car il y a des catégories où il y a plus de concurrence et d’autres moins. En effet, atteindre le haut rang voire la ceinture d’une catégorie avec beaucoup de concurrences est donc plus difficile. Un combattant d’une catégorie plus accessible peut avoir une meilleure carrière mais n’est pas foncièrement un meilleur combattant. 


### Tactiques de combat

8. **En quoi le style de combat, qu'il soit offensif ou défensif, influence-t-il le déroulement et l'issue d’un combat ?**

   L’objectif est de comprendre à quel point le style de combat peut être facteur de réussite.

   **- Interrogations :**
   
   Un volume d’attaque élevé donne-t-il des garanties de résultat ?<br>
   Suffit-il d'être le meilleur défenseur pour remporter un combat ?<br>
   Quels types d’attaques doivent être effectués en priorité pour avoir le plus de chance de gagner le combat ?

   **- Variables à comparer :**
   
   fighter1/2_sig_strikes_landed_pm<br> fighter1/2_sig_strikes_accuracy<br> fighter1/2_sig_strikes_absorbed_pm<br> fighter1/2_sig_strikes_defended<br> fighter1/2_takedown_avg_per15m<br>        fighter1/2_takedown_accuracy<br> fighter1/2_takedown_defence<br> fighter1/2_submission_avg_attempted_per15m<br> outcome
   
   **- Visualisation :**

   Un stacked bar chart permettant de visualiser l’efficacité des attaques pour chaque combattant (dont les champion qui serviront de base de comparaison)
   Pour éviter la surcharge d’informations on peut réaliser un stacked bar chart pour les attaques debout et un autre pour les attaques au sol
   Pour visualiser le volume d’attaques envoyées, on pourrait utiliser un scatterplot avec en abscisse le taux de victoires des combattants et en ordonnée le nombre de coups envoyés.

   **- Limites/problèmes :**

   Le principal problème de ces visualisations est qu’elles peuvent être faussées par les combats qui se sont terminés prématurément et les combattants n’ayant pas effectué beaucoup de combats.

   
