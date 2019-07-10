--1. EMP테이블에서 이름, 급여, 커미션 금액, 급여총액(sal + comm)을 구하여 총액이 많은 순서로 출력하시오.
-- ※ order by 는 alias로 지정하는것이 좋음 
SELECT
        ENAME               AS "이름",
        SAL                 AS "급여",
        NVL(COMM, 0)        AS "커미션 금액",
        SAL + NVL(COMM, 0)  AS "급여총액"        
  FROM  EMP
 ORDER  BY  급여총액 DESC;
 
 
 
--2. EMP 테이블에서 10번 부서의 모든 사원들에게 급여의 15%를 보너스로 지불하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하시오.
-- X 급여와 보너스금액을 각각 구해야함 , 

SELECT
        ENAME,
        SAL,
        CASE DEPTNO
                WHEN 10 THEN SAL * 0.15
                ELSE 0
        END AS BONUS,
        DEPTNO
  FROM  EMP;
  
  
  
--3. EMP 테이블에서 30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하시오.
SELECT  
        ENAME,
        DEPTNO,
        SAL * 12 AS ySAL
  FROM  EMP
 WHERE  DEPTNO = 30;
 
 
 
--4. EMP 테이블에서 부서번호가 20인 부서의 시간당 임금을 계산하여 이름,급여,시급(소수점 2번째 자리에서 반올림)을 출력하시오.
-- X. 시급계산이 잘못됨 . 문제아래에 근무일수 , 근무시간이 표기되어있음 , 
/*
    ANSER : 실제 급여 계산 시, LAST_DAY 내장함수로 해당 월의 말일을 추출하여 계산합니다.
*/
-- 만약에 근무일수가 정해져있지 않은경우도 한달일수가 다르기때문에 일수를 30으로 정하여 나누면 안됨, 

SELECT
        ENAME,
        SAL,
        ROUND((SAL / 12 / 5), 2) AS hourSAL
  FROM  EMP
 WHERE  DEPTNO = 20;
 
 

--5. EMP 테이블에서 급여가 1,500부터 3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다.
--   회비를 많이 내는 순으로 하여 모든 사원의 이름, 사원번호, 급여, 회비(소수점 두번째 자리에서 반올림)를 출력하시오.
-- X 정렬 누락됨

SELECT
        ENAME,
        EMPNO,
        SAL,
        CASE WHEN (SAL >= 1500 AND SAL <= 3000) THEN SAL * 0.15
             ELSE 0
        END AS mPay
  FROM  EMP
 ORDER  BY mPay DESC;
  
 
 
--6. EMP테이블에서 입사일부터 현재까지의 근무일수를 군무일수가 적은순으로 
--  이름, 근무일수, 부서번호, 입사일, 현재일을 아래 형식으로 출력하시오 ((소수점 이하는 버림))
SELECT
        ENAME AS "사원명",
        TRUNC(SYSDATE - HIREDATE) || '일'   AS "근무일수",
        TO_CHAR(HIREDATE, 'YYYY.MM.DD')     AS "입사일",
        TO_CHAR(SYSDATE, 'YYYY.MM.DD')      AS "현재일"
  FROM  EMP;
  
  

--7. EMP테이블에서 사원이름, 입사일, 급여, 입사일로부터 90일 후의 날짜를 출력하시오.
SELECT  
        ENAME           AS "사원이름",
        HIREDATE        AS "입사일",
        SAL             AS "급여",
        HIREDATE + 90   AS "90일 경과"
  FROM  EMP;
  

--8. EMP테이블에서 사원이름, 입사일, 급여, 입사일로부터 6개월 후의 날짜를 출력하시오.
SELECT  
        ENAME                     AS "사원이름",
        HIREDATE                  AS "입사일",
        SAL                       AS "급여",
        ADD_MONTHS(HIREDATE, 6)   AS "6개월 경과"
  FROM  EMP;
  
  

--9. EMP 테이블에서 입사한 달의 근무일수를 계산하여 사원별 부서번호, 이름, 근무일수를 출력하시오.
SELECT  
        ENAME                           AS "사원이름",
        DEPTNO                          AS "부서번호",
        LAST_DAY(HIREDATE) - HIREDATE   AS "근무일수"
  FROM  EMP;
  
  

--10. EMP테이블에서 이름을 FIRST NAME의 첫 글자와 LAST NAME의 첫 글자를 소문자로 변경하여 모든 가족의 이름을 같은 포멧으로 변경하시오. 

SELECT
        INSTR(NAME, ' '),
        LOWER(SUBSTR(NAME, 1, 1)) || SUBSTR(NAME, 2, INSTR(NAME, ' ')-1) || LOWER(SUBSTR(NAME, INSTR(NAME, ' '), 2)) || SUBSTR(NAME,  INSTR(NAME, ' ')+2)
  FROM  EMPFAMILY;
  
  
--11. 아래와 같은 결과가 나오도록 쿼리를 작성하시오 (EMPDETAIL)

SELECT * FROM EMPDETAIL;

SELECT
        EMPNO,
        JUSO1 ||  SUBSTR(JUSO2, 1, INSTR(JUSO2, ' '))|| LPAD(SUBSTR(JUSO2, -(LENGTH(JUSO2) - INSTR(JUSO2, ' '))), 5 , 0) AS NEW_JUSO
  FROM  EMPDETAIL;
  
  
  
  
--12. EMPDETAIL 테이블에서 우편변호와 주민버호를 아래형식으로 EMPNO, POSTNO, JUMIN_NO, 남여 구분을 출력하시오 
--(주민번호 7번째 자리 기준 남녀 구분)


