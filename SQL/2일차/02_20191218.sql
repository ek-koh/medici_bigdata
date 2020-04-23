# 집계함수: count(<field명>)
# 필드에 해당하는 데이터 개수를 출력한다.
# *가 들어가도 동일한 결과를 나타낸다.
SELECT COUNT(*)
FROM employees
WHERE emp_no = '10003'
;

SELECT COUNT(*) AS 사원수
FROM dept_emp
WHERE dept_no = 'd004'
;

# d002, d004가 있는 행의 개수를 출력해보자
SELECT COUNT(dept_no) AS  사원수
FROM dept_emp
WHERE dept_no IN ('d002', 'd004')
;


# group by : 부서나 그룹별로 데이터를 출력할 때 사용
# select <field명>, ....
# from   <table명>
# group by <~별로 사용할 field명>

# 입사년도 별로 사원의 수를 출력하는 쿼리문을 작성해보자.
SELECT DATE_FORMAT(hire_date, '%Y') AS 입사년도, COUNT(*)
FROM employees
GROUP BY DATE_FORMAT(hire_date, '%Y')
;


# 1999년 입사자를 월별로 몇명이 입사했는지 출력해보자.
SELECT DATE_FORMAT(hire_date, '%m월') AS '1999년 입사월', COUNT(*) AS 사원수
FROM employees
WHERE DATE_FORMAT(hire_date, '%Y') = '1999'
GROUP BY date_format(hire_date, '%m')
;


# 집계함수: AVG(<field명>)
SELECT *
FROM hr_employees
;

# 사원들의 연봉의 평균을 구해봅시다.
SELECT AVG(salary)
FROM hr_employees
;

# 영업이나 마케팅 업무를 하는 사원을 대상으로
# 직무별 평균급여를 계산해 봅시다.
# 직무: job_id
# 영업: SA~, 마케팅: MK~
SELECT job_id, AVG(salary)
FROM hr_employees
WHERE job_id LIKE 'SA%'
OR job_id LIKE 'MK%'
GROUP BY job_id
;

# 2000년 이후 입사자 중에서 재고 업무를 담당하는 사원들의 정보를 조회해 보세요.
# 재고업무: ST_MAN, ST_CLERK
SELECT *
FROM   hr_employees
WHERE  job_id IN ('ST_MAN', 'ST_CLERK')
AND    DATE_FORMAT(hire_date, '%Y') >= '2000'
;


# 1994년 6월부터 1998년 4월 기간 입사한 사원을 대상으로
# 부서별 인원수를 얻어보세요. 결과는 인원수가 많은 순서로 출력.
SELECT department_id AS '부서 번호', COUNT(*) AS 인원수
FROM hr_employees
WHERE DATE_FORMAT(hire_date, '%Y%m') BETWEEN '199406' AND '199804'
GROUP BY department_id
ORDER BY COUNT(*) DESC
;

# 급여가 5000$ 미만인 사원 중에서 직무가 'IT_PROG'인 사원들의 정보를 조회해보자.
SELECT *
FROM hr_employees
WHERE job_id = 'IT_PROG'
AND salary < 5000
;

# MOD(a,b) : a를 b로 나눈 나머지 값을 반환한다. b가 0이면, null을 반환한다.
SELECT MOD(11,2);
SELECT MOD(6,2);
SELECT MOD(2,0);

# 짝수해와 홀수해에 입사한 사원의 정보를 얻어보자.
# 결과
# 년도     |  입사자수
# 짝수년도 | 100
# 홀수년도 | 50
SELECT *
FROM hr_employees
WHERE MOD(DATE_FORMAT(hire_date, '%Y'),2) = 0
;

SELECT *
FROM hr_employees
WHERE MOD(DATE_FORMAT(hire_date, '%Y'),2) = 1
;

# 짝수, 홀수 결과 합치기
SELECT MOD(DATE_FORMAT(hire_date, '%Y'),2), COUNT(employee_id)
FROM hr_employees
WHERE MOD(DATE_FORMAT(hire_date, '%Y'),2) = 0
OR MOD(DATE_FORMAT(hire_date, '%Y'),2) = 1
GROUP BY MOD(DATE_FORMAT(hire_date, '%Y'),2)
;


# case문
# select에서 사용
# CASE <대상이 되는 필드 or 값>
#   WHEN <대상이 되는 값이 가질 값> THEN <내용을 작성>
#   WHEN <대상이 되는 값이 가질 값> THEN <내용을 작성>
# END as <표현하고자 하는 필드명을 적어준다.>

