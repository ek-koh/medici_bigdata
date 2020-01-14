
# SQL이란
# Structured Query Language (구조화된 질의어) 
# 기본적인 쿼리문은 문자잉 끝나면 반드시 ';'를 붙여줘야 한다.

# 사용할 데이터베이스를 미리 지정해준다.
# 실행은 Ctrl + F9
USE employees;

# 기본적인 쿼리문을 사용해보자
SELECT < FIELD명>, < FIELD명>, ...
FROM < TABLE명>


# SELECT는 가져오라는 명령, *는 모든 것을 의미
SELECT *
FROM employees;

# 존재하는 테이블 목록 보기
SHOW TABLES;

# 사원 테이블에서 사원들의 이름만 가져와 보자.
SELECT first_name, last_name
FROM employees;

# 사원 테이블에서 이름이 'Elvis'인 사람의 정보를 가져와 보자.
# WHERE절
# WHERE 조건 : 조건에 만족하는 데이터만 가져온다.
SELECT *
FROM employees
WHERE first_name = 'Elvis'
;

# 사원 테이블에서 성이 'Simmel'인 사람의 정보를 가져와 보자.
SELECT *
FROM employees
WHERE last_name = 'Simmel'
;

# 사원 중에서 사번이 20000번 이하인 사람들의 정보를 출력해 보자.
# >=, >, <, <=, <>(같지 않다), !=(같지 않다) 사용 가능
SELECT *
FROM employees
WHERE emp_no <= 20000
;

# 사원 중에서 사번이 20000 이상이고, 20100 이하인 사람들의 이름과 성별을 출력해 보자.
# AND 연산자 : 조건을 추가할 때,
# 또는 A AND B : A와 B의 조건을 다 만족할 때
SELECT emp_no, first_name, gender
FROM employees
WHERE emp_no >= 20000
AND emp_no <= 20100
;

# <FIELD명> BETWEEN A AND B
# A 이상 B 이하인 데이터를 가져오는 방법
SELECT emp_no, first_name, gender
FROM employees
WHERE emp_no BETWEEN 20000 AND 20100
;

# 사원테이블에서 14000을 초과하고 15000보다 작은 사원의 이름을 가져와 보자.
SELECT emp_no, first_name
FROM employees
WHERE emp_no > 14000 AND emp_no < 15000
;


# 사원 중에 입사 일자가 '19850101' ~ '19860101'인 사람들의 정보를 출력해 보자.
# 날짜를 처리하는 함수를 사용해야 한다.
# DATE_FORMAT(<field명>, '내가 보고자 하는 날짜 형식')
# DATE_FORMAT(<filed명>, '%Y') : 연도를 출력
# DATE_FORMAT(<filed명>, '%M') : 월을 출력
# DATE_FORMAT(<filed명>, '%D') : 일자를 출력
# DATE_FORMAT(<filed명>, '%Y%M%D') : 20191217
# DATE_FORMAT(<filed명>, '%Y-%M-%D') : 2019-12-17
-- YMD쓰면 jan이런 거 나올 수 있고 Ymd쓰면 숫자로만 나옴
# DATE_FORMAT(<filed명>, '%Y%M%D %H-%i-%p') : 20191217 14-12 pm (24시간 형태)
# DATE_FORMAT(<filed명>, '%Y%M%D %h-%i-%p') : 20191217 14-12 pm (12시간 형태)

SELECT DATE_FORMAT(hire_date, '%Y%M%D')
FROM   employees
;

SELECT *
FROM  employees
WHERE DATE_FORMAT(hire_date, '%Y%M%D') >= '19850101'
AND DATE_FORMAT(hire_date, '%Y%M%D') <= '19860101'
;

SELECT *
FROM employees
WHERE DATE_FORMAT(hire_date,'%Y%M%D') BETWEEN '1985-01-01' AND '1986-01-01'
;

SELECT *
FROM employees
-- WHERE hire_date BETWEEN '1985-01-01' AND '1986-01-01'
;


