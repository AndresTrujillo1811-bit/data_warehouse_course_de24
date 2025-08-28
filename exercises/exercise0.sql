-- Exercise 0 - Google queries

-- Search and get the following dataset Google Keywords search dataset - discover all searches on Google.

-- a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.

USE DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW SCHEMAS;

USE SCHEMA DATAFEEDS;

SHOW TABLES;

SHOW VIEWS;


-- b) Find out the columns and its data types in the table GOOGLE_KEYWORDS.
DESC TABLE google_keywords;


-- c) Find out number of rows in the dataset.
SELECT COUNT(*) AS number_rows FROM google_keywords;


-- d) When is the first search and when is the latest search in the dataset?
SELECT * FROM google_keywords LIMIT 20;
SELECT * FROM google_keywords ORDER BY date ASC LIMIT 1; -- first search
SELECT * FROM google_keywords ORDER BY date DESC LIMIT 1; -- last search


-- e) Which are the 10 most popular keywords?
SELECT keyword, COUNT(*) AS Users FROM google_keywords GROUP BY keyword ORDER BY Users DESC LIMIT 10; 


-- f) How many unique keywords are there?
SELECT COUNT(DISTINCT keyword) AS unique_keywords FROM google_keywords;


-- g) Check what type of platforms are used and how many users per platform
SELECT platform, COUNT(DISTINCT calibrated_users) AS Users FROM google_keywords GROUP BY platform ORDER BY Users;


-- h) Let's dive into what swedish people are searching. 
-- Go into worldbanks country codes to find out the country code for Sweden. Find the 20 most popular keywords and the number of searches of that keyword.
SELECT keyword, COUNT(*) AS Searches FROM google_keywords WHERE country = '752' GROUP BY keyword ORDER BY Searches DESC LIMIT 20; 


-- i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify.
SELECT keyword, country, COUNT(*) AS Searches FROM google_keywords WHERE keyword = 'spotify' GROUP BY keyword, country ORDER BY Searches DESC LIMIT 10; -- 840: USA  56: Belgium

