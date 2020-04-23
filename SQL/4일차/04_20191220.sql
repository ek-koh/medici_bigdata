# 1. 사원 테이블에서 사원번호가 7369, 7698인 사원의 사번과 이름을 출력해 보세요.
SELECT empno, ename
FROM   emp
WHERE empno IN (7369, 7698)
;

# 2. 사원 테이블에서 사원번호가 7369, 7698이 아닌 사원의 사번과 이름을 출력해 보세요.
SELECT empno, ename
FROM   emp
WHERE empno <> 7369
AND empno <> 7698
ORDER BY empno DESC 
;

# 3. 사원 테이블에서 급여(sal)가 3000에서 5000사이인 사원의 정보를 출력해 보세요.
SELECT *
FROM emp
WHERE sal BETWEEN 3000 AND 5000
ORDER BY sal DESC 
;


# 4. 사원 테이블에서 고용일자(hiredate)가
# 1981년 12월 1일 이후 고용된 사원 정보를 모두 출력해 보세요.
SELECT *
FROM emp
WHERE DATE_FORMAT(hiredate, '%Y%m%s') >= '19811201'
;


# 검증 #### 다시보자
SELECT *
FROM emp
ORDER BY hiredate DESC
;



# 5. 사원 테이블에서 직업(job)이 SALESMAN인 사원중에 사원번호의 최댓값을 출력해 보세요.
SELECT MAX(empno)
FROM emp
WHERE job = 'SALESMAN'
;

# 검증 쿼리
SELECT *
FROM emp
WHERE job = 'SALESMAN'
ORDER BY empno DESC 
;

--6.	 사원 테이블에서 각 사원에 부서명을 아래 예제처럼 출력하세요
--     (사원, 부서 테이블 조인 시 부서가 없는 사원은 출력 안함)
--     ex) 정렬은 부서명(DNAME), 사원명(ENAME) 오름차순
-- [결과화면]
--   | dname      | empno   |   ename |
--   | ACCOUNTING | 7782    |   CLARK |
--   | ACCOUNTING | 7934    |   MILER |
--   | RESEARCH   | 7111    |   FORD  |
--   | RESEARCH   | 7222    |   JONES |
--   | ACCOUNTING | 7322    |   ALLEN |
--   | ACCOUNTING | 7530    |   BLAKE |
SELECT d.dname AS dname,
		 e.empno AS empno,
		 e.ename AS ename
FROM 	 emp e, dept d
WHERE  e.deptno = d.deptno
ORDER BY d.dname, e.ename
;

-- 7.	사원 테이블에서 각 사원에 부서명을 아래 예제처럼 출력하세요
--    (사원, 부서 테이블 조인 시 부서가 없는 사원도 출력)
--    ex) 정렬은 부서명(DNAME), 사원명(ENAME) 오름차순
-- [결과화면]
--   | dname      | empno   |   ename |
--   | ACCOUNTING | 7782    |   CLARK |
--   | ACCOUNTING | 7934    |   MILER |
--   | RESEARCH   | 7111    |   FORD  |
--   | RESEARCH   | 7222    |   JONES |
--   |            | 7322    |   ALLEN |
--   |            | 7530    |   BLAKE |
SELECT d.dname AS dname,
		 e.empno AS empno,
		 e.ename AS ename
FROM 	 emp e LEFT OUTER JOIN dept d
ON     e.deptno = d.deptno
ORDER BY d.dname, e.ename
;

-- 8.	부서 위치가 'DALLAS', 'CHICAGO' 곳에 근무하는 사원 정보 아래
--    예제처럼 출력하세요
--    ex) 정렬은 부서위치(LOC) 내림차순, 사원명(ENAME) 오름차순
-- [결과화면]
--   | loc     | empno   |   ename |
--   | DALLAS     | 7782    |   FORD  |
--   | DALLAS     | 7934    |   JONES |
--   | DALLAS     | 7111    |   MILER |
--   | CHICAGO    | 7222    |   ALLEN |
--   | CHICAGO    | 7322    |   BLAKE |
--   | CHICAGO    | 7530    |   JAMES | (edited) 
SELECT d.location AS loc,
		 e.empno AS empno,
		 e.ename AS ename
