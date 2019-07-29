
--문제1. 사원의 번호, 이름, 급여, 부서번호를 출력하세요.
SELECT
		EMPNO,
		ENAME,
		SAL,
		DEPTNO
  FROM	EMP;
  
 
 
--문제2. 사원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순으로 출력하세요.
--		(단, 커미션이   null인 사원도 0으로 해서 포함하세요.)
SELECT
 		ENAME				AS 사원명,			
 		SAL					AS 급여,
 		NVL(COMM, 0)		AS 커미션,
 		SAL+NVL(COMM, 0)	AS 총액
  FROM	EMP
 ORDER	BY	SAL+NVL(COMM, 0) DESC;
  
 
 
--문제3. 10번 부서의 모든 사원에게 급여의 13%를 보너스로 지불하기로 하였다.
--		이름, 급여, 보너스금액, 부서번호를 출력하세요.
SELECT
		ENAME				AS 사원명,
		SAL					AS 급여,
		SAL * 0.13			AS 보너스금액,
		DEPTNO				AS 부서번호
  FROM	EMP
 WHERE	DEPTNO	= 10;
 


--문제4. 급여가  $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
--		해당하는 사원의 이름, 급여, 회비(소수 이하2에서 반올림)를 출력하세요.
SELECT
		ENAME					AS 사원명,
		SAL						AS 급여,
		ROUND(SAL * 0.15, 1)	AS 회비
  FROM	EMP
 WHERE	SAL	>= 1500
   AND	SAL <= 3000;
  


--문제5. 부서번호, 이름, 입사일, 현재일, 입사일부터 현재까지의 근무일수(소수점 이하 절삭), 근무년수, 근무월수를 출력하세요.
SELECT
		DEPTNO													AS 부서번호,
		ENAME													AS 사원명,
		HIREDATE												AS 입사일,
		TRUNC(SYSDATE-HIREDATE)									AS 근무일수,
		TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(HIREDATE, 'YYYY')	AS 근무년수,
		TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))				AS 근무개월수
  FROM	EMP;


 
 
--문제6. 입사일로부터 90일이 지난 후의 날짜를 계산해서 이름, 입사일, 90일 후의 날짜, 급여를 출력하세요.
--		(모든 날짜는 표현 형식은 '2019_07_30' 으로 하며, Alias는 사원명, 입사일, 전환일로 하세요.)
SELECT
		ENAME									AS 사원명,
		TO_CHAR(HIREDATE, 'YYYY_MM_DD')			AS 입사일,
		TO_CHAR(HIREDATE + 90, 'YYYY_MM_DD')	AS 전환일
  FROM	EMP;
 
 
 

--문제7. 모든 사원의 입사한 월의 마지막날을 구하여 입사한 월의 근무일수를 구하세요.
--		사원번호, 사원명, 입사일, 입사한월근무일 을 출력하세요.
--		(모든 날짜는 표현 형식은 '2019_07_30' 으로 한다)
SELECT
		EMPNO									AS 사원번호,
		ENAME									AS 사원명,		
		TO_CHAR(HIREDATE, 'YYYY_MM_DD')			AS 입사일,
		LAST_DAY(HIREDATE) - HIREDATE			AS 입사한월근무일
  FROM	EMP;
  


--문제 8. 모든 사원의 사원번호, 사원명, 급여, 입사일을 출력하세요.
--		단, 모든 사원명을 소문자로 출력하고, 날짜 출력 형식은 '2019/07/30' 으로 하세요.
--		Alias는 사원번호, 사원명, 급여, 입사일
SELECT
		EMPNO									AS 사원번호,
		LOWER(ENAME)							AS 사원명,
		SAL										AS 급여,
		TO_CHAR(HIREDATE, 'YYYY/MM/DD')			AS 입사일
  FROM	EMP;
 

--문제9. 사원이름에 'E'가 들어가는 사원의 사원번호, 사원명, 급여, 커미션, 부서번호를 출력하세요.
--		단, 급여를 기준으로 내림차순 정렬 , 커미션이 없는 직원은 0으로 처리
SELECT
		EMPNO,
		ENAME,
		SAL,
		NVL(COMM, 0),
		DEPTNO
  FROM	EMP
 WHERE	ENAME LIKE '%S%';



--문제10. 모든 사원의 사원번호, 사원명, 직급, 급여, 커미션 , 연봉을 출력하세요.
--		COMM이 null일 경우 0으로 표현 / 연봉은 급여*12 + 커미션  
--		Alias는 사원번호, 사원명, 직급, 급여, 커미션, 연봉
SELECT
		EMPNO							AS 사원번호,
		ENAME							AS 사원명,
		JOB								AS 직급,
		SAL								AS 급여,
		NVL(COMM, 0)					AS 커미션,
		SAL * 12 + NVL(COMM, 0)			AS 연봉
  FROM	EMP;
		
 
 
--문제11. 모든 사원의 사원번호, 사원명, 급여, 커미션을 출력하세요.
--		단, 커미션이 null 인 사원은 'not comm' 으로 출력하세요.
--		Alias는 사원번호, 사원명, 급여, 커미션
-- 		급여가 낮은순으로 정렬
SELECT
		EMPNO								AS 사원번호,
		ENAME								AS 사원명,
		SAL									AS 급여,
		NVL(TO_CHAR(COMM), 'NOT COMM')		AS 커미션
  FROM	EMP
 ORDER	BY SAL;
 
 
 
 
 
 
 
 
 


