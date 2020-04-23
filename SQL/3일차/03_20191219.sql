-- HAVING절 
--  group by로 묶어서 나온 결과에 대한 제한을 두고자 할 때 사용한다.

-- 직무별 평균 급여를 출력하는데, 평균 급여가 10,000$이상인 경우를
-- 제외해 보자.


SELECT   job_id
         ,AVG(salary) AS salary
FROM     hr_employees
GROUP BY job_id
HAVING   AVG(salary) <= 10000
;

-- 1997년에 입사한 사람들의 수를 분기별로 몇명인지 출력하시오.
-- [결과화면]
--  분기  | 사원수 
--  1분기 |  20
--  2분기 |  30
--  ...

SELECT COUNT(*)
FROM   hr_employees
WHERE  YEAR(hire_date) = '1997'
;

-- 1분기 2분기 3분기 4분기 
-- 123   456   789   101112
-- 001   112   223   334
-- 111   222   333   444
-- ceil(<field명>) : 올림, 소수점이하에 값이 있으면 값을 올려주는 함수


SELECT CEIL(0.2343242);
SELECT CEIL(2/3);


SELECT   CASE ceil(MONTH(hire_date)/3)
          WHEN 1 THEN '1분기'
          WHEN 2 THEN '2분기'
          WHEN 3 THEN '3분기'
          WHEN 4 THEN '4분기'
         END AS '분기',
         COUNT(employee_id) AS '사원수'
FROM     hr_employees
WHERE    YEAR(hire_date) = '1997'
GROUP BY ceil(MONTH(hire_date)/3)
;
-- QUARTER() 똑같은 결과물 출력해보기
# 혼자 해봤는데 잘 됨
SELECT   QUARTER(hire_date),
         COUNT(employee_id) AS '사원수'
FROM     hr_employees
WHERE    YEAR(hire_date) = '1997'
GROUP BY ceil(MONTH(hire_date)/3)

-- JOIN : 두 개이상의 테이블에서 조건을 만족하는 데이터를 추출하는 방법
-- INNER JOIN : 해당하는 조건에 만족하는 데이터만 추출하는 방법
-- OUTER JOIN : 해당하는 조건에 만족하지 않는 데이터까지도 추출하는 방법

-- 사원번호가 100번인 사원의 부서를 출력하시오.

SELECT *
FROM   hr_employees
WHERE  employee_id = 100
;

SELECT * FROM hr_departments;

-- inner join 명시적
SELECT  emp.EMPLOYEE_ID,
        emp.LAST_NAME,
        dept.DEPARTMENT_NAME,
        emp.DEPARTMENT_ID
FROM    hr_employees emp INNER JOIN hr_departments dept
ON      emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
WHERE   emp.EMPLOYEE_ID = 100;

-- inner join 암시적
SELECT  emp.EMPLOYEE_ID,
        emp.LAST_NAME,
        dept.DEPARTMENT_NAME,
        emp.DEPARTMENT_ID
FROM    hr_employees emp, hr_departments dept
WHERE   emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
AND     emp.EMPLOYEE_ID = 100;


SELECT * FROM hr_employees;
-- 매니저 ID가 있는 사원의 정보를 출력해주세요. 
SELECT *
FROM   hr_employees emp, hr_departments dept
WHERE  emp.MANAGER_ID = dept.MANAGER_ID
;

SELECT * FROM hr_departments;

SELECT *
FROM   hr_employees
WHERE  manager_id IS NOT NULL
;

-- outer join 
-- 매니저 ID가 없는 사원의 정보까지도 가져와 봅시다.
SELECT emp.EMPLOYEE_ID,
       emp.LAST_NAME,
       dept.MANAGER_ID,
       dept.DEPARTMENT_NAME
FROM   hr_employees emp LEFT OUTER JOIN hr_departments dept
ON     emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
;

SELECT emp.EMPLOYEE_ID,
       emp.LAST_NAME,
       dept.MANAGER_ID,
       dept.DEPARTMENT_NAME
FROM   hr_departments dept RIGHT OUTER JOIN hr_employees emp
ON     emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
;

SELECT emp.EMPLOYEE_ID,
       emp.LAST_NAME,
       dept.MANAGER_ID,
       dept.DEPARTMENT_NAME
FROM   hr_departments dept LEFT OUTER JOIN hr_employees emp
ON     emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
;

-- King이라는 사원이 소속된 부서의 위치 정보를 얻어보자.
-- [결과화면]
-- 사원번호 | 부서이름 | 도시
SELECT * FROM hr_locations;
SELECT * FROM hr_departments;
SELECT * FROM hr_employees;


SELECT emp.EMPLOYEE_ID,
       dept.DEPARTMENT_NAME,
       loc.CITY
FROM   hr_employees emp, hr_departments dept, hr_locations loc
WHERE  emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
AND    dept.LOCATION_ID = loc.LOCATION_ID
AND    emp.last_name = 'King'
;