SELECT CASE MOD(DATE_FORMAT(hire_date, '%Y'),2)
			WHEN 0 THEN '짝수년도'
			WHEN 1 THEN '홀수년도'
		 END AS '년도',
		 MOD(DATE_FORMAT(hire_date, '%Y'),2),
		 COUNT(employee_id)
FROM   hr_employees
GROUP BY MOD(DATE_FORMAT(hire_date, '%Y'),2)
;


# 집계함수 : SUM(<field명>)
# 값을 합칠 때 사용함
SELECT SUM(salary)
FROM   hr_employees
;


# 1998년 이후에 입사한 사람들을 대상으로 직무별 급여의 합을 구하시오.
SELECT job_id AS 부서번호, SUM(salary) AS 급여합계
FROM hr_employees
WHERE DATE_FORMAT(hire_date, '%Y') >= '1998'
GROUP BY job_id
ORDER BY sum(salary) DESC 
;


# ROUND() 함수
# 숫자를 지정한 자리수로 반올림하여 변환하는 함수
# ROUND(123.42452342,2)
SELECT ROUND(123.42452342,2) AS value;

# 문자함수 중에 SUBSTR()/SUBSTRING()
# SUBSTR('밥먹으러가자밥먹자!!!',2,3);
# 문자열의 2번째부터 3개를 가져온다는 의미
SELECT SUBSTR('밥먹으러가자밥먹자!!!',2,3);
SELECT SUBSTRING('medici-001',7,3);


# 문자열을 붙이는 함수 CONCAT()
# 필드명을출력하거나 문자열을 출력할 때 붙여서 출력할 수 있고,
# 공백도 붙여서 출력할 수 있다.
# CONCAT(str1,' ',str2)
SELECT CONCAT('고',' ','은경')
SELECT CONCAT('점심','시간')

# 사원의 이름을 출력해보자.
SELECT CONCAT(first_name,' ',last_name)
FROM   hr_employees
WHERE  employee_id = 105
;


# SYSDATE() : 현재시간
# FLOOR() : 소숫점을 없애주는 함수(정수로 만들어주는 함수)
# YEAR('2019-12-18 13:07:07');
# MONTH('2019-12-18 13:07:07');
# DAY('2019-12-18 13:07:07');
# HOUR('2019-12-18 13:07:07');
# MINUTE('2019-12-18 13:07:07');
# SECOND('2019-12-18 13:07:07');
SELECT MINUTE(SYSDATE());


# DATEDIFF(maxDate1, smallDate2)
SELECT DATEDIFF('2020-12-18 13:07:07', '2019-12-18 13:07:07');

# TIMESTAMPDIFF(단위, smallDate1, maxDate2)
# 단위
# SECOND : 초
# MINUTE : 분
# HOUR : 시간
# DAY : 일
# MONTH : 월
# YEAR : 연
SELECT TIMESTAMPDIFF(YEAR, '2019-12-18 13:07:07', '2023-12-18 21:07:07')
SELECT SYSDATE()


# 현재 근무하는 사원의 재직기간을 나타내보시오.
SELECT employee_id, FLOOR(TIMESTAMPDIFF(MONTH, hire_date, SYSDATE())/12) AS years
FROM   hr_employees
;

SELECT employee_id, FLOOR(DATEDIFF(SYSDATE(),hire_date)/365) AS years
FROM   hr_employees
;

SELECT employee_id, FLOOR(TIMESTAMPDIFF(DAY, hire_date, SYSDATE())/365) AS years
FROM   hr_employees
;


SELECT *
FROM   hr_employees
WHERE  employee_id = 100
;


# TRUNCATE() 함수 : 보여줄 소숫점 자리수까지 보여주는 함수
# TRUNCATE(실수,2) : 소숫점 둘째자리까지 보여준다.
# TRUNCATE(실수,0) : 정수로 보여준다.

SELECT TRUNCATE(10.2312345,2);
SELECT TRUNCATE(10.2312345, 0);


# 1999년도에 입사한 사람들을 아래와 같이 출력해 봅시다.
# [결과]
# 상하반기 |  직무  | 입사자 수
# 상반기      | SA_REP | 10
# 하반기		  | IT_PROG | 20
SELECT CASE TRUNCATE(MONTH(hire_date)/7,0)
			WHEN 0 THEN '상반기'
			WHEN 1 THEN '하반기'
		 END AS '상하반기',
		 job_id AS 직무,
		 COUNT(employee_id) AS '사원수'
FROM   hr_employees
WHERE  YEAR(hire_date) = '1999'
GROUP BY CASE TRUNCATE(MONTH(hire_date)/7,0)
			WHEN 0 THEN '상반기'
			WHEN 1 THEN '하반기'
		 END,
		 job_id
;