FROM   emp e, dept d
WHERE  e.deptno = d.deptno
AND    d.location IN ('DALLAS', 'CHICAGO')
ORDER BY d.location DESC, e.ename ASC 
;

-- 9.	부서별 최고 급여(SAL) 금액을 아래 예제처럼 출력하세요
--    ex) 부서 없는 사원은 제외
-- [결과화면]
--   | deptno   | sal
--   |   10     | 2450
--   |   20     | 3000
--   |   30     | 2850
SELECT deptno, MAX(sal)
FROM emp
GROUP BY deptno
;


-- [결과화면]
--   | dname   | sal
--   |   ACCOUNTING     | 2450
--   |   RESEARCH       | 3000
--   |   SALES          | 2850
SELECT d.dname AS dname,
		 MAX(floor(e.sal)) AS sal
FROM   emp e, dept d
WHERE  e.deptno = d.deptno
GROUP BY d.dname
;


-- 10.	부서별 최고 급여(SAL) 금액을 받는 사원 정보를 아래 예제처럼 출력하세요
--    ex) 부서 없는 사원은 제외
-- [결과화면]
--   | loc     | sal     |   ename |
--   | DALLAS     | 7782    |   FORD  |
--   | DALLAS     | 7934    |   JONES |
--   | DALLAS     | 7111    |   MILER | (edited)

# 혼자 해본 것---안맞은 듯: 3000짜리 급여가 SCOTT, FORD 2명임
SELECT d.dname, d.location, MAX(e.sal), e.ename
FROM 	 dept d, emp e
WHERE  d.deptno = e.deptno
GROUP BY d.dname
;

# 강사님 쿼리
# ????
SELECT sal, ename
FROM emp
WHERE sal IN (SELECT MAX(sal) AS sal
				  FROM 	emp
				  GROUP BY deptno)
;				  
				  
## 이건 잘 돌아감
SELECT MAX(sal) AS sal
FROM emp
GROUP BY deptno
				  
SELECT d.location, e.sal, e.ename
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal IN (SELECT MAX(sal) AS sal
				FROM emp
				GROUP BY deptno)
;



-- [실습과제3]
-- 1.	 사원 테이블에서 각 사원에 급여(SAL) 등급을 아래 예제처럼 출력하세요
--     (급여순위점수(SALGRADE) 테이블 조인)
--     ex) 정렬은 등급(GRADE) 오름차순
-- [결과화면]
--   | empno      | ename   |   sal   |  grade |
--   | 7369       | Smith   |   800   |     1  |
--   | 7900       | JAMES   |   950   |     1  |
--   | 7521       | WARD    |   1250  |     2  |
--   | 7654       | MARTIN  |   1250  |     2  |
--   | 7934       | MILER   |   1300  |     2  |
--   | 7844       | TUNER   |   1500  |     3  |
-- empno, ename, sal, grade
SELECT *
FROM salgrade
;

# inner join 임
SELECT e.empno AS empno,
		 e.ename AS ename,
		 e.sal AS sal,
		 sal.grade AS grade
FROM	 emp e, salgrade sal
WHERE  e.sal BETWEEN sal.losal AND sal.hisal
ORDER BY sal.grade
;

-- 2.	사원 테이블에서 평균 급여(SAL) 보다 높은 사원 정보를 아래 예제처럼 출력하세요
--    ex) 정렬은 급여(SAL) 내림차순
-- [결과화면]
--   | empno      | ename   |   job       |  sal   |
--   | 7839       | KING    |   PRESIDENT |  5000  |
--   | 7902       | FORD    |   ANALYST   |  3000  |
--   | 7566       | JONES   |   MANAGER   |  2975  |
--   | 7698       | BLAKE   |   MANAGER   |  2850  |
--   | 7782       | CLARK   |   MANAGER   |  2450  |

SELECT empno, ename, job, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC 
;


-- 3.	사원 테이블에서 부서별 평균 급여(SAL) 보다 높은 사원 정보를 아래 예제처럼
--    출력하세요
--    ex) 정렬은 급여(SAL) 내림차순
-- 결과화면
-- | dname      | empno     | ename  | job      | sal  |
-- | RESEARCH   | 7902      | FORD   | ANALYST  | 3000 |
-- | RESEARCH   | 7566      | JONES  | MANAGER  | 2975 |
-- | SALES      | 7698      | BLAKE  | MANAGER  | 2850 |
-- | ACCOUNTING | 7782      | CLARK  | MANAGER  | 2450 |
SELECT d.dname AS dname,
		 e.empno AS empno,
		 e.ename AS ename,
		 e.job AS job,
		 e.sal AS sal
