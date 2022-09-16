/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT DELETE_ANIMAL_BORN_AFTER_2022_01_01;
UPDATE animals SET weight_kg = (weight_kg * (-1));
ROLLBACK TO DELETE_ANIMAL_BORN_AFTER_2022_01_01;
UPDATE animals SET weight_kg = (weight_kg * (-1)) WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'  GROUP BY species;

SELECT name FROM animals JOIN owners ON owners.full_name = 'Melody Pond' AND owners.id = animals.owner_id;
SELECT animals.name FROM animals JOIN species ON species.name = 'Pokemon' AND animals.species_id = species.id;
SELECT animals.name, owners.full_name FROM animals FULL OUTER JOIN owners ON animals.owner_id = owners.id;
SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.id;
SELECT name, owners.full_name FROM animals JOIN owners ON owners.full_name = 'Jennifer Orwell' AND animals.species_id = (SELECT id FROM species WHERE name = 'Digimon') AND owners.id = animals.owner_id;
SELECT name, escape_attempts, owners.full_name FROM animals JOIN owners ON owners.full_name = 'Dean Winchester'
AND animals.owner_id = owners.id AND animals.escape_attempts = 0;
SELECT COUNT(*), owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name ORDER BY COUNT(*) DESC;

