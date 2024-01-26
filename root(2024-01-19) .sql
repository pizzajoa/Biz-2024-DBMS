
CREATE DATABASE bookDB;
-- Database open(물리적 저장소 열기)
USE bookDB;

--  실제 데이터를 보관할 Table 생성
CREATE TABLE tbl_books (
	isbn	VARCHAR(13)	PRIMARY KEY,
	title	VARCHAR(50)	NOT NULL,
	author	VARCHAR(50)	NOT NULL,	
	publisher	VARCHAR(50),
	price	VARCHAR(13),
	discount	VARCHAR(125),
    description 	VARCHAR(4000),
    pubdate		VARCHAR(10),
    link	VARCHAR(125),
    image	VARCHAR(125)
);


CREATE TABLE tbl_users (
	M_ID	VARCHAR(20)	PRIMARY KEY,
	M_PASSWORD	VARCHAR(125)	NOT NULL,
	M_EMAIL	VARCHAR(125) NOT NULL,
    M_NAME	VARCHAR(12) NOT NULL
		
);
INSERT INTO tbl_books(isbn, title, author, publisher, price, discount )
VALUES(
'9791188850501','왕이된 남자 1',
'김선덕','북라이프','14,000',
'12,600'
);
INSERT INTO tbl_member(M_ID, M_PASSWORD, M_EMAIL, M_NAME)
VALUES(
'S0001','갈한수',
'기계공학과','2','090-4407-3262',
'경북 경산시 사정동 278-1'
);

