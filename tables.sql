/*Création des tables de la base de données Gestion_Election*/

/*Table Election*/
Create table Election(
    Type varchar(20),
    Annee integer,
    Jour varchar(8),
    Numero integer,
    Mois varchar(9),
    constraint pk_election primary key (Type, Annee),
    constraint ck_annee_electeur check (Annee>0),
    constraint ck_jour_election check (Jour in('Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche')),
    constraint ck_numero_election check (Numero between 1 and 31),
    constraint ck_mois_election check (Mois in('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Décembre'))
);

/*Table Centre*/
Create Table Centre(
    Nom varchar(20) primary key, 
    Adresse varchar(20),
    type varchar(10)
);

/*Table Utiliser*/
Create Table Utiliser(
    TypeElection varchar(20),
    AnneeElection integer,
    Centre varchar(20),
    constraint ck_anneeelection_utiliser check (AnneeElection>0),
    constraint pk_utiliser primary key (TypeElection, AnneeElection, Centre),
    constraint fk_utiliser_election foreign key (TypeElection, AnneeElection) references Election(Type, Annee),
    constraint fk_utiliser_centre foreign key (Centre) references Centre(Nom)
);

/*Table Electeur*/
Create Table Electeur(
    Numero integer primary key,
    Nom varchar(15),
    Prenom varchar(20),
    Age integer,
    Sexe varchar(1),
    Adresse varchar(20),
    constraint ck_numero_electeur check (Numero>0),
    constraint ck_sexe_electeur check (Sexe in('M', 'F')),
    constraint ck_age_electeur check (Age>=18)
);

/*Table Bureau*/
Create Table Bureau(
    Numero integer,
    Centre varchar(20),
    Nb_Inscrit integer,
    Type varchar(15),
    President integer,
    constraint ck_nbinscrit_bureau check (Nb_Inscrit>0),    
    constraint pk_bureau primary key (Numero, Centre),
    constraint ck_numero_bureau check (Numero>0),
    constraint fk_bureau_centre foreign key (centre) references Centre(Nom),
    constraint fk_bureau_electeur foreign key (President) references Electeur(Numero)
);

/*Ajout des attributs #Bureau et #Centre, clés étrangères, dans la table Electeur*/
Alter Table Electeur add Bureau integer;
Alter Table Electeur add Centre varchar(20);
Alter Table Electeur add constraint fk_electeur_bureau foreign key (Bureau, Centre) references Bureau(Numero, Centre);

/*Table Representant*/
Create Table Representant(
    Electeur integer,
    Bureau integer,
    Centre varchar(20),
    TypeElection  varchar(20),
    AnneeElection integer,
    constraint pk_representant primary key(Electeur, Bureau, Centre, TypeElection, AnneeElection),
    constraint fk_representant_electeur foreign key(Electeur) references Electeur(Numero),
    constraint fk_representant_bureau foreign key(Bureau, Centre) references Bureau(Numero, Centre),
    constraint fk_representant_election foreign key (TypeElection, AnneeElection) references Election(Type, Annee)
);

/*Table Gagner*/
Create Table Gagner(
    TypeElection varchar(20),
    AnneeElection integer,
    Electeur integer,
    constraint pk_gagner primary key(TypeElection, AnneeElection, Electeur),
    constraint fk_gagner_election foreign key (TypeElection, AnneeElection) references Election(Type, Annee),
    constraint fk_gagner_electeur foreign key(Electeur) references Electeur(Numero)
);