CREATE SCHEMA IF NOT EXISTS iceberg.iris
    WITH (location = 's3a://iris/');

CREATE TABLE IF NOT EXISTS iceberg.iris.iris_parquet
(
    sepal_length DOUBLE,
    sepal_width  DOUBLE,
    petal_length DOUBLE,
    petal_width  DOUBLE,
    class        VARCHAR
)
WITH (format = 'PARQUET',location = 's3a://iris/vv/');







CREATE SCHEMA IF NOT EXISTS hive.iris
    WITH (location = 's3a://iris/');

CREATE TABLE IF NOT EXISTS hive.iris.iris_parquet
(
    sepal_length DOUBLE,
    sepal_width  DOUBLE,
    petal_length DOUBLE,
    petal_width  DOUBLE,
    class        VARCHAR
)
WITH ( location = 's3a://iris/',
    format = 'PARQUET');




   
   INSERT INTO iceberg.iris.iris_parquet
VALUES
    (6, 3.5, 1.4, 0.2, 'Yeah')
    
    
    
    
UPDATE
  iceberg.iris.iris_parquet
SET
  class = 'zz'
where sepal_length = 5.1
  ship_date IS NULL;