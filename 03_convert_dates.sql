USE ecommerce_clv;

ALTER TABLE retail_raw ADD COLUMN InvoiceDate_new DATETIME;

-- Takes a few minutes on 1M+ rows (raise the Workbench read timeout if the connection drops)
UPDATE retail_raw
SET InvoiceDate_new = STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');

-- Must return 0 before running the swap below
SELECT COUNT(*) FROM retail_raw WHERE InvoiceDate_new IS NULL;

-- Swap: drop the text column, rename the new one
ALTER TABLE retail_raw DROP COLUMN InvoiceDate;
ALTER TABLE retail_raw CHANGE InvoiceDate_new InvoiceDate DATETIME;

-- Expected range: 2009-12-01 to 2011-12-09
SELECT MIN(InvoiceDate), MAX(InvoiceDate) FROM retail_raw;