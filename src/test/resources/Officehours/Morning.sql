---- PRACTICE 1 ----


--4. List all the different region_ids in countries table
        SELECT DISTINCT REGION_ID FROM COUNTRIES;

    -- GET ME ALL DIFFERENT FIRSTNAME  FROM EMPLOYEES TABLE
        SELECT DISTINCT FIRST_NAME FROM EMPLOYEES; --91

        SELECT DISTINCT FIRST_NAME,LAST_NAME FROM EMPLOYEES; --107


--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
        SELECT SALARY FROM EMPLOYEES
        WHERE FIRST_NAME='Douglas' AND LAST_NAME='Grant';


--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive

        --> OPT 1
        SELECT * FROM DEPARTMENTS
        WHERE DEPARTMENT_NAME='IT' OR DEPARTMENT_NAME='Public Relations' OR DEPARTMENT_NAME='Sales' OR DEPARTMENT_NAME='Executive';

        --> OPT 2
        SELECT * FROM DEPARTMENTS
        WHERE DEPARTMENT_NAME IN ('IT','Public Relations','Sales','Executive');

        --> GET ME ALL DEPARTMENT NAMES EXCEPT FOLLOWINGS --> 'IT','Public Relations','Sales','Executive'
        SELECT * FROM DEPARTMENTS
        WHERE DEPARTMENT_NAME NOT IN ('IT','Public Relations','Sales','Executive');


-- 16 . Display all unique job_id that ends with CLERK in employee table
        SELECT  DISTINCT JOB_ID FROM EMPLOYEES
        WHERE JOB_ID LIKE '%CLERK';
        /*
            - % --> 0 or more letter
            - _ --> only single letter

         */
        -- CAN WE RETRIEVE SAME DATA BY USING JOBS TABLE
        SELECT JOB_ID FROM JOBS
        WHERE JOB_ID LIKE '%CLERK';
        -- SINCE JOB_ID PK for JOBS TABLE WE DON'T NEED TO USE DISTINCT

-- 20-4 How many employees are  in each group that have minimum
-- salary of 5000 ? (Group based on job_id )
        SELECT JOB_ID,COUNT(*) FROM EMPLOYEES
        WHERE SALARY>5000
        GROUP BY JOB_ID;

        SElECT JOB_ID,SALARY FROM EMPLOYEES
        WHERE SALARY>5000;

-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP
        -- WHERE
        SELECT JOB_ID,AVG(SALARY) FROM EMPLOYEES
        WHERE JOB_ID IN ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP')
        GROUP BY JOB_ID;

        -- HAVING --> INEFFICIENT
        SELECT JOB_ID,AVG(SALARY) FROM EMPLOYEES
        GROUP BY JOB_ID
        HAVING JOB_ID IN ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP');

        -- DISPLAY JOB IDS WHERE THEIR AVG SALARY IS LESS THAN 10000
        SELECT JOB_ID,AVG(SALARY) FROM EMPLOYEES
        WHERE JOB_ID IN ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP')
        GROUP BY JOB_ID
        HAVING AVG(SALARY)<10000;

        SELECT * FROM EMPLOYEES;


-- 23. Display total salary for each department except department_id 50, and  where total salary more than 30000
        SELECT DEPARTMENT_ID,SUM(SALARY) FROM EMPLOYEES
        WHERE DEPARTMENT_ID<>50
        GROUP BY DEPARTMENT_ID
        HAVING SUM(SALARY)>30000;

        --> <> and != will refer NOT EQUAL

        -- ORDER RESULT BASED ON TOTAL SALARY IN DESC



---- PRACTICE 2 ----
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)


--12. Find the 3rd minimum salary from the employees table (do not include duplicates)

---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY


-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40


-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY


-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME


-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT


----- SELF JOIN ---
-- Display all managers and their managers information

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