# 나온 결과를 정렬을 해서 확인해 보자.
# 사원 중에 입사 일자가 '19850101' ~ '19860101'인 사람들의 정보를 출력해 보자.
# 최근에 입사한 입사자가 맨 위로 오도록 출력한다.
# ORDER BY <field명> ASC(1->10. 디폴트) or DESC(10->1)

SELECT *
FROM   employees
WHERE DATE_FORMAT(hire_date,'%Y%m%d') BETWEEN '19850101' AND '19860101'
ORDER BY hire_date DESC
;


# 입사년도가 1990년인 사원의 정보를 출력해 보자.
SELECT *
FROM employees
WHERE DATE_FORMAT(hire_date, '%Y') = '1990'
;


# 사원들 중에서 성이 'Genin'이거나 'Facello'인 사원의 정보를 출력해 보자.
# OR 연산자
# 조건 or 조건 : 둘 중에 하나만 만족해도 출력되는 데이터
SELECT *
FROM employees
WHERE last_name = 'Genin' OR last_name = 'Facello'
;

# IN 연산자를 사용해보자.
# OR와 동일한 결과를 나타낸다.
# <field명> IN ('A값'B값')
# A값 또는 B값을 만족하는 데이터를 가져온다.
SELECT *
FROM employees
WHERE last_name IN ('Genin', 'Facello')
;

# Alias(별칭)
# <field명> as 사용하고 싶은 이름
# <field명> 사용하고 싶은 이름
# <field명> 이름에 공백이 있을 경우에는 ''로 묶어준다.
SELECT last_name AS '이 름', first_name AS 성
FROM employees
WHERE last_name IN ('Genin', 'Facello')
;


SELECT hire_date AS 입사년도
FROM employees
WHERE DATE_FORMAT(hire_date, '%Y%m%d') BETWEEN '19850101' AND '19860101'
ORDER BY hire_date
;

# table에 Alias 적용하기
SELECT emp.hire_date
FROM employees emp
WHERE DATE_FORMAT(emp.hire_date, '%Y%m%d') BETWEEN '19850101' AND '19860101'
ORDER BY emp.hire_date
;

# 사원 중에 이름이 's'로 시작하는 사원의 정보를 출력하라.
# LIKE 연산자
# <field명> LIKE 's' : s를 포함하는 데이터
# <field명> LIKE 's%' : s로 시작하는 데이터
# <field명> LIKE '%s' : s로 끝나는 데이터
# <field명> LIKE '%s%' : s를 중간에 포함하는 데이터
# <field명> LIKE '__s' : 3글자인데 2글자를 모르면 _로 채우고 조회함
# wild card : %
SELECT *
FROM employees
WHERE first_name LIKE 's%'
;

SELECT *
FROM employees
WHERE first_name LIKE 'staff___'
;

# 사원 중에 직무가 'Engineer'와 'Senior Engineer'인 사원의 사번을 출력해 보자.
SELECT *
FROM titles
WHERE title IN ('Engineer', 'Senior Engineer')
;


# 사원 중에서 직무가 'Engineer'로 끝나는 사람과
# 직무가 'Staff'로 끝나는 사람의 사번을 출력해 주세요.
SELECT emp_no, title
FROM titles
WHERE title LIKE '%Engineer'
OR title LIKE '%Staff'
;


# NULL : 값이 없다.
# <field명> IS NULL : 값이 없을 경우
# <field명> IS NOT NULL : 값이 NULL이 아닐 경우
# 사원 중에서 salary가 NULL이 아닌 사원의 정보를 가져와 보자.
SELECT *
FROM salaries
WHERE salary IS NULL
;

SELECT *
FROM salaries
WHERE salary IS not NULL
;

# 사원 중에서 직무가 'Development'이거나 'Sales'인 사람들 중에서 
# 1992년 01월 01일 이후에 부서배치가 된 사람의 사번을 구해봅시다.
SELECT *
FROM dept_emp
WHERE dept_no IN ('d005', 'd007')
AND DATE_FORMAT(from_date, '%Y%m%d') >= '19920101'
AND DATE_FORMAT(to_date, '%Y%m%d') = '99990101'
ORDER BY from_date
;

SELECT 1+1;
