-- Create database schema
CREATE SCHEMA IF NOT EXISTS iceberg.iris
    WITH (location = 's3a://iris/');

-- Create table
CREATE TABLE IF NOT EXISTS iceberg.iris.iris_parquet
(
    sepal_length DOUBLE,
    sepal_width  DOUBLE,
    petal_length DOUBLE,
    petal_width  DOUBLE,
    class        VARCHAR
)
WITH (format = 'PARQUET',location = 's3a://iris/v1/');


-- Insert new data
INSERT INTO iceberg.iris.iris_parquet
VALUES
    (6, 3.5, 1.4, 0.2, 'Yeah')
    
    

-- Update 
UPDATE
  iceberg.iris.iris_parquet
SET
  sepal_length = 100
where class = 'Yeah'


-- Time travel
SELECT * 
FROM iceberg.iris.iris_parquet
FOR TIMESTAMP AS OF TIMESTAMP '2022-03-23 09:59:29' -- Change the time
