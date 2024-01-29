-- 매입매출
DROP TABLE tbl_iolist;
CREATE TABLE tbl_iolist(
io_seq	BIGINT		PRIMARY KEY,
io_date	VARCHAR(10)		NOT NULL,
io_time	VARCHAR(10)		NOT NULL,
io_pcode	VARCHAR(6)		NOT NULL,
io_dcode	VARCHAR(5)		NOT NULL,

io_div	VARCHAR(1)		,
io_quan	INT		,
io_price	INT		,
io_oprice	INT		
	
);
SELECT COUNT(*) FROM tbl_depts;
SELECT COUNT(*) FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_products;

SELECT * FROM tbl_depts;
SELECT * FROM tbl_iolist LIMIT 10;
SELECT * FROM tbl_products;

SELECT * FROM tbl_iolist LIMIT 10;
-- 정규화(제3정규화)된 데이터의
-- tbl_iolist 테이블만 가지고는 상품에 대한 구체적인 정보(이름포함)
-- 거래처에 대한 구체적인 정보(이름포함)을 알 수 없다
-- 이럴 때 테이블간에 JOIN을 실행하여 확인을 해야 한다.

-- TABLE을 JOIN을 통해 "참조무결성"검증
-- 상품과 매입매출 테이블의 Relation 검증
-- 결과가 하나라도 출력이 되면
-- tbl_iolist에는 상품코드가 데이터가 포함되어 있지만
-- tbl_products에는 상품코드가 누락되어있다
-- 참조관계(참조무결성)이 문제가 있다 라는 것이다
SELECT io_pcode, p_name
FROM tbl_iolist
	LEFT JOIN tbl_products
		ON io_pcode = p_code
WHERE p_name IS NULL;

-- 거래처데이터와 매입매출 "참조무결성" 검증
SELECT io_dcode, d_name
FROM tbl_iolist
	LEFT JOIN tbl_depts
		ON io_dcode = d_code
WHERE d_name IS NULL;

/*
외래키 설정(Foreign key, kf) : 참조무결성 제약조건 설정 not null
다중 테이블간에 관계에서 참조무결성이 무너지지 않도록
미리 테이블에 제약조건을 설정하고 
데이터의 추가, 수정, 삭제를 할 때 적용한다
기본키(pk) 개체무결성 보장

외래키는 1:N 관계에서 N인 테이블에 설정한다
1의 조건 테이블의 PK와 연결한다
*/
-- 매입매출과 상품테이블의 FK 설정
-- 매입매출과 상품은 N:1의 관계이다
-- N인 매입매출 Table에 FK를 설정한다
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_PCODE
FOREIGN KEY (io_pcode)
REFERENCES tbl_products(p_code);
-- p_code와 p_code를 연결하여 이름을 FK_PCODE로 만든다
-- tbl_iolist 에 P00012 상품의 거래데이터가 있기 떄문에
-- tbl_products(상품테이블)에서 P00012인 상품의 데이터는 
-- 절대 삭제할 수 없게 되었다
SELECT * FROM tbl_iolist LIMIT 10;
DELETE FROM tbl_products WHERE p_code = 'P00012';
SELECT * FROM tbl_iolist WHERE io_pcode = 'P00012';

-- 매입매출과 거래체 테이블간에 FK 설정하기
ALTER TABLE tbl_iolist
ADD CONSTRAINT FK_DCODE
FOREIGN KEY (io_dcode)
REFERENCES tbl_depts(d_code);