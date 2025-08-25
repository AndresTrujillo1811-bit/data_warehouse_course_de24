USE DATABASE crunchbase_organizations_and_people_data;

SHOW SCHEMAS;

USE SCHEMA CRUNCHBASE;

SHOW TABLES; 

SELECT * FROM people LIMIT 10;

DESC VIEW organizations;

DESC VIEW people;

SELECT COUNT(*) AS number_rows FROM people;

SELECT DISTINCT gender FROM people;

SELECT COUNT(DISTINCT name) AS Employees FROM people;

SELECT COUNT(DISTINCT location) AS Locations FROM people;

SELECT id, name, location AS Locations, regions FROM people WHERE location LIKE '%Sweden%' OR location LIKE '%Norway%' OR location LIKE '%Denmark%' ORDER BY id DESC;

SELECT id, name, location AS Locations, regions FROM people HAVING location LIKE '%United States%' ORDER BY id DESC LIMIT 30;




