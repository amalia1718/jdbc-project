-- IDEs for database conn
    -- Intellij Ultimate
    -- SQL Developer
    -- DBeaver
    -- etc

-- URL --> jdbc:oracle:thin:@52.91.163.234:1521:XE
--   username : hr
--   password : hr


-- BACKEND -- BUSINEES LOGIC
/**

  public static Product getProducts(String name){

    // getting data from Database
    // SELECT * FROM PRODUCTS
       WHERE NAME='%java book%';

    // store all data in a place
    List<Product> products=new Product();

    return products;


  }

 */


select * from employees;


--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
            SELECT  DEPARTMENT_NAME FROM DEPARTMENTS;

            SeLeCT department_name fRoM DEPARTMENTS;
            -- SQL COMMANDS are case insensitive
            -- TABLE and COLUMN names are depending database --> HR it is case insensitive
            -- WHERE FIRSTNAME='' --> '' is case sensitive

--TASK 2 - display first_name, last_name, department_id, salary from employees
            SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
            SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
            WHERE SALARY>9000;


--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc

            -- OPT 1
            SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
            WHERE SALARY>= 9000 AND SALARY<=15000
            ORDER BY SALARY ; -- ASC is DEFAULT OPTION
            --ORDER BY 4;

            -- USING COLUMN NAME IS BEST PRACTICE

            -- OPT 2
            SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
            WHERE SALARY BETWEEN 9000 AND 15000 --> BETWEEN LOWER AND UPPER (BOUNDRIES ARE INCLUDED)
            ORDER BY SALARY ;

--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc

            SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
            WHERE FIRST_NAME='Peter' AND SALARY>5000
            ORDER BY SALARY DESC ;
            -- 'Peter' needs be case sensitive

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc

            -- OPT 1
            SELECT COUNTRY_ID,COUNTRY_NAME,REGION_ID FROM COUNTRIES
            WHERE REGION_ID=2 OR REGION_ID=4
            ORDER BY REGION_ID DESC,COUNTRY_NAME ASC;

            -- OPT 2
            SELECT COUNTRY_ID,COUNTRY_NAME,REGION_ID FROM COUNTRIES
            WHERE REGION_ID IN (2,4)
            ORDER BY REGION_ID DESC,COUNTRY_NAME ASC;

--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job ID starts with S

            SELECT FIRST_NAME||' '||LAST_NAME as FULLNAME,SALARY*12 as ANNUALSALARY,JOB_ID
            FROM EMPLOYEES
            WHERE JOB_ID LIKE 'S%';

            -- % --> REFERS 0 or more letter
            -- - --> REFERS ONLY ONE LETTER
            -- CONTAINS --> '%S%'

         -- whose job ID starts with S AND TOTAL 6 LETTER
            SELECT FIRST_NAME||' '||LAST_NAME as FULLNAME,SALARY*12 as ANNUALSALARY,JOB_ID
            FROM EMPLOYEES
            WHERE JOB_ID LIKE 'S_____';



-- TASK 8 - display country id and country name where country name ends with a

            SELECT COUNTRY_ID,COUNTRY_NAME
            FROM COUNTRIES
            WHERE COUNTRY_NAME LIKE '%a';


-- IQ --> GET ME EMPLOYEES WHERE EMPLOYEE IDs are EVEN NUMBER
            SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME
            FROM EMPLOYEES
            WHERE MOD(EMPLOYEE_ID,2)=0;

            -- EMPLOYEEID --> DIVIDED    --> 100  --> 101
            -- 2          --> DIVISIOR   -->  2   --> 2
                          --> REMAINING  -->  0   --> 1

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
            SELECT COUNTRY_ID,COUNTRY_NAME
            FROM COUNTRIES
            WHERE COUNTRY_NAME LIKE '__i%a';



------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary

*/

    SELECT FIRST_NAME,SALARY,LOWER(SUBSTR(FIRST_NAME,-3)) FROM EMPLOYEES
    WHERE SALARY>3000
    ORDER BY LOWER(SUBSTR(FIRST_NAME,-3)) ASC,SALARY DESC;


    -- Steven ---> SUBSTR(FIRST_NAME,-3) --> ven
    -- Neena  ---> SUBSTR(FIRST_NAME,-3) --> ena





--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  How many city we have in each country from locations table
        SELECT * FROM LOCATIONS;

        SELECT COUNTRY_ID,COUNT(*) FROM LOCATIONS
        GROUP BY  COUNTRY_ID;


        SELECT COUNTRY_ID,COUNT(CITY) FROM LOCATIONS
        GROUP BY  COUNTRY_ID;


        -- COUNT(*) VS COUNT(COLUMN NAME)
        SELECT FIRST_NAME,DEPARTMENT_ID FROM EMPLOYEES;

        SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES;
        -- IT WILL IGNORE NULL VALUES --106

        SELECT COUNT(*) FROM EMPLOYEES;
        -- IT COUNT ROW --> 107


-- TASK 10- 2  - order them based on city count in desc

        SELECT COUNTRY_ID,COUNT(*) AS CITY_COUNT FROM LOCATIONS
        GROUP BY  COUNTRY_ID
        ORDER BY  CITY_COUNT DESC;

-- TASK 10- 3 -  filter result where country id starts with C
        SELECT COUNTRY_ID,CITY
        FROM LOCATIONS;
        -- WHERE
        SELECT COUNTRY_ID,COUNT(*) AS CITY_COUNT
        FROM LOCATIONS
        WHERE COUNTRY_ID LIKE 'C%'
        GROUP BY  COUNTRY_ID
        ORDER BY  CITY_COUNT DESC;

        -- HAVING - BAD PRACTICE
        SELECT COUNTRY_ID,COUNT(*) AS CITY_COUNT
        FROM LOCATIONS
        GROUP BY  COUNTRY_ID
        HAVING COUNTRY_ID LIKE 'C%'
        ORDER BY  CITY_COUNT DESC;



-- TASK 10- 4 -  display country id if city count is bigger than 1
        SELECT COUNTRY_ID,COUNT(*) AS CITY_COUNT
        FROM LOCATIONS --MIGHT BE  JOINS  TOO
        GROUP BY  COUNTRY_ID
        HAVING COUNT(*)>1
        ORDER BY  CITY_COUNT DESC;


-- TASK 11 -1  How many employees is working for each department

        SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT
        FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
        SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID IS NOT NULL
        GROUP BY DEPARTMENT_ID;




-- TASK 11 -3  display department id where employees count is less than 5

        SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT
        FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID
        HAVING COUNT(*)<5;

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




