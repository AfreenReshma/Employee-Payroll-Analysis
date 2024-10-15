# Employee-Payroll-Analysis

---

## ***Project Overview***

This project focuses on analyzing a payroll dataset that includes employee compensation details across various agencies for the fiscal year 2023. The goal is to identify patterns in compensation distribution, overtime usage, and discrepancies in pay across different job titles, agencies, and locations.

Through extensive SQL querying and Power BI visualizations, this analysis aims to highlight key trends, uncover potential inefficiencies in payroll management, and provide insights into workforce compensation across different government agencies.

---

## ***Database Setup & Design***

### **Schema Structure**
The payroll dataset contains the following fields:

• Fiscal Year
• Payroll Number
• Agency Name
• Employee First Name
• Agency Start Date
• Work Location Borough
• Title Description
• Leave Status as of July 31
• Base Salary
• Pay Basis
• Regular Hours
• Regular Gross Paid
• OT Hours
• Total OT Paid
• Total Other Pay
• Agency Payroll
Proper indexing has been applied for optimizing query performance, especially on frequently queried columns like Agency Name, Work Location Borough, and Payroll Number.

---

## ***Constraints***

Referential integrity and consistency are maintained as follows:

Primary Keys: Each record is uniquely identified by the combination of Payroll Number and Fiscal Year.
Data Integrity: Fields like Base Salary and OT Hours are constrained to ensure only positive numeric values, preventing negative salaries or work hours.
Default Values: Columns such as Total OT Paid and Total Other Pay have default values of 0 to handle cases where no overtime or other payments are applicable.

---

## ***Data Cleaning***

The data cleaning process involved the following steps:

• Removing Duplicates: Duplicate entries were eliminated based on Payroll Number and Fiscal Year, ensuring each employee is listed only once per fiscal year.

• Handling Missing Values: Missing data for Regular Hours, OT Hours, or Base Salary were addressed by imputing the average for similar job titles or marking them as "No Data Available" to avoid skewing the analysis.

• Standardizing Data: Fields like Work Location Borough were standardized to maintain uniformity in naming conventions (e.g., "NYC" and "New York City" were merged).

---

## ***Identifying Business Problems***

Payroll discrepancies and inefficiencies were highlighted through SQL queries:

Overtime Payments: Analyzed departments with consistently high overtime hours and payments to identify potential overuse of overtime.

Pay Distribution: Analyzed discrepancies between the Base Salary and Total OT Paid across job titles and agencies to find underpaid or overpaid roles.

Leave Status Impact: Investigated how Leave Status affects salary distribution and overtime usage.

---

## ***Power BI Visualizations***

Key dashboards and visualizations created in Power BI include:

_Agency Payroll Distribution: A bar chart comparing total payroll expenses across different agencies.
_Overtime Analysis: A pie chart showing the proportion of employees receiving overtime pay in relation to total payroll.
_Salary vs. Job Title: A scatter plot visualizing the correlation between Base Salary and Job Titles, helping to highlight underpaid roles._-Borough-wise Payroll Analysis: A geographical map showing payroll distribution across different boroughs, highlighting regional pay discrepancies.

---

## ***Objectives***

The main objectives of this project were to:

Perform a detailed payroll analysis to identify inefficiencies in employee compensation.
Provide data-driven insights into salary distribution, overtime usage, and regional discrepancies.
Offer recommendations for optimizing payroll expenses and improving compensation management.

---

## ***Learning Outcomes***

This project allowed me to:

Design a structured payroll database schema and ensure optimal query performance using indexes and constraints.

Clean and preprocess a real-world payroll dataset for analysis.

Use advanced SQL techniques such as aggregation, joins, and subqueries to perform detailed payroll analysis.

Leverage Power BI for creating insightful visualizations that can help drive business decisions related to payroll and compensation management.

Identify actionable insights that can help organizations optimize payroll expenses and ensure equitable compensation.

---

## ***Conclusion***

This Payroll Data Analysis project demonstrates my ability to handle and analyze large datasets related to workforce compensation. Using SQL for querying and Power BI for visualizing key trends, I was able to uncover important insights into payroll distribution and overtime management, helping organizations identify potential areas for improvement in payroll processing and compensation strategies.

---





