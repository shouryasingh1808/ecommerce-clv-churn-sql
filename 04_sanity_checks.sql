USE ecommerce_clv;

SELECT COUNT(*) FROM retail_raw WHERE CustomerID IS NULL;   -- 0
SELECT COUNT(*) FROM retail_raw WHERE CustomerID = 0;       -- 243007
SELECT COUNT(*) FROM retail_raw WHERE Invoice LIKE 'C%';    -- 19,494 
SELECT COUNT(*) FROM retail_raw WHERE Quantity < 0;         -- 22,950
SELECT COUNT(*) FROM retail_raw WHERE Price <= 0;           -- 6,225