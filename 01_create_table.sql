CREATE DATABASE IF NOT EXISTS ecommerce_clv;
USE ecommerce_clv;

-- InvoiceDate is loaded as text first (source format is M/D/YYYY H:MM),
-- then converted to DATETIME in 03_convert_dates.sql
CREATE TABLE IF NOT EXISTS retail_raw (
    Invoice     VARCHAR(20),
    StockCode   VARCHAR(20),
    Description VARCHAR(500),
    Quantity    INT,
    InvoiceDate VARCHAR(30),
    Price       DECIMAL(10,2),
    CustomerID  INT,
    Country     VARCHAR(50)
);