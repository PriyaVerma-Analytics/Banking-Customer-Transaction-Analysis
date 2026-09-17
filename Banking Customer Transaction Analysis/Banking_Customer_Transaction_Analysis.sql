-- Banking Customer & Transaction Analysis
-- Portfolio SQL Analysis

CREATE DATABASE IF NOT EXISTS Banking_Analysis;
USE Banking_Analysis;

-- =========================================================
-- 1. TABLE CREATION
-- =========================================================

CREATE TABLE customer_data(
    Customer_Id INT,
    Age DECIMAL(5,2),
    Customer_Type VARCHAR(50),
    City VARCHAR(100),
    Region VARCHAR(50),
    Bank_Name VARCHAR(100),
    Branch_Id INT
);

CREATE TABLE transaction_data (
    Transaction_ID INT,
    Customer_ID INT,
    Account_Type VARCHAR(50),
    Total_Balance INT,
    Transaction_Amount DECIMAL(12,2),
    Investment_Amount INT,
    Investment_Type VARCHAR(100),
    Transaction_Date DATE
);

CREATE TABLE bank_data (
    Branch_ID INT,
    City VARCHAR(100),
    Region VARCHAR(50),
    Firm_Revenue DECIMAL(12,2),
    Expenses INT,
    Profit_Margin DECIMAL(10,2)
);

-- =========================================================
-- 2. DATA VALIDATION
-- =========================================================

SELECT COUNT(*) AS Total_Customers FROM customer_data;
SELECT COUNT(*) AS Total_Branches FROM bank_data;
SELECT COUNT(*) AS Total_Transactions FROM transaction_data;

-- Check duplicate Customer IDs
SELECT Customer_ID, COUNT(*) AS customer_count
FROM customer_data
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

-- =========================================================
-- 3. CUSTOMER ANALYSIS
-- =========================================================

-- Customer distribution by type
SELECT Customer_Type, COUNT(*) AS Customer_Count
FROM customer_data
GROUP BY Customer_Type
ORDER BY Customer_Count DESC;

-- Customer distribution by region
SELECT Region, COUNT(*) AS Total_Customers
FROM customer_data
GROUP BY Region
ORDER BY Total_Customers DESC;

-- Customer distribution by city
SELECT City, COUNT(*) AS Total_Customers
FROM customer_data
GROUP BY City
ORDER BY Total_Customers DESC;

-- Overall average customer age
SELECT AVG(Age) AS Average_Customer_Age
FROM customer_data;

-- Average age by customer type
SELECT Customer_Type, AVG(Age) AS Average_Age
FROM customer_data
GROUP BY Customer_Type
ORDER BY Average_Age DESC;

-- =========================================================
-- 4. TRANSACTION ANALYSIS
-- =========================================================

-- Total transactions
SELECT COUNT(*) AS Total_Transactions
FROM transaction_data;

-- Total transaction amount
SELECT SUM(Transaction_Amount) AS Total_Transaction_Amount
FROM transaction_data;

-- Average transaction amount
SELECT AVG(Transaction_Amount) AS Average_Transaction_Amount
FROM transaction_data;

-- Account type distribution
SELECT Account_Type, COUNT(*) AS Account_Count
FROM transaction_data
GROUP BY Account_Type
ORDER BY Account_Count DESC;

-- Average balance by account type
SELECT Account_Type, AVG(Total_Balance) AS Average_Balance
FROM transaction_data
GROUP BY Account_Type
ORDER BY Average_Balance DESC;

-- Total balance by account type
SELECT Account_Type, SUM(Total_Balance) AS Total_Balance
FROM transaction_data
GROUP BY Account_Type
ORDER BY Total_Balance DESC;

-- =========================================================
-- 5. INVESTMENT ANALYSIS
-- =========================================================

-- Investment type distribution
SELECT Investment_Type, COUNT(*) AS Investment_Count
FROM transaction_data
GROUP BY Investment_Type
ORDER BY Investment_Count DESC;

-- Total investment amount
SELECT SUM(Investment_Amount) AS Total_Investment_Amount
FROM transaction_data;

