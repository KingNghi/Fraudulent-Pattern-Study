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

