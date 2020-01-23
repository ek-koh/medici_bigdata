DESC usertbl;

-- 1970년 이후 출생하고 신장 182 이상인 사람의 아이디와 이름
SELECT userid, NAME
FROM usertbl
WHERE birthyear >= 1970 AND height >= 182;

-- 1970년 이후 출생했거나 신장 182 이상인 사람의 아이디와 이름
SELECT userid, NAME
FROM usertbl
WHERE birthyear >= 1970 OR height >= 182;

-- 키가 180~183인 사람
SELECT *
FROM usertbl
WHERE height BETWEEN 180 AND 183;

-- 지역이 경남, 전남, 경북인 사람
SELECT *
FROM usertbl
WHERE addr IN ('경남', '전남', '경북');

-- 성이 김씨인 사람
SELECT userID, NAME
FROM usertbl
WHERE NAME LIKE '김%';

-- 성이 한 글자이고 이름이 '종신'인 사람
SELECT userid, NAME
FROM usertbl
WHERE NAME LIKE '_종신';

-- SubQuery
-- 김경호보다 키가 크거나 같은 사람의 이름과 키
SELECT NAME, height
FROM usertbl
WHERE height >= (SELECT height FROM usertbl WHERE NAME = '김경호')
;

-- 지역이 '경남'인 사람의 키보다 키가 크거나 같은 사람
-- SELECT NAME, height
-- FROM usertbl;
-- WHERE height >= (SELECT height FROM usertbl WHERE addr = '경남')
-- ; -- 서브쿼리가 2개 이상의 값을 반환하기 때문에 오류

-- ANY
SELECT NAME, height
FROM usertbl
WHERE height >= ANY(SELECT height FROM usertbl WHERE addr = '경남');

SELECT NAME, height
FROM usertbl
WHERE height = ANY(SELECT height FROM usertbl WHERE addr = '경남');

SELECT NAME, height
FROM usertbl
WHERE height IN (SELECT height FROM usertbl WHERE addr = '경남');

-- ALL
SELECT NAME, height
FROM usertbl
WHERE height >= ALL(SELECT height FROM usertbl WHERE addr = '경남');

-- ORDER BY
-- 가입한 순서로 회원의 이름과 가입 날짜 출력
SELECT NAME, mdate
FROM usertbl
ORDER BY mdate;

SELECT NAME, mdate
FROM usertbl
ORDER BY mdate DESC;

-- 키가 큰 순서대로 정렬하되, 만약 키가 같을 경우에 이름 순으로 정렬
SELECT height 키, NAME 이름
FROM usertbl
ORDER BY height DESC, NAME
;

-- DISTINCT
-- 회원테이블에서 회원들의 거주지역이 몇 군데인지 출력
SELECT DISTINCT addr
FROM usertbl
;


-- LIMIT
-- employees DB 사용
-- 입사일이 오래된 직원 5명의 emp_no(사원번호)를 출력
USE employees;

DESC employees;

SELECT emp_no, hire_date
FROM employees
ORDER BY hire_date
LIMIT 5;

SELECT emp_no, hire_date
FROM employees
ORDER BY hire_date
LIMIT 10;

SELECT emp_no, hire_date
FROM employees
ORDER BY hire_date
LIMIT 5, 5;

SELECT emp_no, hire_date
FROM employees
ORDER BY hire_date
LIMIT 5 OFFSET 5;

-- CREATE TABLE ... SELECT
USE sqldb;

CREATE TABLE buyTbl2 (SELECT * FROM buytbl);
SELECT * FROM buytbl2;

CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;


-- GROUP BY
-- 구매테이블에서 사용자가 구매한 물품의 개수를 출력
DESC buytbl;

SELECT userID, amount
FROM buytbl
;

SELECT userID, sum(amount) AS '총 구매 개수'
FROM buytbl
GROUP BY userID
;

-- 구매액의 총합
SELECT userid, SUM(price*amount) AS '총 구매액'
FROM buytbl
GROUP BY userid
;

-- 구매테이블에서 사용자가 구매한 물품 개수의 전체평균
SELECT AVG(amount)
FROM buytbl
;

-- 구매테이블에서 사용자가 구매한 물품 개수의 사용자별 평균
SELECT userid, AVG(amount)
FROM buytbl
GROUP BY userid
;

-- 가장 큰 키와 가장 작은 키의 회원 이름과 키를 출력
DESC usertbl;

SELECT NAME, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
OR height = (SELECT MIN(height) FROM usertbl)
;

-- 휴대폰이 있는 사용자의 수를 출력
SELECT COUNT(*)
FROM usertbl
WHERE mobile1 IS NOT NULL
;

SELECT COUNT(mobile1)
FROM usertbl
;


-- HAVING절
-- 사용자별 총 구매액
SELECT userid AS 사용자, SUM(price*amount) AS '총 구매액'
FROM buytbl
GROUP BY userid
;

-- 총 구매액이 1000 이상인 사용자만 출력하되, 총 구매액이 적은 순서대로 나타내자.
-- Error
-- SELECT userid AS 사용자, SUM(price*amount) AS '총 구매액'
-- FROM buytbl
-- WHERE SUM(price*amount) >= 1000
-- GROUP BY userid
-- ;

SELECT userid AS 사용자, SUM(price*amount) AS '총 구매액'
FROM buytbl
GROUP BY userid
HAVING SUM(price*amount) >= 1000
ORDER BY SUM(price*amount)
;

-- ROLLUP
DESCRIBE buytbl;

-- 분류(gropuName)별로 합계 및 그 총합 구하기
SELECT num, groupname, SUM(price*amount) AS '비용'
FROM buytbl
GROUP BY groupname, num
WITH ROLLUP;