# 같은 문제 혼자 해본 것
SELECT CASE FLOOR(MONTH(hire_date)/7)
		 	WHEN 0 THEN '상반기'
		 	WHEN 1 THEN '하반기'
		 END AS '상하반기',
		 job_id AS 직무,
		 COUNT(employee_id) AS 입사자수
FROM hr_employees
WHERE YEAR(hire_date) = '1999'
GROUP BY CASE FLOOR(MONTH(hire_date)/7)
		 WHEN 0 THEN '상반기'
		 WHEN 1 THEN '하반기'
		 END,
		 job_id
;


# TRIM() : 문자열에서 공백이나 특정 문자를 제거한 다음 값을 반환
SELECT TRIM(' test '); -- 바깥 공백 제거
SELECT TRIM(LEADING FROM ' test '); -- 왼쪽 공백 제거
SELECT TRIM(TRAILING FROM ' test '); -- 오른쪽 공백 제거
SELECT TRIM(TRAILING 'x' FROM 'xxxtestxxx'); -- x값 제거
SELECT TRIM(TRAILING 'xyz' FROM 'xxxtestxxyz'); -- 오른쪽 끝 x제거
SELECT TRIM(BOTH 'x' FROM 'xxxtestxxx'); -- 왼, 오른쪽 끝 x제거
LTRIM(str); --왼쪽 공백 제거
RTRIM(str); --오른쪽 공백 제거


# 사원의 직무가 'IT_PROG'이면 '프로그래머'로
# 사원의 직무가 'ST_MAN'이면 '매니저'로
# 'IT_PROG'나 'ST_MAN'이 아니면 '사원'으로 출력하도록 쿼리문을 작성해 보세요.
SELECT employee_id, job_id,
		 CASE job_id
		 		WHEN 'IT_PROG' THEN '프로그래머'
		 		WHEN 'ST_MAN' THEN '매니저'
		 		ELSE '사원'
		 END AS 직무
FROM hr_employees
;


# if 함수 사용해보기
# IF(조건, 참일 때 실행되는 곳, 거짓일 때 실행되는 곳)
# if와 case문의 차이점: 
# 복잡하게 처리해야 하는 부분은 case로 하고
# 단순하게 처리해야 하는 부분은 if()로 처리하는 것이 좋다.
SELECT *,
		 if(job_id = 'IT_PROG', '프로그래머',
				if(job_id = 'ST_MAN', '매니저', '사원')) 직무
FROM   hr_employees
;


# 사원 중에서 급여를 가장 많이 받는 사람의 급여는 얼마일까요?
# MAX(<field명>): field의 최댓값
# MIN(<field명>): field의 최솟값
SELECT MAX(salary)
FROM hr_employees
;

# 최고급여 대비 본인연봉을 확인해보자.
SELECT employee_id,
		 salary,
		 MAX(salary) OVER() AS 최고급여
FROM hr_employees
ORDER BY salary DESC
;

# 영업 직무를 가진 사원 중에서 가장 최근에 입사한 사원을 찾아보자.
# [결과 화면]
# 사원번호 | 사원이름 | 직무
SELECT employee_id, CONCAT(first_name, last_name), job_id, hire_date, max(hire_date) over()
FROM hr_employees
WHERE job_id LIKE 'SA%'
;

SELECT employee_id,
		 CONCAT(first_name, last_name),
		 hire_date,
		 job_id
FROM   hr_employees
WHERE  job_id LIKE 'SA%'
AND    hire_date = (SELECT MAX(hire_date) FROM hr_employees)
;


# rank() : 순위를 표현할 때 사용하는 함수
# 영업부서에 속하는 사원들을 대상으로 급여가 적은 순위를 나타내 보시오.
SELECT employee_id,
		 salary,
		 RANK() over(ORDER BY salary DESC) AS salary_ranking
FROM hr_employees
;

# DENSE_RANK() : 순서가 동률이라도 건너뛰지 않고 순서를 매겨준다.
SELECT employee_id,
		 salary,
		 DENSE_RANK() over(ORDER BY salary DESC) AS salary_ranking
FROM hr_employees
;

# 입사한지 3년 이상 되는 사원들의 연봉 상위 5명의 정보를 출력해주세요.
SELECT *
FROM  (SELECT *,
				 RANK() over(ORDER BY salary DESC) AS rank
		FROM   hr_employees
		WHERE  TIMESTAMPDIFF(MONTH, hire_date, SYSDATE()) >=36
		) AS emp
WHERE rank <= 5
;

# 현재 사원들 중에서 입사일이 현재시점과 가장 가까운 순으로 순위를 매겨주세요.
SELECT employee_id,
		 hire_date,
		 RANK() OVER(ORDER BY hire_date DESC)
FROM hr_employees
;