-- Investment amount by investment type
SELECT Investment_Type, SUM(Investment_Amount) AS Total_Investment
FROM transaction_data
GROUP BY Investment_Type
ORDER BY Total_Investment DESC;

-- Investment amount by region
SELECT c.Region, SUM(t.Investment_Amount) AS Total_Investment
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.Region
ORDER BY Total_Investment DESC;

-- Average investment amount by region
SELECT c.Region, AVG(t.Investment_Amount) AS Average_Investment
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.Region
ORDER BY Average_Investment DESC;

-- Investment amount by account type
SELECT Account_Type, SUM(Investment_Amount) AS Total_Investment
FROM transaction_data
GROUP BY Account_Type
ORDER BY Total_Investment DESC;

-- Investment amount by customer type
SELECT c.Customer_Type,
       SUM(t.Investment_Amount) AS Total_Investment
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Type
ORDER BY Total_Investment DESC;

-- Investment type by account type
SELECT Account_Type,
       Investment_Type,
       SUM(Investment_Amount) AS Total_Investment
FROM transaction_data
GROUP BY Account_Type, Investment_Type
ORDER BY Account_Type, Total_Investment DESC;

-- =========================================================
-- 6. CUSTOMER TRANSACTION ANALYSIS
-- =========================================================

-- Top 10 customers by transaction amount
SELECT Customer_ID,
       SUM(Transaction_Amount) AS Total_Transaction
FROM transaction_data
GROUP BY Customer_ID
ORDER BY Total_Transaction DESC
LIMIT 10;

-- Top 10 customers by total balance
SELECT Customer_ID,
       SUM(Total_Balance) AS Total_Balance
FROM transaction_data
GROUP BY Customer_ID
ORDER BY Total_Balance DESC
LIMIT 10;

-- Transaction amount by customer type
SELECT c.Customer_Type,
       SUM(t.Transaction_Amount) AS Total_Transaction
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Type
ORDER BY Total_Transaction DESC;

-- Average transaction amount by customer type
SELECT c.Customer_Type,
       AVG(t.Transaction_Amount) AS Average_Transaction
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Type
ORDER BY Average_Transaction DESC;

-- Transaction amount by city
SELECT c.City,
       SUM(t.Transaction_Amount) AS Total_Transaction
FROM customer_data c
JOIN transaction_data t
    ON c.Customer_ID = t.Customer_ID
GROUP BY c.City
ORDER BY Total_Transaction DESC;

-- Transaction vs investment by account type
SELECT Account_Type,
       SUM(Transaction_Amount) AS Total_Transaction,
       SUM(Investment_Amount) AS Total_Investment
FROM transaction_data
GROUP BY Account_Type
ORDER BY Total_Transaction DESC;

-- =========================================================
-- 7. BANK / FINANCIAL PERFORMANCE
-- =========================================================

-- Top 10 branches by profit margin
SELECT Branch_ID, City, Region, Profit_Margin
FROM bank_data
ORDER BY Profit_Margin DESC
LIMIT 10;

-- Average profit margin by region
SELECT Region,
       AVG(Profit_Margin) AS Average_Profit_Margin
FROM bank_data
GROUP BY Region
ORDER BY Average_Profit_Margin DESC;

-- Region-wise revenue
SELECT Region,
       SUM(Firm_Revenue) AS Total_Revenue
FROM bank_data
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Region-wise expenses
SELECT Region,
       SUM(Expenses) AS Total_Expenses
FROM bank_data
GROUP BY Region
ORDER BY Total_Expenses DESC;

-- Region-wise calculated profit
SELECT Region,
       SUM(Firm_Revenue) - SUM(Expenses) AS Profit
FROM bank_data
GROUP BY Region
ORDER BY Profit DESC;

-- Region-wise calculated profit margin
SELECT Region,
       (SUM(Firm_Revenue) - SUM(Expenses))
       / SUM(Firm_Revenue) * 100 AS Calculated_Profit_Margin
FROM bank_data
GROUP BY Region
ORDER BY Calculated_Profit_Margin DESC;

-- Bank-wise customer count
SELECT Bank_Name,
       COUNT(*) AS Total_Customers
FROM customer_data
GROUP BY Bank_Name
ORDER BY Total_Customers DESC;
