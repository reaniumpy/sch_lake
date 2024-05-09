CREATE SCHEMA IF NOT EXISTS minio.my_schema
WITH (location = 's3a://sales/');



CREATE TABLE IF NOT EXISTS minio.my_schema.my_table (
    id INT,
    name VARCHAR,
    age INT
) WITH (
    format = 'Parquet',
    external_location = 's3a://trino/'
);
create

INSERT INTO minio.my_schema.my_table
VALUES 
    (4, 'John', 30),
    (5, 'Alice', 25),
    (6, 'Bob', 35);
    
   
   
   
 CREATE  TABLE IF NOT EXISTS minio.my_schema.ext_tiki_products (
    tiki_pid BIGINT,
    name VARCHAR,
    brand_name VARCHAR,
    origin VARCHAR,
    ingestion_dt_unix BIGINT
) WITH (
    format = 'Parquet',
    external_location = 's3a://dim-product/'
)




---- 1. INIT LOAD

 CREATE  TABLE  minio.my_schema.dim_product_scd2 (
    tiki_pid BIGINT,
    name VARCHAR,
    brand_name VARCHAR,
    origin VARCHAR,
    ingestion_dt_unix BIGINT,
    valid_from BIGINT,
    valid_to BIGINT,
    is_current boolean 
)  WITH (
    format='ORC',
    transactional=true
)






-- INIT LOAD
CREATE TABLE IF NOT EXISTS minio.my_schema.dim_product
WITH (
    format='ORC',
    transactional=true
)
 AS
SELECT *
FROM minio.my_schema.ext_tiki_products;






-- INIT LOAD
INSERT INTO minio.my_schema.dim_product_scd2 (
    tiki_pid,
    name,
    brand_name,
    origin,
    ingestion_dt_unix,
    valid_from,
    valid_to,
    is_current
)
SELECT
    tiki_pid,
    name,
    brand_name,
    origin,
    ingestion_dt_unix,
    ingestion_dt_unix AS valid_from,
    NULL AS valid_to,
    TRUE AS is_current
FROM
    minio.my_schema.dim_product;