SELECT
        EMPNO,
        SUBSTR(POSTNO,1, 3) || '-' || LPAD(SUBSTR(POSTNO, 4), 3, 0) AS POSTNO,
        SUBSTR(EXT, 1, 6) || '-' || SUBSTR(EXT, 7, 1) ||  REGEXP_REPLACE(SUBSTR(EXT, 8), '[0-9]', '*') AS JUMIN_NO,
        CASE TO_CHAR(SUBSTR(EXT, 7, 1)) -- ※ EXT가 VARCHAR2형이기 때문에 TO_CHAR를 쓸필요가 없음 ,
                WHEN '1' THEN '남'
                WHEN '2' THEN '여'
        END AS "남여구분"
  FROM  EMPDETAIL;
  
  
  
--13. EMPDETAIL 테이블에서 주민등록번호를 이용하여 현재 나이가 23~25사이인 사원의 사원번호, 주민번호, 나이가 적은 순서대로 출력하시오.
SELECT
        EMPNO,
        EXT,
        AGE
  FROM  (SELECT
                EMPNO,
                EXT,
                TO_CHAR(SYSDATE, 'YYYY') - ('19' || SUBSTR(EXT, 1, 2)) AS AGE
          FROM  EMPDETAIL)
 WHERE AGE >= 23
   AND AGE <= 25; 
   
   
   
--14. 각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하시오.
SELECT  
        DEPTNO,
        MAX(SAL),
        MIN(SAL),
        AVG(SAL),
        COUNT(*)
  FROM  EMP
 GROUP  BY DEPTNO;
  
  
  
--15. 각 부서별 같은 직무를 하는 사원의 수가 3명 이상인 부서, 업무, 인원수를 출력하시오.
SELECT
        DEPTNO,
        JOB,
        COUNT(*)
  FROM  EMP
 GROUP  BY DEPTNO, JOB
HAVING  COUNT(*) >= 3;




--16. 부서의 급여 평균이 2000 이상인 부서의 부서번호, 급여평균, 최고급여를 출력하시오.
-- X. 최고급여 컬럼 누락됨, 평균 구할때 NULL 체크 

SELECT
        DEPTNO,
        AVG(NVL(SAL, 0))    AS AVGSAL,
        MAX(NVL(SAL, 0))    AS MAXSAL
  FROM  EMP
 GROUP  BY  DEPTNO
HAVING  AVG(SAL) >= 2000;




--17. 3명 이상의 사원을 관리하는 상급자의 사원번호를 출력하시오.
SELECT 
        B.EMPNO,
        COUNT(*)
  FROM  EMP A, EMP  B
 WHERE  A.MGR = B.EMPNO
 GROUP  BY B.EMPNO
 HAVING COUNT(*) >= 3;
 
 
 
-- 18. EMPFAMILY 테이블에서 사원별로 가족구성원이 3명 이상 되는 사원의 가족번호, 가족구성원수, 최고령자를 가족구성원이 많은 순서대로 출력하시오.
-- X. 정렬 누락됨 

SELECT
        EMPNO,
        COUNT(*)||'명'  AS CNT,
        MAX(AGE)        AS AGE
  FROM  EMPFAMILY
 GROUP  BY EMPNO
HAVING  COUNT(*) >= 3
 ORDER  BY CNT DESC;



--19. EMP테이블에서 가족이 없는 사원의 이름, 사원번호, 부서번호를 출력하시오. 
-- X. 컬럼 누락됨 , (사원이름, 부서번호)

SELECT
        A.EMPNO,
        A.ENAME,
        A.DEPTNO
  FROM  EMP     A
 INNER 
  JOIN  (
        SELECT
                EMPNO
          FROM  EMP
         MINUS
        SELECT
                EMPNO
          FROM  EMPFAMILY
         GROUP  BY EMPNO
         )      B
    ON  A.EMPNO = B.EMPNO;



--20. 부서별 각 직무에 종사하는 사원의 수를 아래 형식으로 출력하시오. 
-- X. CASE 문 이용해서 다시 풀어보세요 ! 

SELECT
        *
      FROM  (   
                SELECT 
                        DEPTNO, 
                        JOB
                  FROM  EMP 
            )
     PIVOT  (
                COUNT(*)
                FOR JOB IN ('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST') 
            );
  
/*******************************************************************/
 SELECT
        DEPTNO,
        COUNT(CASE JOB WHEN 'CLERK' THEN 1 END)||'명' AS CLERK_CNT,
        COUNT(CASE JOB WHEN 'SALESMAN' THEN 1 END)||'명' AS SALESMAN_CNT,
        COUNT(CASE JOB WHEN 'PRESIDENT' THEN 1 END)||'명' AS PRESIDENT_CNT,
        COUNT(CASE JOB WHEN 'MANAGER' THEN 1 END)||'명' AS MANAGER_CNT,
        COUNT(CASE JOB WHEN 'ANALYST' THEN 1 END)||'명' AS ANALYST_CNT
  FROM  EMP
 GROUP  BY  DEPTNO;




--21. EMPFAMILY에서 연령대별 가장높은 연봉과 가장 낮은 연봉을 아래와 같은 포멧으로 출력하시오.
-- X.  CASE문, MAX, MIN, || 이용해서 다시 풀어보세요 !! 
/*
    못풀겠어요
*/
SELECT 
        TO_CHAR(MAX(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')  AS AGE20,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')  AS AGE30,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')  AS AGE40,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')  AS AGE50,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '6%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '6%' THEN SAL ELSE NULL END),'999,999')  AS AGE60,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')  AS AGE70                     
  FROM  EMPFAMILY;


