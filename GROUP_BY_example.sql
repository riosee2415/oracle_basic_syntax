-- GROUP BY 문제--

-- 예제 1 : 사원 테이블을 부서 번호로 그룹지어 출력하시오.
SELECT
        A.DEPTNO
  FROM  EMP A
 GROUP  BY  A.DEPTNO;
 
 

-- 예제 2 : 부서번호 별 급여 평균을 구하시오.
SELECT
        A.DEPTNO,
        TRUNC(AVG(A.SAL)) AS AVG_SAL
  FROM  EMP A
 GROUP  BY  A.DEPTNO
 ORDER  BY  A.DEPTNO    ASC;
 

--예제 3 : 부서 별 급여 총액과 급여 평균액을 구하시오.
SELECT
        DEPTNO,
        SUM(SAL) AS SUM_SAL,
        TRUNC(AVG(SAL)) AS AVG_SAL
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 
--예제 4 : 소속부서 별 최대급여와 최소급여를 출력하시오.
SELECT
        DEPTNO,
        MAX(SAL) AS MAX,
        MIN(SAL) AS MIN
  FROM  EMP
 GROUP  BY  DEPTNO;
 

-- 예제 5 : 부서별 사원의 수와 커미션을 받는 사원의 수를 계산하여 출력하시오.
SELECT
        DEPTNO,
        COUNT(EMPNO)    AS CNT_EMP,
        COUNT(COMM)     AS CNT_COMM
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 