FROM emp e, dept d, (SELECT deptno, AVG(sal) AS sal
							FROM emp
							GROUP BY deptno) AS f
WHERE e.deptno = d.deptno
AND   e.deptno = f.deptno
AND e.sal > f.sal
ORDER BY e.sal DESC 
;


-- 4.	사원 테이블에서 각 사원에 급여(SAL) 순위 점수 별로 인원수를 아래 예제처럼 출력하세요
--   (급여순위점수(SALGRADE) 테이블 조인)
-- 결과화면
-- | GRADE      | LOSAL     | HISAL | CNT    |
-- | 1          | 700       | 1200  | 2      |
-- | 2          | 1201      | 1400  | 3      |
-- | 3          | 1401      | 2000  | 2      |
-- | 4          | 2001      | 3000  | 4      |
-- | 5          | 3001      | 9999  | 1      |
SELECT s.grade GRADE,
		 s.losal LOSAL,
		 s.hisal HISAL,
		 COUNT(e.empno) CNT
FROM   emp e, salgrade s
WHERE  e.sal BETWEEN s.losal AND s.hisal
GROUP BY s.grade
;


-- 5.	부서명이 'RESEARCH' 이거나 부서위치가 'NEW YORK' 사원 정보를 아래 예제처럼 출력하세요
-- ex) 정렬은 부서명(DNAME) 오름차순
-- 결과화면
-- | dname      | loc       | empno | ename  |
-- | ACCOUNTING | NEW YORK  | 7782  | CLARK  |
-- | ACCOUNTING | NEW YORK  | 7782  | MILLER |
-- | RESEARCH   | DALLAS    | 7782  | SMITH  |
-- | RESEARCH   | DALLAS    | 7782  | JONES  |

# 연산자 우선순위
# () > AND > OR

# 연산자 우선순위 때문에 이렇게 하면 잘못된 결과 나옴.
-- SELECT d.dname AS dname,
-- d.location AS loc,
-- e.empno AS empno,
-- e.ename AS ename
-- FROM   emp e, dept d
-- WHERE  e.deptno = d.deptno
-- AND    d.dname = 'RESEARCH'
-- OR     d.location = 'NEW YORK'
-- ORDER BY d.dname
-- ;

SELECT d.dname AS dname,
		 d.location AS loc,
		 e.empno AS empno,
		 e.ename AS ename
FROM   emp e, dept d
WHERE  e.deptno = d.deptno
AND    (d.dname = 'RESEARCH' OR d.location = 'NEW YORK')
ORDER BY d.dname
;

# CRUD(Create, Retrieve, Update, Delete)
#      insert, select, update, delete

# DML(Data Manipulation Language) : 데이터 조작어
#  INSERT(데이터 삽입), UPDATE(데이터 수정), DELETE(데이터 삭제)

# DDL(Data Definition Language) : 데이터 정의어
#  CREATE : 테이블(table, entity)을 생성할 때 사용하는 명령어

# [중요!] DML or DDL을 사용하면 반드시 commit;을 해준다.



# 테이블을 생성할 때의 문법
/*
CREATE TABLE <테이블명>(
	<field명> <데이터 타입>,
	<field명> <데이터 타입>,
		...
)engine=InnoDB;
 or
 engine=MyISAM;
 
 데이터 타입
	 INT(INTEGER) : -20억 ~ +20억
	 VARCHAR(byte수) : 200byte 영어는 200자, 한글 100자
	 NUMERIC(7,2) : 정수 7자리, 소수 2자리
*/

-- 테이블을 만들어 봅시다!
CREATE TABLE bonuses(
	employee_id INT,
	bonus			NUMERIC(8,2) -- 정수 8자리, 소숫점 2자리
)ENGINE=INNODB;
COMMIT;
DESCRIBE bonuses;
# DESCRIBE : 테이블의 구조를 확인할 때 사용하는 키워드

