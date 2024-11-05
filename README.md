# Bank Loan Performance Analysis

## Table of Contents
1. [Project Overview](#project-overview)
2. [Data Source](#data-source)
3. [Tools](#tools)
4. [Data Cleaning](#data-cleaning)
5. [Exploratory Data Analysis](#exploratory-data-analysis)
6. [Results](#results)
7. [Recommendations](#recommendations)
8. [Limitations](#limitations)
9. [References](#references)

## Project Overview

![image](https://github.com/user-attachments/assets/d6181ea6-234e-443b-ae51-d5d2cb05214c)

The objective of this analysis is to assess key performance indicators (KPIs) for bank loan operations. The analysis focuses on understanding loan application trends, funded amounts, and payment collections over specific time periods. Insights from this analysis can aid in evaluating loan performance and guiding strategic decisions for optimizing loan processes.

## Data Source
- SQL Dataset: Provided as a `.sql` script file containing queries to extract loan data metrics from a database.
- Power BI Report: Includes visualizations that represent trends in loan applications, funded amounts, and payments.

## Tools
- SQL Server: For executing SQL queries and fetching key performance metrics.
- Power BI: Used for data visualization and generating graphical insights.

## Data Cleaning
Data cleaning steps included:
- Ensuring data integrity by handling any missing or inconsistent values.
- Formatting dates to enable accurate month-over-month comparisons.
- Validating numeric fields (e.g., loan amounts, payments) for accurate aggregation.

## Exploratory Data Analysis
Key questions explored include:
- How many loan applications were processed in the current and previous month?
- What is the total funded amount, and how does it compare month-to-month?
- How much total payment has been collected, and what are the month-over-month changes?

## Results

![image](https://github.com/user-attachments/assets/d6181ea6-234e-443b-ae51-d5d2cb05214c)

1. **Loan Applications**: A total count of all loan applications, with monthly breakdowns for MTD and PMTD.
2. **Funded Amounts**: Total funded amount, including specific amounts for the current and previous month.
3. **Collected Payments**: Total collected payments, highlighting changes between MTD and PMTD periods.

## Recommendations
- Increase promotional efforts during peak loan application months to maximize funded amounts.
- Implement collection strategies to improve payment recovery in underperforming months.
- Monitor MTD and PMTD metrics regularly to adapt to month-over-month trends.

## Limitations
- The analysis is based on limited monthly data; incorporating a broader timeframe could improve trend accuracy.
- Data integrity issues, if present, may affect the aggregation of loan amounts and payments.

## References
- SQL documentation for aggregation functions and date operations.
- Power BI resources for creating financial dashboards.
