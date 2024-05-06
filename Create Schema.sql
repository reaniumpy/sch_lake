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