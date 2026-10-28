SELECT * FROM ikea_retail_analytics.ikea_cleaned;

USE ikea_retail_analytics;

-- 1. Check the number of imported records
SELECT COUNT(*) AS total_records
FROM ikea_cleaned;

-- 2. Inspect the imported column names and data types
DESCRIBE ikea_cleaned;

-- 3. Check duplicate OrderIDs
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT OrderID) AS unique_order_ids
FROM ikea_cleaned;

-- 4. Inspect the first 10 records
SELECT *
FROM ikea_cleaned
LIMIT 10;

-- 5. Check the main financial totals
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_pct
FROM ikea_cleaned;

USE ikea_retail_analytics;

CREATE TABLE ikea_sales_analysis AS
SELECT *
FROM ikea_cleaned;

ALTER TABLE ikea_sales_analysis
MODIFY OrderDate DATE,
MODIFY ShipDate DATE,
MODIFY DeliveryDate DATE;


-- Check the total records
SELECT COUNT(*) AS total_records
FROM ikea_sales_analysis;

-- Check column data types
DESCRIBE ikea_sales_analysis;

-- Check the first five records
SELECT *
FROM ikea_sales_analysis
LIMIT 5;