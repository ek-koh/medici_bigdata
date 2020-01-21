-- 테이블 만들기 / 삭제하기

CREATE TABLE `my testTBL` (id INT);
DROP TABLE `my testtbl`;

-- 500건의 데이터가 있는 indexTBL 생성
CREATE TABLE indexTBL (first_name VARCHAR(14), last_name VARCHAR(16), hire_date DATE);
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
	FROM employees.employees
	LIMIT 500;
SELECT * FROM indexTBL;

-- index 생성하기
CREATE INDEX idx_indexTBL_firstnmae ON indexTBL(first_name);

-- 뷰 생성하기
CREATE VIEW uv_memberTBL
AS
	SELECT membername, memberaddress FROM memberTBL;

-- Stored Procedure 만들기
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT *
	FROM membertbl
	WHERE membername = '당탕이';
	
	SELECT *
	FROM producttbl
	WHERE productname = '냉장고';
END //
DELIMITER ;

-- Trigger
INSERT INTO membertbl VALUES ('Figure', '연아', '경기도 군포시 당정동');
UPDATE membertbl SET memberaddress = '서울 강남구 역삼동' WHERE membername = '연아';
DELETE FROM membertbl WHERE membername = '연아';

CREATE TABLE deletedMemberTBL (
	memberID CHAR(8),
	memberName CHAR(5),
	memberAddress CHAR(20), 
	deleted DATE
);

DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL		-- 트리거이름
	AFTER DELETE		-- 삭제 후에 작동하게 지정
	ON membertbl		-- 트리거를 부착할 테이블
	FOR EACH ROW 		-- 각 행마다 적용시킴
BEGIN
	-- OLD 테이블의 내용을 백업 테이블에 삽입
	INSERT INTO deletedMemberTBL
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
END //
DELIMITER ;

DELETE FROM membertbl WHERE membername = '당탕이';

SELECT * FROM membertbl;
SELECT * FROM deletedmembertbl;
