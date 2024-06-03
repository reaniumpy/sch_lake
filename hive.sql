-- Step 1: Create schema
CREATE SCHEMA IF NOT EXISTS hive.lake
WITH (location = 's3a://lake/');


-- Step 2: Create table Employee
CREATE TABLE IF NOT EXISTS hive.lake.employee (
    id INT,
    name VARCHAR,
    age INT
) WITH (
    format = 'Parquet',
    external_location = 's3a://lake/employee'
);


-- Step 3: Add new data
INSERT INTO hive.lake.employee
VALUES 
    (4, 'John', 30),
    (5, 'Alice', 25),
    (6, 'Bob', 35);


-- Step 4: Check
select * from hive.lake.employee



-- Step 5: Create External table Tiki   
CREATE  TABLE IF NOT EXISTS hive.lake.ext_tiki_products (
    tiki_pid BIGINT,
    name VARCHAR,
    brand_name VARCHAR,
    origin VARCHAR,
    ingestion_dt_unix BIGINT
) WITH (
    format = 'Parquet',
    external_location = 's3a://lake/ext-tiki-product/'
)






-- Step 6: Create Managed table Tiki   
CREATE  TABLE IF NOT EXISTS hive.lake.managed_tiki_products (
    tiki_pid BIGINT,
    name VARCHAR,
    brand_name VARCHAR,
    origin VARCHAR,
    ingestion_dt_unix BIGINT
) 

-- Step 7: Drop External table Tiki  
DROP TABLE IF EXISTS hive.lake.ext_tiki_products;

-- Step 8: Drop Managed table Tiki   
DROP TABLE IF EXISTS hive.lake.managed_tiki_products;
