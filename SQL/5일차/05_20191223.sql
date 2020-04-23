-- 외래키(foreign key)
-- 본인 테이블에서는 pk이나 다른 테이블에서는 일반 필드인 값
-- 본인 테이블에서 pk가 다른 테이블에서 일반 필드를 참조하고 있는 것

SELECT *
FROM   hr_employees e, hr_departments d
WHERE  e.DEPARTMENT_ID = d.DEPARTMENT_ID
;

-- emp 테이블에 department_id 필드를 추가한다.
ALTER TABLE emp ADD department_id NUMERIC(5, 0);
COMMIT;

SELECT *
FROM emp;


# 여기부터 exercise 데이터베이스 사용
DESCRIBE emp;
DESCRIBE dept;

-- 외래키를 적용시켜보자.
ALTER TABLE emp ADD CONSTRAINT emp_dept_id_fk FOREIGN KEY(department_id) REFERENCES dept(deptno);
COMMIT;

# 데이터베이스 다시 test로...
ALTER TABLE hr_employees ADD CONSTRAINT emp_dept_id_fk FOREIGN KEY(department_id) REFERENCES hr_departments(department_id);
COMMIT;

SELECT * FROM hr_employees;
SELECT * FROM hr_departments;
DESCRIBE hr_employees;
DESCRIBE hr_departments;

# 이거는 들어가는 쿼리문
INSERT INTO hr_employees VALUES(8000, 'gildong', 'hong', 'gildong', '010.123.7788', '2010-01-01', 'IT_PROG', 20000, NULL, 100, 60);
COMMIT;

INSERT INTO hr_employees VALUES(8001, 'gildong', 'hong', 'Kildong', '010.123.7788', '2010-01-01', 'IT_PROG', 20000, NULL, 100, 290);
COMMIT;

-- row_number() : 데이터가 출력되는 내용에 대한 순서를 매겨주는 함수
-- 					rank()하고는 다르기 때문에 혼용하면 안된다.
-- 					게신판을 작성할 때 paging처리에도 사용된다.
# 이렇게 하면 where절 때문에 안돌아감
SELECT row_number() over() rownum, employee_id, last_name
FROM	 hr_employees
--where rownum < 5
;

SELECT *
FROM 	 (SELECT row_number() over(ORDER BY salary DESC) rownum, salary, employee_id, last_name
			FROM	 hr_employees) a
WHERE a.rownum < 7
;


SELECT *
FROM 	 (SELECT rank() over(ORDER BY salary DESC) rnk, salary, employee_id, last_name
			FROM	 hr_employees) a
WHERE a.rnk < 7
;

-- 테이블을 하나 만들어보자.
-- AUTO_INCREMENT를 적용
-- pk를 AUTO_INCREMENT한 필드로 적용을 해야된다.
CREATE TABLE emp2(
	emp_id INT(6) NOT NULL AUTO_INCREMENT,
	emp_name VARCHAR(20),
	PRIMARY KEY(emp_id)
)ENGINE=INNODB;
COMMIT;

SELECT * FROM emp2;
DESCRIBE emp2;


-- auto_increment로 정의되어 있는 테이블에 데이터를 넣어보자.
INSERT INTO emp2 (emp_name) VALUES ('suji');
INSERT INTO emp2 (emp_name) VALUES ('sori');
COMMIT;


-- auto_increment를 초기화도 해보자.
ALTER TABLE emp2 AUTO_INCREMENT=1000;
COMMIT;
INSERT INTO emp2 (emp_name) VALUES ('seol');
COMMIT;

-- auto_increment를 재정렬하기
-- counter에 입력한 값으로 auto_increment 정렬하기
SET @COUNT = 200;
UPDATE emp2 SET emp_id = @COUNT:= @COUNT+1;
COMMIT;

SELECT * FROM hr_employees;

-- 사원 테이블에서 직업이 SA_REP인 사원의 급여를 20정도 더하는 쿼리문을 만들어 봅시다.
-- 그리고 급여를 실제 테이블에 업데이트 해봅시다.
SELECT salary, salary+20
FROM   hr_employees
WHERE  job_id = 'SA_REP'
;

UPDATE hr_employees SET salary = salary + 20
WHERE job_id = 'SA_REP'
;
COMMIT;

