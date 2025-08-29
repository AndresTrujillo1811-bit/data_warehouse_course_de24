SHOW DATABASES;

-- switch to an appropiate role
USE ROLE sysadmin;

-- set up database for dlt csv data ingestion
CREATE DATABASE IF NOT EXISTS movies;

-- set up staging schema
CREATE SCHEMA staging;
-- alternative: CREATE SCHEMA movies.changing;

USE DATABASE movies;