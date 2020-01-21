-- 사용자 생성 및 권한 부여

-- 관리자(root, director): 모든 권한 부여
CREATE USER director1@'%' IDENTIFIED BY 'director1';
GRANT ALL ON *.* TO director1@'%' WITH GRANT OPTION;

-- 사장님(ceo): 읽기 권한(select)만 부여
CREATE USER ceo1@'%' IDENTIFIED BY 'ceo1';
GRANT SELECT ON *.* TO ceo1@'%';

-- 일반직원(staff): shopDB의 모든 테이블에 대해 읽기(select), 쓰기(insert, update, delete) 권한 부여
					-- 스토어드 프로시저 생성(create routine), 수정(alter routine) 권한 부여
					-- employees 데이터베이스 테이블에 대해서는 읽기(select) 권한만 부여
CREATE USER staff1@'%' IDENTIFIED BY 'staff1';
GRANT SELECT, INSERT, UPDATE, DELETE ON ShopDB.* TO staff1@'%';
GRANT SELECT ON employees.* TO staff1@'%';

-- director check
CREATE DATABASE sampledb;
DROP DATABASE sampledb;

-- ceo check
USE shopdb;
SELECT * FROM membertbl;

	-- CREATE DATABASE sampledb; -- denied
	-- INSERT INTO membertbl VALUES ('Kim', '김수현', '경기도 수원시 영통구'); -- denied

-- staff check
USE shopdb;
DELETE FROM membertbl WHERE memberid = 'Sang';
SELECT * FROM membertbl;

	-- DROP TABLE membertbl;	-- denied

USE employees;
SELECT * FROM employees;

	-- DELETE FROM employees WHERE emp_no = '10011';  -- denied


 
