SELECT 
    *
FROM
    projects.`payroll_dataset`;

-- ADVANCED QUERIES--

SELECT 
    first_name,
    payroll_number,
    (total_ot_paid / base_salary) * 100 AS perecntage
FROM
    payroll_dataset
WHERE
    base_salary > 0;

-- 2. Create a query to rank employees based on their base salary within each agency.
select first_name,base_salary, rank()over(partition by agency_name order by base_salary desc) as salary_rank
from payroll_dataset;

-- 3. Write a query that returns the 5 highest-paid employees across all agencies and boroughs.
SELECT 
    first_name,
    agency_name,
    work_location_borough,
    (regular_gross_paid + total_ot_paid + total_other_pay) AS total_pay
FROM
    payroll_dataset;

-- 4. Find the median base salary of all employees working in Brooklyn.
select percentile_count(0.5) within group (order by base_sal) as median_base_sal
from payroll_dataset
where work_location_borough='brooklyn';

-- 5. Write a query to calculate the cumulative total of regular gross pay for all employees, ordered by payroll number.
select payroll_number, first_name, sum(regular_gross_paid)over(order by payroll_number desc) as cummulative_pay
from payroll_dataset;

-- 6. Write a query to find employees who have worked in multiple agencies .
SELECT 
    a.first_name,
    a.title_description,
    a.agency_name AS a1,
    b.agency_name AS a2
FROM
    payroll_dataset a
        JOIN
    payroll_dataset b ON a.first_name = b.first_name
        AND a.title_description = b.title_description
        AND a.agency_name <> b.agency_name;

-- 7. Write a query to calculate the total compensation (base salary + OT + other pay) for each employee and sort by the highest compensation.
SELECT 
    first_name,
    (base_salary + total_ot_paid + total_other_pay) AS total_compensation
FROM
    payroll_dataset
ORDER BY total_compensation DESC;

-- 8. Write a query to determine the average increase in base salary for employees who have been with the agency for more than 5 years.
SELECT 
    AVG(base_salary) AS avg_salary
FROM
    payroll_dataset
WHERE
    EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM agency_start_date) > 75;

-- 9. Write a query to group employees by agency and calculate the percentage of employees who are on leave.
SELECT 
    agency_name,
    COUNT(CASE
        WHEN leave_status_as_of_july_31 = 'on leave' THEN 1
    END) * 100 / COUNT(*) AS leave_percentage
FROM
    payroll_dataset
GROUP BY agency_name;

-- 10. Create a query to find the top 10 job titles (title description) with the highest average total OT paid.
SELECT 
    title_description, AVG(total_ot_paid) AS avg_ot_paid
FROM
    payroll_dataset
GROUP BY title_description
ORDER BY avg_ot_paid DESC
LIMIT 5;

-- 11. Write a query to calculate the correlation between base salary and total OT paid across the dataset.
SELECT 
    CORR(base_salary, total_ot_paid) AS correlation
FROM
    payroll_dataset;

-- 12. Write a query to find the difference between the maximum and minimum regular gross paid within each agency.
SELECT 
    MAX(regular_gross_paid) - MIN(regular_gross_paid) AS differences
FROM
    payroll_dataset;


-- INTERMEDIATE QUERIES--

SELECT 
    SUM(base_salary) AS base_sal, work_location_borough
FROM
    payroll_dataset
GROUP BY work_location_borough;

-- 2. How many employees have the leave status marked as "Active" as of July 31?--
SELECT 
    leave_status_as_of_july_31, COUNT(*) AS employee_count
FROM
    payroll_dataset
WHERE
    leave_status_as_of_july_31 = 'ACTIVE'
GROUP BY leave_status_as_of_july_31;

-- 3. Find the average regular gross paid for employees in the "Manhattan" borough.--
SELECT 
    AVG(regular_gross_paid) AS avg_gross_paid,
    work_location_borough
FROM
    payroll_dataset
WHERE
    work_location_borough = 'Manhattan'
GROUP BY work_location_borough;

-- 4. Retrieve a list of employees with a base salary greater than $100,000, and sort them by base salary inscending order.--
SELECT 
    *
FROM
    payroll_dataset
WHERE
    base_salary > 100000
ORDER BY base_salary DESC;

-- 5.Write a query to calculate total number of overtime (OT) hours worked by employees in 2023--
SELECT 
    SUM(ot_hours) AS total_OT, fiscal_year
FROM
    payroll_dataset
GROUP BY fiscal_year;

-- 6. Find the total OT paid by each agency.--
SELECT 
    SUM(total_ot_paid) AS total_OT, agency_name
FROM
    payroll_dataset
GROUP BY agency_name;

-- 7. Identify the employee with the highest base salary and retrieve their details.--
SELECT 
    payroll_number, first_name, base_salary
FROM
    payroll_dataset
ORDER BY base_salary DESC;

-- 8. Write a query to find the average regular hours worked by employees across different boroughs.--
SELECT 
    AVG(regular_hours) AS avg_regular, work_location_borough
FROM
    payroll_dataset
GROUP BY work_location_borough;

-- 9. Display the names of all employees who have more than 100 OT hours.--
SELECT 
    first_name, ot_hours
FROM
    payroll_dataset
WHERE
    ot_hours > 100;

-- 10. Find the total other pay for employees who started working after January 1, 2020.--

SELECT 
    SUM(total_ot_paid) AS ot_paid, title_description
FROM
    payroll_dataset
GROUP BY title_description;

-- 12. Retrieve the list of agencies that have more than 500 employees--
SELECT 
    first_name, agency_name, COUNT(*) AS emp_count
FROM
    payroll_dataset
GROUP BY first_name , agency_name
HAVING emp_count > 500;

-- 13.Identify the employees earning more than the average salary in thir agency --
SELECT 
    first_name, agency_name, base_salary
FROM
    payroll_dataset AS p
WHERE
    base_salary > (SELECT 
            AVG(base_salary) AS avg_sal
        FROM
            payroll_dataset
        WHERE
            agency_name = p.agency_name);


