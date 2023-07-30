--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table

--TASK 2 - display first_name, last_name, department_id, salary from employees

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000

--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc

--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc

--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job ID starts with S


         -- whose job ID starts with S AND TOTAL 6 LETTER

-- TASK 8 - display country id and country name where country name ends with a

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i


------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/




--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table

-- TASK 10- 2  - order them based on city count in desc

-- TASK 10- 3 -  filter result where country id starts with C

-- TASK 10- 4 -  display country id if city count is bigger than 1

-- TASK 11 -1  How many employees is working for each department

-- TASK 11 -2  ignore null departments

-- TASK 11 -3  display department id where employees count is less than 5

------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 104

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table

-- TASK 14 -  display all information who is getting 11th highest salary

-- TASK 15 - Display employees first_name,last_name who is working in Marketing department


--- DDL / DML ---

    -- DQL --> DATA QUERY LANGUAGE  --> SELECT
    -- DML --> DATA MANIPULATION LANGUAGE
    -- DDL --> DATA DEFINITION LANGUAGE




----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name

-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department

-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee

-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department



----- SELF JOIN ---
-- Display all managers and their managers information

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.




