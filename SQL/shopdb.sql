SELECT *
FROM membertbl
;

SELECT membername, memberaddress
FROM membertbl
;

SELECT *
FROM membertbl
WHERE membername = '지운이'
;

-- EXPLAIN은 쿼리문이 실행될 때 어떤 방식으로 실행되는지 '실행 계획(Execution Plan)'의 내용을 보여준다.
-- type
	-- ALL: Full Table Scan. 인덱스 사용 x, 테이블 전체 검색했다는 뜻
	-- ref: index 사용해서 결과 찾았다는 뜻
EXPLAIN
SELECT *
FROM indextbl
WHERE first_name = 'mary'
;

-- 뷰에 접근해보기
SELECT *
FROM uv_memberTBL
;

-- Stored Procedure
SELECT *
FROM membertbl
WHERE membername = '당탕이';

SELECT *
FROM producttbl
WHERE productname = '냉장고';

CALL myProc();

-- Trigger
SELECT * FROM membertbl;


-- Backup
USE ShopDB;
SELECT *
FROM productTBL;

	-- 문제 발생시키기
-- DELETE FROM producttbl;

	-- 백업중
USE mysql; -- 다른 데이터베이스 잠시 선택

	-- 백업 완료
SELECT *
FROM producttbl;

