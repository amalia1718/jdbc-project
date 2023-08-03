---- PRACTICE 1 ----


--4. List all the different region_ids in countries table

-- IN ORDER TO GET THE UNIQUE VALUES WE ARE USNING DISTINCT

SELECT DISTINCT REGION_ID FROM COUNTRIES;

--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)


SELECT SALARY FROM  EMPLOYEES WHERE LAST_NAME='Grant' AND FIRST_NAME='Douglas';

--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive

SELECT * from DEPARTMENTS
 where
    DEPARTMENT_NAME ='IT'
    or DEPARTMENT_NAME='Public Relations'
    or DEPARTMENT_NAME='Sales'
    or DEPARTMENT_NAME='Executive';

-- second solution

SELECT * from DEPARTMENTS
where
    DEPARTMENT_NAME in  ('IT','Public Relations','Sales','Executive');

-- 16 . Display all unique job_id that ends with CLERK in employee table

SELECT DISTINCT  JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%CLERK';

-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?

SELECT  JOB_ID,COUNT(*) FROM EMPLOYEES WHERE SALARY>5000
GROUP BY JOB_ID;

-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

SELECT JOB_ID ,AVG(SALARY) FROM EMPLOYEES
              WHERE JOB_ID IN ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP')    --FIRST FILTER
GROUP BY JOB_ID;     --THEN GRUOP


SELECT JOB_ID,AVG(SALARY) FROM EMPLOYEES
GROUP BY JOB_ID --FIRST GRUOP
HAVING JOB_ID IN ('IT_PROG','SA_REP', 'FI_ACCOUNT', 'AD_VP'); --FILTER IT   -

-- 23. Display total salary for each department
-- except department_id 50,
-- and where total salary more than 30000

SELECT  DEPARTMENT_ID,sum(SALARY)from EMPLOYEES where DEPARTMENT_ID!=50
group by DEPARTMENT_ID
having sum(SALARY)>30000;


SELECT  DEPARTMENT_ID,sum(SALARY)from EMPLOYEES
group by DEPARTMENT_ID
having sum(SALARY)>30000 and DEPARTMENT_ID!=50;


--8.  Find the 3rd maximum salary
-- from the employees table
-- (do not include duplicates)


SELECT DISTINCT SALARY from EMPLOYEES order by SALARY DESC;

SELECT  MIN(SALARY)
FROM  (SELECT DISTINCT SALARY from EMPLOYEES order by SALARY DESC) --NEW TABLE WİTH DESC ORDER
WHERE ROWNUM<=15;

--Find the 3rd minumum salary
SELECT DISTINCT SALARY from EMPLOYEES order by SALARY ASC;
SELECT  max(salary) FROM (SELECT DISTINCT SALARY from EMPLOYEES order by SALARY ASC)
where ROWNUM<=5;

-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGIONS TABLE

SELECT COUNTRY_NAME,REGION_NAME from COUNTRIES C
INNER JOIN REGIONS R
on C.REGION_ID = R.REGION_ID;

-- HOW MANY COUNTRY WE HAVE FOR EACH REGION

SELECT count(*),REGION_NAME from COUNTRIES C
     INNER JOIN  REGIONS R
    on C.REGION_ID = R.REGION_ID
GROUP BY REGION_NAME;

-- DISPLAY REGIONS THEY HAVE MORE THAN 5 COUNTRIES

SELECT count(*),REGION_NAME from COUNTRIES C
INNER JOIN  REGIONS R
on C.REGION_ID = R.REGION_ID
GROUP BY REGION_NAME
having count(*)>5;


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY

SELECT  DEPARTMENT_NAME,CITY from DEPARTMENTS D
INNER JOIN LOCATIONS L
ON D.LOCATION_ID = L.LOCATION_ID;