# 데이터를 하나 입력을 해봅시다.
# insert into <테이블명> values('','',0,'');
DESCRIBE bonuses;
INSERT INTO bonuses VALUES(100,15.2);
SELECT * FROM bonuses;
COMMIT;

# 급여에서 10%에 해당하는 금액을 얻어서 보너스 테이블에 입력해 보세요.
# hr_employees
SELECT employee_id, salary, salary*0.1
FROM   hr_employees
;

CREATE TABLE bonuses(
	employee_id INT,
	bonus			NUMERIC(8,2) -- 정수 8자리, 소숫점 2자리
)ENGINE=INNODB;
COMMIT;test3

DESCRIBE bonuses;


# 조건에 맞는 데이터를 테이블에 삽입하기
INSERT INTO bonuses
SELECT employee_id, salary * 0.1 FROM hr_employees
;
COMMIT;
SELECT * FROM bonuses;

# 변경
# 사원번호가 100번인 사원의 보너스를 240으로 바꿔보자.
# 수정: update <테이블명> set <field명>=1, <field명>=2 WHERE <조건>
UPDATE bonuses SET bonus=240 WHERE employee_id=100;
COMMIT;

# 'IT_Education'이라는 신규 부서를 부서번호 280번으로 부서 테이블에 입력해 보세요.
INSERT INTO hr_departments (department_id, department_name)
									VALUES (280, 'IT_Education');

INSERT INTO hr_departments VALUES(300,'Manufacturing',100,2000);
COMMIT;



SELECT *
FROM hr_departments
;


# 테이블을 하나 생성을 해보자.
# DDL
# engine=innoDB; --- 우리는 주로 이 innoDB 가지고 사용
# engine=MyISAM;

# 데이터 타입
# 		varchar()
#		int		not null AUTO_INCREMENT
#		smallint
#		NUMERIC(7,2)

CREATE TABLE TEST_TAB(
	NAME01 VARCHAR(100),
	NAME02 VARCHAR(4),
	NAME03 VARCHAR(10)
)ENGINE=INNODB;
COMMIT;

SHOW TABLES;

# 테이블에 값을 넣어봅시다.
DESCRIBE test_tab;
INSERT INTO test_tab VALUES('100','a','hi~~');
INSERT INTO test_tab VALUES('200','abcd','helloworld');

COMMIT;

SELECT *
FROM test_tab
;

# 테이블에 컬럼을 수정해보자.
# alter table <테이블명> modify <field명> 타입(길이)
ALTER table test_tab MODIFY NAME02 VARCHAR(10);
COMMIT;

DESCRIBE test_tab;

# 테이블에 컬럼을 추가해보자.
# alter table <테이블명> add <field명> <타입(10)>
ALTER TABLE test_tab ADD NAME04 VARCHAR(20);
COMMIT;


# 테이블에 있는 컬럼을 삭제해보자.
# alter table <테이블명> drop column <field명>;
ALTER TABLE test_tab DROP COLUMN NAME04;
COMMIT;
SELECT *
FROM test_tab;

# 데이터 타입
#	 VARCHAR(100)	: 가변문자열
#	 NUMERIC(8,2)	: 정수, 소수점
#	 INT or INTEGER: 정수 -20억 ~ +20억
#	 DATE				: 년월일, 2019-12-20
#   DATETIME		: YYYY-MM-DD HH:MM:SS 형식으로 저장
#	 TIMESTAMP		: 년월일시 초(1/1000), 2019-12-20 14:56:00 UTC시간대
#	 TIME				: HH:MM:SS로 저장


# 문제1) 아래와 같은 조건으로 테이블을 만들어 보세요.
/*
학생 테이블을 만든다.
필드명은 이름, 나이, 서엽ㄹ, 영문이름, 주소
테이블명은 STUDENT로 한다.
이름: VARCHAR(20), name
나이: INT, age
성별: VARCHAR(2), sex
영문이름: VARCHAR(30), eng_name
주소: VARCHAR(100), address
*/

CREATE TABLE student(
	name VARCHAR(20),
	age INT,
	sex VARCHAR(2),
	eng_name VARCHAR(30),
	address VARCHAR(100)
)ENGINE=INNODB;
COMMIT;

