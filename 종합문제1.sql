--1. EMP와 DEPT 테이블을 JOIN하여 부서번호, 부서명, 이름, 급여를 출력하세요.
SELECT
		A.DEPTNO,
		B.DNAME,
		A.ENAME,
		A.SAL
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO;
    
   
--2. 이름이 'ALLEN'인 사원의 부서명을 출력하세요.
SELECT
		B.DNAME
  FROM	EMP		A
 INNER	
  JOIN  DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	A.ENAME = 'ALLEN';
 

--3. DEPT 테이블에 있는 모든 부서를 출력하고, EMP table에 있는 DATA와 JOIN이하여 모든 사원 이름, 부서번호, 부서명, 급여를 출력하세요.
SELECT
		A.ENAME,
		A.DEPTNO,
		B.DNAME,
		A.SAL
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO;
   
   

--4. EMP table에 있는 EMPNO와 MGR을 이용하여 서로의 관계를 [SMITH의 매니저는 FORD이다]라는 형식처럼 출력하세요.
SELECT
		B.ENAME || '의 매니저는 ' || A.ENAME || '이다.'
  FROM	EMP	A
 INNER
  JOIN	EMP B
    ON	A.EMPNO = B.MGR;

 
   
--5. 'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하세요.
SELECT
		A.ENAME,
		B.DNAME,
		A.SAL,
		A.JOB
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
   AND	A.JOB = (
   					SELECT 
   							JOB
   					  FROM	EMP
   					 WHERE  ENAME = 'ALLEN'
   				);
   				
   			
--6. 'JONES'가 소속되어있는 부서의 모든 사람의 사원번호, 이름, 입사일, 급여를 출력하세요.
SELECT
		EMPNO,
		ENAME,
		HIREDATE,
		SAL
  FROM	EMP
 WHERE	DEPTNO = 	(
 						SELECT
 								DEPTNO
 						  FROM	EMP
 						 WHERE	ENAME = 'JONES'
 					);
 				
 				
 				
--7. 전체사원의 평균임급보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를 출력하세요.
SELECT
		A.EMPNO,
		A.ENAME,
		B.DNAME,
		B.LOC,
		A.SAL
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	SAL > 	(
 					SELECT
 							AVG(SAL)
 					  FROM	EMP
 				);
 			
 			

--8. 10번 부서의 사원들 중, FORD와 같은 업무를 하는 사원의 사원번호, 이름, 업무, 부서명, 입사일, 지역을 출력하세요.
--SELECT
--		JOB
--  FROM	EMP
-- WHERE	ENAME = 'FORD';
SELECT
		A.EMPNO,
		A.ENAME,
		A.JOB,
		B.DNAME,
		A.HIREDATE,
		B.LOC
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	A.JOB = (
 					SELECT
 							JOB
 					  FROM	EMP
 					 WHERE	ENAME = 'FORD'
 				);
 				
 			
--9. 10번 부서의 사원들 중, 30번 부서에는 없는 업무를 하는 사원들의 사원번호, 이름, 부서명, 입사일, 지역을 출력하세요.
SELECT
		A.EMPNO,
		A.ENAME,
		B.DNAME,
		A.HIREDATE,
		B.LOC
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	A.JOB NOT IN 	(
 							SELECT
 									JOB
 							  FROM	EMP
 							 WHERE	DEPTNO = 30
 						);
 					
 					
--10. 10번 부서와 같은 일을 하는 사원의 사원번호, 이름, 부서명, 지역, 급여를 급여가 많은 순으로 출력하라.
SELECT
		A.EMPNO,
		A.ENAME,
		B.DNAME,
		B.LOC,
		A.SAL
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	A.JOB IN 	(
 						SELECT
 								JOB
 						  FROM	EMP
 						 WHERE	DEPTNO = 10
 					)
 ORDER	BY A.SAL DESC;



 

 			

 			
 			
 			

 