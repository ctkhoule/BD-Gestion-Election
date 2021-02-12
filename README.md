# BD-Gestion-Election
Mise en place d'une base de données de gestion des élections 

## Soit la base de données __Gestion_Election__ dont le schéma relationnel est donné ci-dessous :


Election (__Type__, __Annee__, Jour, Numero, Mois)

Electeur (__Numero__, Nom, Prenom, Age, Sexe, Adresse, #Bureau, #Centre)

Centre (__Nom__, Adresse, Type)

Utiliser (#__TypeElection__, #__AnneeElection__, #__Centre__)

Bureau (__Numero__, #__Centre__, Nb_Inscrit, Type, #President)

Représentant (#__Electeur__, #__Bureau__, #__Centre__, #__TypeElection__, #__AnneeElection__)

Gagner (#__TypeElection__, #__AnneeElection__, #__Electeur__)


---

NB :

Les attributs en gras représentent les clés primaires et les attributs précédés d'un hastag (#) représentent les clés étrangères.
