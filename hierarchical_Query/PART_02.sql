/*
 * USE DATABASE 	: HR
 * ORACLE VERSION	: 11G_SE, 12C_SE
 * 
 * */

-- 직원들을 계층형 구조로 조회

SELECT
		LEVEL															AS "LEVEL",	
		B.JOB_TITLE														AS 직위,
		LPAD('ㄴ', 4*(LEVEL-1)) || A.FIRST_NAME || ' ' || A.LAST_NAME	AS 성명,
		A.EMPLOYEE_ID													AS 사번,
		A.MANAGER_ID													AS 매니저사번
  FROM	EMPLOYEES	A
 INNER
  JOIN	JOBS		B
    ON	A.JOB_ID = B.JOB_ID
 START	WITH A.MANAGER_ID IS NULL
 		CONNECT BY PRIOR A.EMPLOYEE_ID = A.MANAGER_ID;
 		
 	
 	



