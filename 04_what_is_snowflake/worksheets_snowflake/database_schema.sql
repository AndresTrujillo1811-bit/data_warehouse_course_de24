SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS course_db;

USE DATABASE course_db;

SHOW SCHEMAS;

CREATE SCHEMA IF NOT EXISTS course_db.staging;

SHOW SCHEMAS IN course_db;

CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer, 
    email varchar(50)
);

SHOW TABLES;


INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
(1, 22, 'andres1811@gmail.com'),
(2, 25, 'alex1712@gmail.com');

SELECT * FROM CUSTOMER;

DROP DATABASE course_db;

SHOW DATABASES;
