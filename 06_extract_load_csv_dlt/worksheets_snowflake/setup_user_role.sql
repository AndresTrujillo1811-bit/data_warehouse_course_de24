-- switch to an appropiate role to create user and role 
USE ROLE useradmin;

-- create dlt user
CREATE USER extract_loader
    PASSWORD = 'meja1234'
    DEFAULT_WAREHOUSE = COMPUTE_WH;

-- create dlt role
CREATE ROLE movies_dlt_role;

-- switch to an appropiate role to grant privileges to roles & grant role to user
USE ROLE securityadmin;

-- grant role to user
GRANT ROLE movies_dlt_role TO USER extract_loader;

-- grant privileges to role
-- this role needs to use warehousw, db, schema
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE movies_dlt_role;
GRANT USAGE ON DATABASE movies TO ROLE movies_dlt_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_dlt_role;

-- this role needs some special usages for the db and schema
GRANT CREATE TABLE ON SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;

-- check 
SHOW GRANTS TO ROLE movies_dlt_role;

-- create reader role
USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS movies_reader;

-- grant privileges to role
USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE movies_reader;
GRANT USAGE ON DATABASE movies TO ROLE movies_reader;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_reader;

GRANT SELECT ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_reader;
GRANT SELECT ON FUTURE TABLES IN DATABASE movies TO ROLE movies_reader;

GRANT SELECT ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movies_reader; --addition


GRANT ROLE movies_reader TO USER andres1811;

SHOW GRANTS TO ROLE movies_reader;

SHOW WAREHOUSES;