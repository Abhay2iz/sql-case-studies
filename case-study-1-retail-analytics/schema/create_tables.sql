/* =====================================================================
   CASE STUDY 1: COFFEE SALES ANALYSIS — SCHEMA
   Platform: Microsoft SQL Server (SSMS)
   Note: Tables are populated by importing the Product, Location, and
   fact CSV files via SSMS Import Wizard (Tasks > Import Data), or via
   BULK INSERT. Adjust column types as needed for your CSV source.
   ===================================================================== */

CREATE DATABASE sqlcasestudy1;
GO
USE sqlcasestudy1;
GO

CREATE TABLE Product (
    ProductId    INT PRIMARY KEY,
    Product_Type VARCHAR(50),
    Product      VARCHAR(100),
    Type         VARCHAR(20)
);

CREATE TABLE Location (
    Area_Code   INT PRIMARY KEY,
    State       VARCHAR(50),
    Market      VARCHAR(50),
    Market_Size VARCHAR(50)
);

CREATE TABLE fact (
    Date           DATE,
    ProductId      INT FOREIGN KEY REFERENCES Product(ProductId),
    Profit         INT,
    Sales          INT,
    Margin         INT,
    COGS           INT,
    Total_Expenses INT,
    Marketing      INT,
    Inventory      INT,
    Budget_Profit  INT,
    Budget_COGS    INT,
    Budget_Margin  INT,
    Budget_Sales   INT,
    Area_Code      INT FOREIGN KEY REFERENCES Location(Area_Code)
);

-- Import Product.csv, Location.csv, and fact.csv into the tables above
-- using SSMS: right-click database > Tasks > Import Flat File.
