CREATE TABLE BOM (
     ITEM_ID INTEGER NOT NULL, -- 품목식별자
     PARENT_ID INTEGER, -- 상위품목 식별자
     ITEM_NAME VARCHAR2(20) NOT NULL, -- 품목이름
     ITEM_QTY INTEGER, -- 품목 개수
     PRIMARY KEY (ITEM_ID)
);



INSERT INTO BOM VALUES ( 1001, NULL, '컴퓨터', 1);
INSERT INTO BOM VALUES ( 1002, 1001, '본체', 1);
INSERT INTO BOM VALUES ( 1003, 1001, '모니터', 1);
INSERT INTO BOM VALUES ( 1004, 1001, '프린터', 1);

INSERT INTO BOM VALUES ( 1005, 1002, '메인보드', 1);
INSERT INTO BOM VALUES ( 1006, 1002, '랜카드', 1);
INSERT INTO BOM VALUES ( 1007, 1002, '파워서플라이', 1);
INSERT INTO BOM VALUES ( 1008, 1005, 'CPU', 1);
INSERT INTO BOM VALUES ( 1009, 1005, 'RAM', 1);
INSERT INTO BOM VALUES ( 1010, 1005, '그래픽카드', 1);
INSERT INTO BOM VALUES ( 1011, 1005, '기타장치', 1);

SELECT * FROM BOM;


-- 일반조인을 사용한 계층형쿼리
SELECT
		b1.ITEM_NAME,
		b1.ITEM_ID,
		b2.ITEM_NAME,
		b2.PARENT_ID
  FROM	BOM	b1
  LEFT  OUTER
  JOIN	BOM b2
    ON	b1.PARENT_ID = b2.ITEM_ID
 ORDER	BY	b1.ITEM_ID;
 


-- START WITH ... CONNECT BY 절을 사용한 계층형 쿼리
SELECT
		ITEM_NAME,
		ITEM_ID,
		PARENT_ID
  FROM	BOM
 START	WITH	PARENT_ID IS NULL
		CONNECT BY PRIOR ITEM_ID = PARENT_ID;
  
	

-- -> 발전형
SELECT
		LPAD(' ',2*(LEVEL-1)) || ITEM_NAME	AS ITEM,
		ITEM_ID,
		PARENT_ID
  FROM	BOM
 START	WITH PARENT_ID IS NULL
 		CONNECT BY PRIOR ITEM_ID = PARENT_ID;
 	
 	
 	
 	
 	
 
-- 문제) 샘플 테이블(BOM)에서 본체를 포함해서 본체의 하위 품목들만 계층구조로 조회하세요.
SELECT
		LPAD(' ', 2*(LEVEL-1)) || ITEM_NAME,
		ITEM_ID	AS ITEM
  FROM	BOM
 START 	WITH ITEM_ID = '1002'
 		CONNECT BY PRIOR ITEM_ID = PARENT_ID;
 
 	
 	
/*	
	- START WITH 조건1
		● ROOT NODE를 식별한다. 조건1을 만족하는 모든 ROW들은 ROOT NODE가 된다.
		● START WITH절을 생략할수도 있는데 이러한 경우는 모든 ROW를 ROOT NODE로 간주한다.
		● 해당 조건에는 서브쿼리가 올수 있다.
	
	- CONNECT BY 조건2
		● PARENT NODE와 CHILD NODE 간의 관계를 명시하는 부분이다.
		● 반드시 PRIOR연산자를 포함시켜야하며, 이는 PARENT NODE COLUMN을 식별하는데 사용한다.
		● 해당 조건에는 서브쿼리가 올수 없다.
		
	- PRIOR 연산자
		● 계층형 쿼리에서만 사용하는 오라클 SQL 연산자이다.
		● CONNECT BY절에서 등호(=)와 동등한 레벨로 사용되는 연산자이며, CONNECT  BY절에서 해당 컬럼의
		● 부모로우를 식별하는데 사용된다.

*/
	
	
	
	
	
	
	