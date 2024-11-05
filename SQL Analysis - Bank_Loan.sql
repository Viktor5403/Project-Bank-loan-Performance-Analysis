USE Bank_loanDB;

-- Fetch Bank Loan Data 
SELECT * FROM Bank_LoanDB;

-- A.	BANK LOAN REPORT | SUMMARY
-- KPI’s:
-- 1. Total Loan Applications

SELECT COUNT(id) AS Total_Applications FROM Bank_LoanDB;

-- 2. Month-To-Date (Month-To-Date (MTD)) (Month-To-Date (MTD)) Loan Applications

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM Bank_LoanDB 
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 3. Previous-Month-To-Date (PMTD) Loan Applications

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM Bank_LoanDB
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 4. Total Funded Amount

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM Bank_LoanDB;

-- 5. Month-To-Date (MTD) Total Funded Amount

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_LoanDB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 6. Previous-Month-To-Date (PMTD) Total Funded Amount

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_LoanDB
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 7. Total Amount Received

SELECT SUM(total_payment) AS Total_Amount_Collected FROM Bank_LoanDB;

-- 8. Month-To-Date (MTD) Total Amount Received

SELECT SUM(total_payment) AS MTD_Total_Amount_Collected FROM Bank_LoanDB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 9. Previous-Month-To-Date (PMTD) Total Amount Received

SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected FROM Bank_LoanDB
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 10. Average Interest Rate

SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Int_Rate FROM Bank_LoanDB;

-- 11. Month-To-Date (MTD) Average Interest

SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Int_Rate FROM Bank_LoanDB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 12. Previous-Month-To-Date (PMTD) Average Interest

SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Int_Rate FROM Bank_LoanDB
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- 13. Avg DTI

SELECT ROUND(AVG(dti) * 100, 2) AS Avg_DTI FROM Bank_LoanDB;

-- 14. Month-To-Date (MTD) Avg DTI

SELECT ROUND(AVG(dti) * 100, 2) AS MTD_Avg_DTI FROM Bank_LoanDB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- 15. Previous-Month-To-Date (PMTD) Avg DTI

SELECT ROUND(AVG(dti) * 100, 2) AS PMTD_Avg_DTI FROM Bank_LoanDB
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- GOOD LOAN ISSUED
-- 1. Good Loan Percentage

SELECT
	ROUND((COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id), 2)
     AS Good_Loan_Percentage
FROM Bank_LoanDB;

-- 2. Good Loan Applications

SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_LoanDB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- 3. Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM Bank_LoanDB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- 4. Good Loan Amount Received

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM Bank_LoanDB
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- BAD LOAN ISSUED
-- 1. Bad Loan Percentage

SELECT
    ROUND((COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id), 2) AS Bad_Loan_Percentage
FROM Bank_LoanDB;

-- 2. Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM Bank_LoanDB
WHERE loan_status = 'Charged Off';

-- 3. Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount_recieved FROM Bank_LoanDB
WHERE loan_status = 'Charged Off';

-- 4. Bad Loan Amount Received

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM Bank_LoanDB
WHERE loan_status = 'Charged Off';

-- LOAN STATUS

SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        ROUND(AVG(int_rate * 100), 2)  AS Interest_Rate,
        ROUND(AVG(dti * 100), 2) AS DTI
    FROM
        Bank_LoanDB
    GROUP BY
        loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM Bank_LoanDB
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status;


-- B. BANK LOAN REPORT | OVERVIEW

-- 1.  MONTH

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);

-- 2. ADDRESS_STATE

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC;

-- 3.  TERM

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY term
ORDER BY term;

-- 4. EMPLOYEE LENGTH

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY emp_length
ORDER BY emp_length;

-- 5. PURPOSE

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY purpose
ORDER BY COUNT(id) DESC;

-- 6. HOME OWNERSHIP

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
GROUP BY home_ownership
ORDER BY COUNT(id) DESC;

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_LoanDB
WHERE grade = 'A'AND address_state = 'CA'
GROUP BY purpose
ORDER BY COUNT(id) DESC;