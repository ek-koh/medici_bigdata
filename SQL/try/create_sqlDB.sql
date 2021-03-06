DROP DATABASE if EXISTS sqlDB;
CREATE DATABASE sqlDB;

USE sqlDB;

-- userTbl 생성
CREATE TABLE userTbl
( userID CHAR(8) NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(3),
	mobile2 CHAR(8),
	height SMALLINT,
	mDate DATE
);

-- buyTbl 생성
CREATE TABLE buyTbl
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	groupName CHAR(4),
	price INT NOT NULL,
	amount SMALLINT NOT NULL,
	FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

-- userTbl 데이터 입력
INSERT INTO userTbl VALUES('LSG', N'이승기', 1987, N'서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', N'김범수', 1979, N'경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', N'김경호', 1971, N'전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', N'조용필', 1950, N'경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', N'성시경', 1979, N'서울', NULL, NULL, 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', N'임재범', 1963, N'서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', N'윤종신', 1969, N'경남', NULL, NULL, 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', N'은지원', 1972, N'경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', N'조관우', 1965, N'경기', '018', '99999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', N'바비킴', 1973, N'서울', '010', '00000000', 176, '2013-5-5');


-- buyTbl 데이터 입력
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'노트북', N'전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', N'모니터', N'전자', 200, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'모니터', N'전자', 200, 5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', N'청바지', N'의류', 50, 3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'메모리', N'전자', 80, 10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', N'책', N'서적', 15, 5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책', N'서적', 15, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'청바지', N'의류', 50, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', N'책', N'서적', 15, 1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', N'운동화', NULL, 30, 2);

