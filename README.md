# Project background
As digital payments become increasingly common, credit card fraud has emerged as a serious financial and data security problem.
While many institutions use machine learning models to detect fraud in real time, understanding the underlying behavioral patterns behind fraudulent activities is just as important.

This project focuses on exploring and analyzing fraud patterns using SQL, not predicting or flagging individual fraudulent transactions.
The goal is to understand how fraudulent behaviors differ from normal user behavior in terms of transaction frequency, timing, amount, and merchant characteristics.
# Data Structure & Initial Checks
The dataset contains credit card transactions made by European cardholders in September 2013, sourced from Kaggle. 
Originally, it was provided as a single raw file containing transaction details such as timestamps, amounts, card numbers, merchant information, and fraud labels.

To make the data more structured and realistic for SQL analysis, I normalized the dataset into four related tables, as shown below:
![link](Images/ERD.png)
# Methodology 
1. First, I use Excel to normalize the large single file dataset into four related tables. Due to the capacity of excel, I have to reduce the number of rows to half by keeping the the first 500000 rows.
2. Then, I write SQL queries to analyze the pattern of fraudulent transactions.
# Skills
Excel: Power Query Editor, data modeling

SQL: CTEs, Joins, Case, Aggregate functions
# Executive Summary
### Overview of Findings

# Insights Deep Dive
### Time-based
Fraud spikes late at night (especially around 10 PM–12 AM) then, when monitoring or user activity may be lower — a common pattern in fraud behavior. Then it gradually declines toward dawn till 3 AM.

There’s a noticeable dip during regular working hours (8 AM–5 PM), suggesting that fraudsters exploit off-peak times.
![link](Images/Fraudulent_Transactions_per_Hour.png)

### Category-based
Highest fraud rate: shopping_net — 1.74%, meaning online shopping transactions have the greatest fraud risk.

Lowest fraud rate: home — only 0.12%, suggesting low-risk activity in this category.

Online transactions (shopping_net, grocery_net, misc_net) show notably higher fraud rates than point-of-sale (POS) or in-person transactions.
This pattern aligns with general fraud trends — digital channels are easier for fraudsters to exploit.

Fraud detection systems should prioritize online merchant monitoring, especially in the shopping-related segments.
![link](Images/Fraud_Rate_by_Category.png)

### Amount-based

![link](Images/Amount.png)
