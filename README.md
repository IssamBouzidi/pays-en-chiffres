# Pays en chiffres
## Introduction
Manipulations des données sur les pays avec **PL/pgSQL**(Procedures stockées, fonctions, triggers)

## Pré-requis
Base de données PostgreSQL  
Vous pouvez creer une base donner SaaS sur [ElephantSQL](elephantsql.com)  
Pour exploiter la base de données, vous pouvez utiliser [PgAdmin](https://www.pgadmin.org/download/)  

## Source file
Fichier CSV de base qui contient les informations sur les pays à manipuler [population_by_country_2020.csv](https://simplonline-v3-prod.s3.eu-west-3.amazonaws.com/media/file/csv/25d9c746-3622-4c48-835e-d7ccafa311f5.csv)

## Livrables
Fichier DDL qui contient les requêtes SQL pour creer et alimenter la table

## Procedure à suivre afin de lancer les scripts
1. **Alimentation de la base de données**  
La premiere étape consiste à créer la table, à l'alimenter et à creer les foncitons, les procedures stockées et le trigger, pour cela, veuillez lancer le script [database_create.ddl](https://github.com/IssamBouzidi/pays-en-chiffres/blob/master/database_create.ddl)  

2. **Exploitations de la base de données**  
Ci-dessous vous trouverez les scripts à executer pour exploiter la base de données  
    <ins>2.1. Fonction qui retourne les informations sur un pays</ins>  
    Cette fonction prend en parametre le nom d'un pays et affiche ses informations en format table.  
    Executez le code suivant pour retourner les informations d'un pays sous forme de table  
    `SELECT * FROM get_country('nom pays')`  
    
    <ins>2.2. Procedure qui ajoute un nouveau pays</ins>  
    Cette procedure permet d'ajouter un nouvea pays, la procedure prend en parametre le nom d'un nouveau pays, les informations sur le pays sont génerées aleatoirement.  
     `CALL insert_new_country('nom pays')`  
    
    <ins>2.3. Modifier la date d'insertion lors de l'ajout d'un nouveau pays</ins>  
    Lors d'ajout d'un nouveau pays, un trigger doit se declencher pour modifier la date d'insertion  
    
    <ins>2.4. Regrouper les pays par tranche de densité de population</ins>  
    les pays ont été regroupé sous les tranches de densité de population designées dans le tableau suivant:  
    Densité de population | Tranche
    --- | ---
    < 100 | Tranche 1
    100 à 1000 | Tranche 2
    1001 à 10000| Tranche 3
    10001 < | Tranche 4
    
      *2.4.1. Fonction qui retourne un pays avec tranche de densité de population*  
      Cette fonction prend en parametre le nom d'un pays et retourne la tranche à laquelle le pays appartient  
      `SELECT * FROM get_tranche_by_country ('nom du pays')`  
        
      *2.4.2. Fonction qui retourne la liste des pays avec tranche de densité de population*  
      Cette fonction retourne la liste des pays avec les tranches à laquelle appartient chaque pays  
      `SELECT * FROM get_tranches_all()`
      
      > Les deux fonctions ci-dessus font appel à une fontion qui prend en parametre la densité de population et un parametre de sortie (OUT) qui contient la tranche à laquelle appartien cette densité
      ```SQL
        create or replace function get_tranche(density_param int, out tranche varchar) 
        language plpgsql
        as $$
        begin
            tranche := (select CASE 
                                    WHEN density_param <= 100 THEN 'Tranche 1'
                                    WHEN density_param <= 1000 THEN 'Tranche 2'
                                    WHEN density_param <= 10000 THEN 'Tranche 3'
                                    ELSE 'Tranche 4'
                                END);
        end;
        $$;
      ```
      
 ## Help
 Pour plus d'informations ou d'aide veuillez me contacter sur cette email <issam.bouzidi.01@gmail.com>
 