-- 소합계 및 총합계만 보고 싶다면?
SELECT num, groupname, SUM(price*amount) AS '비용'
FROM buytbl
GROUP BY groupname
WITH ROLLUP;

-- 데이터의 변경을 위한 SQL문
-- INSERT
CREATE TABLE testTBL1
(id INT,
	userName CHAR(3),
	age INT);

INSERT INTO testtbl1 VALUES (1, '홍길동', 25);
INSERT INTO testtbl1(id, username) VALUES (2, '설현');
INSERT INTO testtbl1(username, age, id) VALUES('초아', 26, 3);

-- AUTO_INCREMENT
CREATE TABLE testTBL2
( id INT AUTO_INCREMENT PRIMARY KEY,
	userName CHAR(3),
	age INT);

INSERT INTO testtbl2 VALUES(NULL, '지민', 25);
INSERT INTO testtbl2 VALUES(NULL, '유나', 22);
INSERT INTO testtbl2 VALUES(NULL, '유경', 21);

SELECT * FROM testtbl2;

SELECT LAST_INSERT_ID();

	-- auto_increment 입력값을 100부터 입력되게 바꾸기
ALTER TABLE testtbl2 AUTO_INCREMENT = 100;

INSERT INTO testtbl2 VALUES(NULL, '찬미', 23);
SELECT * FROM testtbl2;

SELECT LAST_INSERT_ID();

  -- 증가값 지정하기
CREATE TABLE testtbl3
( id INT AUTO_INCREMENT PRIMARY KEY,
	userName CHAR(3),
	age INT);
	
ALTER TABLE testtbl3 AUTO_INCREMENT = 1000;

SET @@auto_increment_increment = 3;

INSERT INTO testtbl3 VALUES(NULL, '나연', 20);
INSERT INTO testtbl3 VALUES(NULL, '정연', 18);
INSERT INTO testtbl3 VALUES(NULL, '모모', 19);

SELECT * FROM testtbl3;

-- 대량의 샘플 데이터 형성
-- 1
CREATE TABLE testtbl4
(id INT, Fname VARCHAR(50), Lname VARCHAR(50));
INSERT INTO testtbl4
	SELECT emp_no, first_name, last_name FROM employees.employees;
	
SELECT * FROM testtbl4;

--2
CREATE TABLE testtbl5
(SELECT emp_no, first_name, last_name FROM employees.employees);

SELECT * FROM testtbl5;


-- UPDATE
UPDATE testtbl4 SET Lname = '없음' WHERE Fname = 'Kyoichi';
SELECT * FROM testtbl4 WHERE Fname = 'Kyoichi';

SELECT * FROM testtbl4 LIMIT 10;

	-- buytbl2에서 현재 단가가 모두 1.5배 인상되었다면?
UPDATE buytbl2 SET price = price*1.5;
SELECT price FROM buytbl;
SELECT price FROM buytbl2;

-- DELETE
DELETE FROM testtbl4 WHERE Fname = 'Aamer';
SELECT * FROM testtbl4 WHERE Fname = 'Aamer';

DELETE FROM testtbl4 WHERE fname = 'Mary' LIMIT 5;
SELECT * FROM testtbl4 WHERE fname = 'Mary';

	-- 대용량 테이블 삭제
CREATE TABLE bigTBL1 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL2 (SELECT * FROM employees.employees);
CREATE TABLE bigTBL3 (SELECT * FROM employees.employees);

DELETE FROM bigtbl1;
DROP TABLE bigtbl2;
TRUNCATE TABLE bigtbl3;

-- 조건부 데이터 입력, 변경
CREATE TABLE memberTBL (SELECT userid, NAME, addr FROM usertbl LIMIT 3);
ALTER TABLE memberTBL
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID);
	
SELECT * FROM membertbl;

	-- PK가 중복되는 데이터를 입력한다면?
INSERT INTO membertbl VALUES('BBK', '바비코','미국');
INSERT INTO membertbl VALUES('SJH', '서장훈','서울');
INSERT INTO membertbl VALUES('HJY', '현주엽','경기');
SELECT * FROM membertbl;

INSERT ignore INTO membertbl VALUES('BBK', '바비코','미국');
INSERT ignore INTO membertbl VALUES('SJH', '서장훈','서울');
INSERT ignore INTO membertbl VALUES('HJY', '현주엽','경기');
SELECT * FROM membertbl;

	-- 입력 시 기본 키가 중복되면 데이터가 수정되도록(UPDATE) 하기
INSERT INTO membertbl VALUES('BBK', '바비코','미국')
	ON DUPLICATE KEY UPDATE NAME = '바비코', addr = '미국';
INSERT INTO membertbl VALUES('DJM', '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE NAME = '동짜몽', addr = '일본';

SELECT * FROM membertbl;

-- WITH절 - 비재귀적 CTE
USE sqldb;

SELECT userid AS '사용자', SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userid;


WITH abc(userid, total)
AS
	(SELECT userid, SUM(price*amount)
		FROM buytbl group BY userid)
SELECT * FROM abc ORDER BY total DESC;

	-- 회원 테이블(userTBL)에서 각 지역별로 가장 큰 키를 1명씩 뽑은 후, 그 사람들 키의 평균.
DESC userTBL;

WITH cte_userTBL(addr, maxHeight)
AS
	(SELECT addr, max(height)
	FROM usertbl
	GROUP BY addr)
SELECT AVG(maxHeight*1.0) AS '각 지역별 최고 키의 평균' FROM cte_userTBL;
