# 🏦 Banking Customer & Transaction Analysis

## 📌 Project Overview

This project analyzes banking customer, transaction, investment, and branch-level financial data to understand customer distribution, transaction behavior, investment patterns, account balances, and regional financial performance.

The project uses **Python/Pandas, SQL, Power BI, and DAX** to clean, analyze, and visualize the data.

---

## 🎯 Business Problem

The objective of this project is to analyze customer, transaction, investment, and bank performance data to understand customer distribution, transaction behavior, investment patterns, account balances, and regional financial performance.

The analysis provides data-driven insights into banking operations and customer financial activity.

---

## 📂 Dataset

The project uses three CSV files:

- `customer_data.csv` — Customer information such as age, customer type, city, region, bank, and branch.
- `transaction_data.csv` — Transaction, account balance, investment, and transaction date information.
- `bank_data.csv` — Branch-level revenue, expenses, and profit margin information.

### Dataset Size

| Dataset | Rows | Columns |
|---|---:|---:|
| Customer Data | 10,000 | 7 |
| Transaction Data | 10,000 | 8 |
| Bank Data | 1,000 | 6 |

---

## 🧹 Data Cleaning — Python & Pandas

Python/Pandas was used to prepare the datasets for analysis.

Main cleaning steps:

- Checked dataset structure and data types.
- Checked missing values.
- Checked duplicate rows.
- Filled missing `Customer_Type` and `City` values with `Unknown`.
- Filled missing `Age` values using the mean age.
- Filled missing `Firm_Revenue` values using the mean revenue.
- Converted `Transaction_Date` from object format to datetime.
- Created Year, Month, and Quarter fields during analysis.
- Exported the cleaned datasets as CSV files.

---

## 🗄️ SQL Analysis

SQL was used to perform customer, transaction, investment, and financial analysis.

Key analysis areas include:

- Customer distribution by customer type and region
- Average customer age
- Total and average transaction amounts
- Account type distribution
- Total balance by account type
- Investment distribution and investment amounts
- Investment by region and customer type
- Top customers by transaction amount and balance
- City-wise transaction analysis
- Region-wise revenue and expenses
- Calculated regional profit and profit margin
- Branch-level profit margin analysis

---

## 📊 Power BI Dashboard

The cleaned data was connected to Power BI to create an interactive banking analysis dashboard.

### Key KPIs

- **Total Customers:** 10K
- **Total Transactions:** 10K
- **Total Transaction Amount:** 25.43M
- **Average Transaction Amount:** 2.54K
- **Total Investment Amount:** 256M
- **Total Balance:** 502M

### Dashboard Visuals

- Customer Distribution by Type
- Customer Distribution by Region
- Average Age by Customer Type
- Total Balance by Account Type
- Investment Amount by Investment Type
- Investment Amount by Customer Type
- Transaction Amount Trend Over Time
- Region-wise Revenue & Expenses

---

## 🔍 Key Insights

- Customer types are relatively balanced, with Business customers forming the largest known customer group.
- Customer distribution across regions is fairly balanced.
- Average customer age is close to 49 across customer types.
- Current, Savings, and Business accounts have similar total balances.
- Investment amounts are distributed fairly evenly across investment types.
- Employee customers account for the highest total transaction amount among the known customer types.
- Pune has the highest total transaction amount among the listed cities.
- Regional revenue, expenses, and calculated profit vary across the four regions.

---

## 🛠️ Tools Used

- **Python**
- **Pandas**
- **MySQL**
- **Power BI**
- **DAX**

---

## 📁 Project Structure

```text
Banking_Customer_Transaction_Analysis/
│
├── Banking_Customer_Transaction_Analysis.pbix
├── Banking_Customer_Transaction_Analysis.sql
├── bank_cleaned.csv
├── customer_cleaned.csv
├── transaction_cleaned.csv
└── README.md
```

---

## 📌 Project Objective

This project demonstrates practical skills in **data cleaning, SQL analysis, data visualization, KPI development, and business insight generation** using a banking dataset.
