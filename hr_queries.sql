/* =========================================================
   HR ATTRITION ANALYSIS
   Database  : hr_analytics
   Table     : hr_data
   Purpose   : Analyze employee attrition patterns
   ========================================================= */

/* ---------------------------------------------------------
   1. TOTAL NUMBER OF EMPLOYEES
   Business Question:
   → How many employees are currently recorded in the dataset?
   --------------------------------------------------------- */
SELECT COUNT(*) AS total_employees
FROM hr_data;


/* ---------------------------------------------------------
   2. TOTAL ATTRITION COUNT
   Business Question:
   → How many employees have left the company?
   --------------------------------------------------------- */
SELECT COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes';


/* ---------------------------------------------------------
   3. ATTRITION BY DEPARTMENT
   Business Question:
   → Which departments are facing the highest employee attrition?
   Insight Use:
   → Helps HR focus retention strategies department-wise
   --------------------------------------------------------- */
SELECT Department,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY attrition_count DESC;


/* ---------------------------------------------------------
   4. ATTRITION VS OVERTIME
   Business Question:
   → Does working overtime increase the likelihood of attrition?
   Insight Use:
   → Identifies burnout and workload-related risks
   --------------------------------------------------------- */
SELECT OverTime,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY OverTime;


/* ---------------------------------------------------------
   5. SALARY BAND VS ATTRITION
   Business Question:
   → Are employees leaving more from low, medium, or high salary bands?
   Insight Use:
   → Helps evaluate compensation-related attrition trends
   --------------------------------------------------------- */
SELECT SalaryBand,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY SalaryBand;


/* ---------------------------------------------------------
   6. PERFORMANCE RATING VS ATTRITION
   Business Question:
   → Are high-performing employees also leaving the company?
   Insight Use:
   → Identifies loss of top talent
   --------------------------------------------------------- */
SELECT PerformanceRating,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition = 'Yes'
GROUP BY PerformanceRating
ORDER BY PerformanceRating DESC;


/* ---------------------------------------------------------
   7. AVERAGE TENURE OF EMPLOYEES WHO LEFT
   Business Question:
   → On average, how long do employees stay before leaving?
   Insight Use:
   → Helps identify early-stage vs long-term attrition
   --------------------------------------------------------- */
SELECT ROUND(AVG(YearsAtCompany), 2) AS avg_years_before_exit
FROM hr_data
WHERE Attrition = 'Yes';