DESCRIBE student;



# 문제2) 만들어진 학생 테이블에 본인정보를 한 건 넣어보자.
# INSERT INTO <테이블명> VALUES ('','','',...)
INSERT INTO student (name, age, sex, eng_name, address)
					 VALUES('ekoh','24','f','EunkyungKoh','Gyeonggido');
COMMIT;

SELECT *
FROM student
;
# 문제3) 학생 테이블에서 영문이름 컬럼을 삭제해보자.
ALTER TABLE student DROP COLUMN eng_name;
COMMIT;


# 문제4) 학생 테이블에서 주소 컬럼을 VARCHAR(300)으로 변경해보자.
ALTER TABLE student MODIFY address VARCHAR(300);
COMMIT;

DESCRIBE student;
# 제악조건 추가하기
#	제약조건이라 함은 테이블의 필드에 기본값이나 중복되지 않도록
#	데이터를 넣거나 유일한 값만 존재하도록 정의하는 것을 말한다.

# 테이블을 하나 생성해 보자.
CREATE TABLE emp(
	employee_id INT
);
COMMIT;
SHOW TABLES;

# pk를 지정해보자.
# primary key : 하나의 테이블에서 유일하게 구분지을 수 있는 속성(attribute) or 키값

# Student
# |	학번		|	이름	|	나이	|
# | medici-01 | 장나라| 20		|

# alter table <테이블명> add contraint <임의의_pk_이름지정>
#																primary key(<field명>)
ALTER TABLE emp ADD CONSTRAINT emp_pk_employee_id PRIMARY KEY(employee_id)
;
COMMIT;
DESCRIBE emp;

# 이메일 컬럼을 하나 추가해 봅시다.
ALTER TABLE emp ADD email VARCHAR(50);
COMMIT;
DESCRIBE emp;

# 데이터를 추가해보자.
INSERT INTO emp VALUES(1001, 'suji@gmail.com');
INSERT INTO emp (employee_id, email) VALUES(1002, 'pengsu@gmail.com');
COMMIT;

SELECT *
FROM emp;

# 데이터를 하나 더 넣어보자.
INSERT INTO emp (email) VALUES('gildon@gmail.com');
# 데이터가 들어가지 않는다.
# 이유는? 테이블에 pk(primary key)가 지정되어 있으면
# pk를 같이 insert하지 않으면 데이터를 추가할 수 없기 때문.
# pk값은 not null + unique 한 값이기 때문.


DESCRIBE test_tab;
INSERT INTO test_tab (NAME01) VALUES ('ppsu@gmail.com');
COMMIT;

SELECT *
FROM test_tab;

# 방금 한 건 pk를 지정한 컬럼이 없기 때문에 insert 가능

# emp 테이블에 컬럼을 하나 추가해보자.
ALTER TABLE emp ADD last_name VARCHAR(25);
COMMIT;

SELECT * FROM emp;

# 제약조건도 하나 추가해보자. (NOT NULL로)
ALTER TABLE emp ADD CONSTRAINT col_add last_name2 VARCHAR(25) NOT NULL;
ALTER TABLE emp ADD CONSTRAINT col_add last_name2 VARCHAR(25);
COMMIT;

# 둘 다 안됨

# 컬럼을 추가하는 경우에는 테이블에 데이터가 있어도 되지만, 
# 제약조건을 추가할 경우에는 테이블에 데이터가 있으면 안된다.
# 하여 컬럼을 추가하는 것은 가능하지만, 제약조건을 같이 적용하려고 하면 안되는 것이다.


# salary 컬럼을 추가해보자.
# CHECK 제약 조건을 추가한다.
# CHECK 제약 조건 : 조건에 만족하는 데이터만 insert 되도록 한다.
SELECT * FROM emp;
ALTER TABLE emp ADD salary NUMERIC(3,2);
COMMIT;

ALTER TABLE emp ADD CONSTRAINT sal_chk CHECK(salary > 0);
COMMIT;
DESCRIBE emp;

INSERT INTO emp VALUES(300, 'suji@gmail.com', 'baesuji',1);
COMMIT;

INSERT INTO emp VALUES(302, 'pengsu@gmail.com', 'pengsu', -1);
COMMIT;

