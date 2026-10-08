USE ecommerce_clv;

-- Requires OPT_LOCAL_INFILE=1 in the Workbench connection (Advanced > Others)
SET GLOBAL local_infile = 1;

-- Update the paths to your own machine
-- Do NOT TRUNCATE between the two loads, LOAD DATA appends

LOAD DATA LOCAL INFILE 'C:/Users/pc/Data science/projects/SQL project/online_retail_II_page 1.csv'
INTO TABLE retail_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/pc/Data science/projects/SQL project/online_retail_ii_page_2.csv'
INTO TABLE retail_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Expected: 1,067,371 rows in total
SELECT COUNT(*) FROM retail_raw;