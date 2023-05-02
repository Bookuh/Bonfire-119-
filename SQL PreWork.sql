CREATE TABLE employees (
	employee_id int,
	first_name VARCHAR(50),
	last_name VARCHAR(50), 
	hourly_pay DECIMAL(5, 2),
	hire_date DATE

);
INSERT INTO employees (first_name, last_name)
VALUES (james, smith); 

SELECT * FROM employees;