-- 표준 , join, ansi sql
SELECT emp.EMPLOYEE_ID,
       dept.DEPARTMENT_NAME,
       loc.CITY
FROM   hr_employees emp JOIN hr_departments dept
ON     emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
JOIN   hr_locations loc
ON     dept.LOCATION_ID = loc.LOCATION_ID
WHERE  emp.last_name = 'King'
;

-- 도시별로 근무하는 사원의 수가 5명 이상인 경우를 얻어보자. 
-- 인원이 많은 도시 순으로 정렬해서 나타내 보자.

SELECT   loc.CITY AS '도시이름', 
         COUNT(emp.employee_id) AS '사원수'
FROM     hr_locations loc, hr_employees emp, hr_departments dept
WHERE    emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
AND      loc.LOCATION_ID = dept.LOCATION_ID
GROUP BY loc.CITY
HAVING   사원수 >= 5
ORDER BY 사원수 DESC
;
--ORDER BY COUNT(emp.employee_id) DESC
--HAVING   COUNT(emp.employee_id) >= 5; 

-- 영업관련 직무를 가진 사원들의 정보를 얻어보자.
-- 부서 발령을 받지 않는 사원도 포함해서 나타내 보자.
-- ( outer join ) 
-- 영업관련 직무 : job_id = SA_REP, SA_MAN
-- [결과]
-- 사원번호 | 이름(last_name) | 부서이름

SELECT  emp.EMPLOYEE_ID AS 사원번호,
        emp.LAST_NAME AS 이름,
        dept.DEPARTMENT_NAME AS 부서이름
FROM    hr_employees emp LEFT OUTER JOIN hr_departments dept
ON      emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
WHERE   emp.JOB_ID IN ('SA_REP','SA_MAN')
;

-- 하위질의 : subquery 
-- 하나의 SQL문에 두개나 그 이상의 SELECT문이 포함되는 경우 

-- 2000년 이후 입사한 사원 중 대표이사를 제외한 
-- 현재 사원들의 평균급여보다 많이 받는 사원들을 얻어보세요.
-- 대표이사 job_id = 'AD_PRES'

# 혼자 해본 것: 잘 돌아감
SELECT *
FROM   hr_employees
WHERE  salary > (SELECT AVG(salary)
					  FROM hr_employees
					  WHERE job_id <> 'AD_PRES'
					  AND YEAR(hire_date) >= 2000)
AND YEAR(hire_date) >= 2000
ORDER BY salary
;

# 원래 강의안
SELECT * 
FROM   hr_employees
WHERE  salary > (SELECT AVG(salary)
      FROM   hr_employees
      WHERE  job_id <> 'AD_PRES'
      AND    YEAR(hire_date) >= 2000
      )
AND    YEAR(hire_date) >= 2000
AND    job_id <> 'AD_PRES'
ORDER BY salary ASC

;
SELECT AVG(salary)
FROM   hr_employees
WHERE  job_id <> 'AD_PRES'
AND    YEAR(hire_date) >= 2000
      
-- 1999년 상반기에 입사한 사원의 수를 부서별로 출력해보자. 
-- 단, 부서가 없는 사원은 제외한다.( inner join ) 

-- 1 

SELECT   department_id,
         hire_date, 
         COUNT(employee_id) AS 사원수
FROM     hr_employees
WHERE    YEAR(hire_date) = 1999
GROUP BY department_id  
;

SELECT   department_id,
         hire_date, 
         COUNT(employee_id) AS 사원수
FROM     hr_employees
WHERE    YEAR(hire_date) = 1999
GROUP BY department_id;

--2
SELECT   dept.department_name,
         COUNT(emp.employee_id) AS 사원수,
         emp.hire_date
FROM     hr_employees emp, hr_departments dept 
WHERE    emp.DEPARTMENT_ID = dept.DEPARTMENT_ID 
AND      YEAR(emp.hire_date) = 1999
AND      MONTH(hire_date) < 7
GROUP BY dept.department_name  

;
-- 123456 789 10 11 12
-- MONTH(hire_date) < 7 
-- 000000 111111

-- 'Seattle'에 근무하는 사원의 정보를 출력해보자.
-- 

SELECT *
FROM   hr_locations loc, hr_departments dept, hr_employees emp
WHERE  emp.DEPARTMENT_ID = dept.DEPARTMENT_ID
AND    dept.LOCATION_ID = loc.LOCATION_ID
AND    loc.CITY = 'Seattle'

-- 'IT_PROG'인 직무를 가진 사원들의 평균급여보다 
--  많이 받는 사원의 정보를 출력해 보자.

SELECT * 
FROM   hr_employees
WHERE  salary >(SELECT AVG(salary) AS salary
     FROM hr_employees
     WHERE job_id = 'IT_PROG')
AND    job_id != 'IT_PROG'
ORDER BY salary ASC
;