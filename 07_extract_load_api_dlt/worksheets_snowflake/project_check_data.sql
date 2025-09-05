USE ROLE job_ads_dlt_role;

USE DATABASE job_ads;

SHOW schemas;

SHOW TABLES IN SCHEMA staging;

DESC TABLE staging.job_ads;

SELECT headline, employer__workplace, description__text, occupation__label FROM staging.job_ads;