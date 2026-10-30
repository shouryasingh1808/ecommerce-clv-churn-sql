USE ecommerce_clv;

-- Clean sales: real customers, real products, completed sales only
CREATE OR REPLACE VIEW retail_clean AS
SELECT
		Invoice ,
        StockCode,
        Description,
        Quantity,
        Price,
        Quantity * Price as LineTotal,
        CustomerID,
        Country,
        InvoiceDate
	from retail_raw
    WHERE Invoice NOT LIKE 'C%'
		AND Quantity > 0
        AND PRICE > 0
        AND CustomerID <> 0;  

-- Cancelled orders kept separately for return-behaviour analysis

CREATE OR REPLACE VIEW retail_returns AS
select
		INVOICE,
		StockCode,
        Description,
        Quantity,
        Price,
        Quantity * Price as LineTotal,
        CustomerID,
        Country,
        InvoiceDate
	FROM retail_raw
    WHERE Invoice LIKE 'C%';

SELECT COUNT(*) AS clean_rows  FROM retail_clean;
SELECT COUNT(*) AS return_rows  FROM retail_returns;
SELECT COUNT(DISTINCT CustomerID) AS customers FROM retail_clean;
SELECT MIN(LineTotal), MAX(LineTotal), SUM(LineTotal) FROM retail_clean;
SELECT * FROM retail_clean ORDER BY LineTotal DESC LIMIT 1;
SELECT * FROM retail_clean ORDER BY quantity DESC LIMIT 10;