SELECT *
FROM hr_employees
WHERE job_id = 'SA_REP'
;

-- 사원 테이블에서 이름이 'Lorentz'인 사원의 입사일에 3달을 더해보자.
-- 월을 더하는 함수 date_add(날짜, INTERVAL 3 MONTH) ; 
SELECT hire_date, date_add(hire_date, INTERVAL 12 MONTH)
FROM   hr_employees
WHERE  last_name = 'Lorentz'
;

SELECT * FROM emp;

-- 데이터 삭제하기
-- DELETE FROM <테이블명> : 테이블에 있는 데이터를 다 삭제
-- DELETE FROM <테이블명> WHERE <조건> : 특정 조건에 맞는 데이터만 삭제
DELETE FROM emp
WHERE ename LIKE 'M%'
;

DELETE FROM emp;
ROLLBACK;

-- ROLLBACK;
-- 쿼리문을 실행하고 나서 문제가 있다고 판단되어, 이전 데이터로 복원하고 싶을 때 사용하는 키워드로
-- commit; 하기 전에 해야하고 commit;을 하고 나면 복원이 안된다.

-- autocmommit이 어떤 상태인지 확인해보자.
-- 1이면 autocommit true, 0이면 autocommit false
SELECT @@autocommit;
-- autocommit 값을 자동으로 해주지 않는다.
-- 아래와 같이 작성하면 된다.
SET @@autocommit=0;

# 하지만 exercise/emp는 이미 날아감...

SELECT * FROM emp2;
DELETE FROM emp2;
ROLLBACK;

-- 문자열을 넣었을 때 길이를 반환하는 함수
-- char_length();
SELECT CHAR_LENGTH("medici-bigdata-lecture");

-- 주어진 날짜 중 월의 맨 마지막 날을 가져오는 함수
-- last_day(<주어진 날짜>);
SELECT LAST_DAY('2019-12-23');


SELECT *
FROM   hr_employees
;

-- 사원의 평균 급여보다 높은 사원을 삭제하는 delete문을 만들어봅시다.
-- 사원의 평균급여 : 6592.5926
DELETE FROM hr_employees
WHERE salary > (SELECT AVG(salary)
					 FROM   hr_employees)
;
# 방금 거는 쿼리는 맞지만 제약조건 때문에 삭제가 안됨

-- 트랜잭션(transaction)
--   하나의 업무 단위
--   예를 들자면, 예금, 출금, 대출, 이체
--   1) 통장에 돈이 있어야 된다.
--   2) 보안인증 select -> insesrt
--   3) 돈을 다른 곳으로 보내게 된다. insert
--	  4) 통장에 제대로 전송이 되었는지 확인 select
--   5) 통장번호, 이름이 맞을 경우에는 금액을 이체 ok! insert, select
--   6) 통장버호, 이름이 맞지 않을 경우에는 이체 하지 않고 rooback;!!


-- self join
-- 	자기 자신의 테이블에서 자기 자신을 참조해서 데이터를 추츨헤 내는 것
-- 	현재 샘플 예제에서는 Hr_employees테이블이 self-join이 되어있다.
--	   사원들은 모두 사번을 가지고 있다.
-- 	hr_employees 테이블에 있는 매니저 ID는 매니저로 지정된 사원의 사원번호가 된다.
--		따라서 매니저ID도 사원번호를 가지고 있는 사람의 사원 번호인 것이다.


-- self join 되는지 확인
SELECT *
FROM   hr_employees e, hr_employees m
WHERE  e.employee_ID = m.manager_ID
;

#  매니저 ID가 없는 사원 정보도 출력해보자.
SELECT *
FROM   hr_employees e LEFT OUTER JOIN hr_employees m
ON     e.employee_ID = m.manager_ID
;

-- 사원 테이블(hr_employees)에서 전체 사원을 대상으로 commission_pct 컬럼
-- 100을 더하는 수정문을 만들어 보세요~ (스스로)
SELECT *
FROM hr_employees
;

UPDATE hr_employees SET commission_pct = commission_pct + 100
;


-- table 삭제해보기
-- drop table <테이블명>;
DROP TABLE bonuses;
# drop table은 rollback 안됨.
ROLLBACK;
