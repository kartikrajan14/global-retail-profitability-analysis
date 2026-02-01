--This project was done using PostgreSQL for SQL analysis.
--This is done by Kartikay Rajan.


--  Top 10 Selling Products 
SELECT 
    "ProductName",
    SUM("Sales") AS "TotalSales"
FROM 
    "Orders"
GROUP BY 
    "ProductName"
ORDER BY 
    "TotalSales" DESC
LIMIT 10;

-- ================================
--  Total Sales by Region 
SELECT 
    "Region",
    SUM("Sales") AS "TotalSales"
FROM 
    "Orders"
GROUP BY 
    "Region"
ORDER BY 
    "TotalSales" DESC;

-- ================================
-- Total Profit by Category 
SELECT 
    "Category",
    SUM("Profit") AS "TotalProfit"
FROM 
    "Orders"
GROUP BY 
    "Category"
ORDER BY 
    "TotalProfit" DESC;

-- ================================
--  Monthly Sales Trend 
SELECT 
    DATE_TRUNC('month', "OrderDate") AS "Month",
    SUM("Sales") AS "MonthlySales"
FROM 
    "Orders"
GROUP BY 
    "Month"
ORDER BY 
    "Month";

-- ================================
-- Top Customers by Profit 
SELECT 
    "CustomerName",
    SUM("Profit") AS "TotalProfit"
FROM 
    "Orders"
GROUP BY 
    "CustomerName"
ORDER BY 
    "TotalProfit" DESC
LIMIT 10;

-- ================================
--Orders with Negative Profit 
SELECT 
    "OrderID",
    "ProductName",
    "Sales",
    "Profit"
FROM 
    "Orders"
WHERE 
    "Profit" < 0
ORDER BY 
    "Profit" ASC;

-- ================================
--  Shipping Mode Analysis 
SELECT 
    "ShipMode",
    COUNT(*) AS "NumberOfOrders",
    SUM("Sales") AS "TotalSales",
    SUM("Profit") AS "TotalProfit"
FROM 
    "Orders"
GROUP BY 
    "ShipMode"
ORDER BY 
    "TotalSales" DESC;

-- Sales vs. Profit by Segment 
SELECT 
    "Segment",
    SUM("Sales") AS "TotalSales",
    SUM("Profit") AS "TotalProfit"
FROM 
    "Orders"
GROUP BY 
    "Segment"
ORDER BY 
    "TotalSales" DESC;

