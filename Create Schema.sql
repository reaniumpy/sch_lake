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
    ingestion_date DATE,
    ingestion_dt_unix BIGINT
) WITH (
    format = 'Parquet',
    external_location = 's3a://dim-product/'
)

# Tại sao sử dụng hive nhưng tại không có type string
# Tại sao trino không có external table