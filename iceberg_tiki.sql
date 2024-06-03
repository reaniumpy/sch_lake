CREATE SCHEMA IF NOT EXISTS iceberg.tiki
    WITH (location = 's3a://iceberg-tiki/');


CREATE TABLE IF NOT EXISTS iceberg.tiki.dim_product
(
    tiki_pid BIGINT,
    name VARCHAR,
    brand_name VARCHAR,
    origin VARCHAR,
    ingestion_dt_unix BIGINT
)
WITH (format = 'PARQUET',location = 's3a://iceberg-tiki/dim_product/');

   
INSERT INTO iceberg.tiki.dim_product
VALUES
    (10, 'Chả giò', 'Vissan', 'Việt Nam', 1712633261)
    
    
 UPDATE
  iceberg.tiki.dim_product
SET
  origin = 'Thailand'
where tiki_pid = 10


SELECT * 
FROM iceberg.tiki.dim_product
FOR TIMESTAMP AS OF TIMESTAMP '2024-05-19 16:07:29' -- Change the time