-- 1.	사원 테이블에서 각 사원에 급여(SAL)가 높은 순서대로 상위 5명을 아래 예제처럼 출력하세요
SELECT *, rank() over(ORDER BY sal desc) AS rownum
FROM   emp
ORDER BY sal DESC
LIMIT 5
;

-- 2.	사원 테이블에서 각 사원에 급여(SAL)가
-- 높은 순서대로 순위를 부여 했을 때 6등~10등인 사람을 순위대로 아래 예제처럼 출력하세요.
SELECT *, row_number() over(ORDER BY sal desc) AS rn
FROM   emp
ORDER BY sal DESC
LIMIT 5, 5
;

-- 3.	SALGRADE 테이블 데이터 세로 정보를 가로로 아래 예제처럼 출력하세요.

-- 5.	부서 테이블에서 DNAME 컬럼의 길이가 6자리 이상이면은 5자리까지 데이터만 보여주고
-- ‘..’ 뒤에 붙여준다. 아래 예제처럼 출력하세요
SELECT dname, concat(SUBSTR(dname,1,5),'...') AS data
FROM   dept
;

-- 6.	사원 테이블에서 고용일자(HIREDATE)의 해당 년월의 마지막 날짜(HIREDATE_MONTH_LASTDAY)를 구하고,
-- 고용일자로 부터 2006/08/05일까지 근무한 일수(WORK_DAY)를 아래처럼 출력하세요.
SELECT ename,
		 hiredate,
		 LAST_DAY(hiredate) AS hiredate_month_lastday,
		 DATEDIFF('2006-08-05',hiredate) AS work_day
FROM   emp
;
--7.	6번 예제에서 구한 각 사원에 근무일(WORK_DAY)이 가장 높은 사람을 한 명을 아래 예제처럼 출력하세요
SELECT empno,
		 hiredate,
		 MAX(DATEDIFF('2006-08-05',hiredate)) AS work_day
FROM   emp
;

--8.	사원 테이블에서 급여(SAL) 값을 누계(SAL_CUMULATIVE) 값으로
-- 사원번호(EMPNO) 오름차순 정렬 순서로 아래 예제처럼 출력하세요.
SELECT empno, ename, sal, sum(sal) over(order by empno) 누계
FROM   emp
ORDER BY empno
;



-- 9.	사원 테이블에서 직업이 ‘SALESMAN’ 사원 중에 급여(SAL) 낮은 순서대로 순위(RANK)를 아래 예제처럼 출력하세요
SELECT job,
		 empno,
		 ename,
		 sal,
		 row_number() over(order by sal) AS rank
FROM   emp
WHERE  job = 'SALESMAN'
;


--10.	사원 테이블에서 직업이 ‘SALESMAN’ 사원 중에 급여(SAL) 낮은 순서대로 순위(RANK)를 아래 예제처럼 출력하세요
SELECT job,
		 empno,
		 ename,
		 sal,
		 rank() over(order by sal) AS rank
FROM   emp
WHERE  job = 'SALESMAN'
;

-- 11.	사원 테이블에서 직업이 ‘SALESMAN’ 사원 중에 급여(SAL) 낮은 순서대로 순위(RANK)를 아래 예제처럼 출력하세요
SELECT job,
		 empno,
		 ename,
		 sal,
		 dense_rank() over(order by sal) AS rank
FROM   emp
WHERE  job = 'SALESMAN'
;
SELECT * FROM emp;
--13.	사원(EMP이름)테이블에서 직업(JOB)이 ‘SALESMAN’ 인 사원 급여(SAL)에 400 더하는 수정(UPDATE) 구문을 구하세요
UPDATE emp SET sal = sal + 400 WHERE job = 'SALESMAN';
COMMIT;

-- 14.	사원(EMP이름)테이블에서 급여(SAL)가 사원 평균급여 보다 높은 사원을 대상으로
-- 고용일자(HIREDATE)를 1년 더하는 수정(UPDATE) 구문을 구하세요
UPDATE emp
SET DATE_FORMAT(hiredate, "%Y") = DATE_FORMAT(hiredate, "%Y") + '00010000'
WHERE sal > (SELECT AVG(sal) FROM emp);
COMMIT;


SELECT *
FROM   emp
WHERE  sal > (SELECT AVG(sal) FROM emp)
;


--12.	EMP테이블을 백업 하기 위하여(복제하기 위하여) 한 sql문장으로 데이터를 EMP_BAK TABLE을 생성하여 넣는 문장을 작성하시오
--○	(테이블 생성 및 INSERT가 한 문장으로 수행 되어야 합니다.)
CREATE emp_bak(
INSERT * FROM emp
)ENGINE=INNODB;
COMMIT;

