-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here: Biodiversiadad de cada region. ¿Regiones con mas especies registradas?
SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;

-- MISSION 2
-- Your query here: Meses de mayor observacion
SELECT 
    SUBSTR(observation_date, 6, 2) AS month,
    COUNT(*) AS total
FROM observations
GROUP BY month
ORDER BY total DESC;



-- MISSION 3
-- Your query here:Especies con pocos individuos registrados.
SELECT 
    species.scientific_name,
    species.common_name,
    SUM(observations.count) AS total_count
FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
HAVING total_count < 5
ORDER BY total_count ASC;


-- MISSION 4
-- Your query here: Region con mas especies distintas


-- MISSION 5
-- Your query here: Especies observadas con mas frecuencia


-- MISSION 6
-- Your query here: Personas que mas registros de observancion han realizado


-- MISSION 7
-- Your query here: Especies que nunca han sido observadas


-- MISSION 8
-- Your query here: en que fechas se observaron mas especies diferentes
