/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', 'February-03-2020', 0, 'true', 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', 'November-15-2018', 2, 'true', 8);
INSERT INTO animals VALUES (3, 'Pikachu', 'January-7-2021', 1, 'false', 15.04);
INSERT INTO animals VALUES (4, 'Devimon', 'May-12-2017', 5, 'true', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February-08-2020', 0, false, -11), ('Plantmon', 'November-15-2021', 2, true, -5.7), ('Squirtle', 'April-02-1993', 3, false, -12.13), ('Angemon', 'June-12-2005', 1, true, -45), ('Boarmon', 'June-07-2005', 7, true, 20.4), ('Blossom', 'October-13-1998', 3, true, 17), ('Ditto', 'May-14-2022', 4, true, 22);

INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
INSERT INTO species(name) VALUES ('Pokemon'), ('Digimon');
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Boarmon', 'Angemon');

