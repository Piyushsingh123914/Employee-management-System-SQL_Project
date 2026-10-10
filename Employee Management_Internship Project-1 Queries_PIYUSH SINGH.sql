USE employee_db;

drop table employees;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    salary INT,
    age INT,
    gender ENUM('Male','Female','Other'),
    department VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id));
    

INSERT INTO employees VALUES
(345, 'Nate', 'Henfre', 'nhenfre1@storify.com', '843-37-5785', '2023-09-11', 105492, 47, 'Male', 'Product Management', NULL),

(750, 'Freeland', 'Spracklin', 'fspracklin4@cargocollective.com', '104-82-6002', '2024-04-10', 155204, 21, 'Male', 'R&D Manager', NULL),

(296, 'Allina', 'Patmore', 'apatmore7@google.nl', '716-72-1407', '2024-08-31', 124350, 40, 'Female', 'HR Manager', NULL),

(234, 'Robin', 'MacMenamy', 'rmacmenamy0@nsw.gov.au', '616-58-5257', '2025-04-06', 139111, 22, 'Female', 'Research and Development', 345),

(674, 'Moses', 'Loughlin', 'moloughlin2@chron.com', '589-88-0014', '2024-04-20', 34920, 50, 'Male', 'Support', 296),

(123, 'Shayla', 'Stove', 'sstove3@samsung.com', '888-79-3482', '2023-10-10', 67953, 35, 'Female', 'Legal', 296),

(392, 'Gretel', 'Ivatts', 'givatts5@buzzfeed.com', '171-52-565', '2023-10-26', 53768, 32, 'Female', 'Human Resources', 296),

(734, 'Allen', 'Twede', 'atwedee@eventbrite.com', '799-47-3972', '2024-01-26', 111625, 28, 'Male', 'Engineering', 345),

(193, 'Elli', 'Sidon', 'esidon1f@istockphoto.com', '648-63-2852', '2023-08-23', 65276, 43, 'Female', 'Business Development', 750),

(934, 'Alard', 'Clows', 'aclowsr@biglobe.ne.jp', '555-25-7477', '2025-06-02', 91279, 26, 'Male', 'Business Development', 750);

-- 1. Employee Count by Department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Business Development department has the highest employees.

-- 2.  Average Salary by Department

SELECT department, ROUND(AVG(salary),2) AS avg_salary
FROM employees
GROUP BY department;

-- R&D Department has the highest average salary

-- 3. Gender Distribution.

SELECT gender, COUNT(*) AS total_employees
FROM employees
GROUP BY gender;

-- The organization has equal gender representation with 5 male and 5 female employees.

-- This indicates balanced gender diversity in the workforce.

-- Such balance is a positive sign for inclusivity and equal opportunity.

-- It suggests the company is maintaining fair hiring practices without gender bias.

-- 4. Gender Distribution Among Managers



SELECT e.gender, COUNT(*)  as total_managers
FROM employees e
WHERE e.employee_id IN (
    SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL
)
GROUP BY gender;


-- The analysis highlights a gender imbalance in managerial roles, suggesting the need for improved diversity in leadership positions

-- 5. Employees with Salary < 50000

SELECT first_name, last_name , department,salary FROM employees
WHERE salary < 50000;

-- Moses from support department have salary less than 50000

-- 6. Employees with Salary > 100000
SELECT first_name, last_name , department,salary FROM employees
WHERE salary > 100000;


 
 -- 7. Salary Increment (Example)
 
UPDATE employees
SET salary = salary * 1.10
WHERE (first_name = 'Robin' AND last_name = 'MacMenamy')
   OR (first_name = 'Freeland' AND last_name = 'Spracklin');
   
   SELECT * FROM EMPLOYEES;
   