--문제1) 부서별로 평균 급여보다 높은 급여를 받는 사원의 사원번호, 사원명, 직급, 급여, 부서명, 근무지를 출력하시오.

-- 1-1) 서브 쿼리로 풀기
SELECT
        A.EMPNO,
        A.ENAME,
        A.JOB,
        A.SAL,
        B.DNAME,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       >   (
                            SELECT  
                                    TRUNC(AVG(SAL))
                              FROM  EMP     Z
                             WHERE  A.DEPTNO   = Z.DEPTNO
                             GROUP  BY  DEPTNO
                        );
                        
                        
                        
--문제1-2) 인라인 뷰로 풀기
SELECT  
        ROWNUM AS RANK,
        Z.*
  FROM  (
            SELECT
                    A.EMPNO,
                    A.ENAME,
                    A.JOB,
                    A.SAL,
                    B.DNAME,
                    B.LOC
              FROM  EMP     A
             INNER
              JOIN  DEPT    B
                ON  A.DEPTNO = B.DEPTNO
               AND  SAL >   (
                                SELECT
                                        AVG(SAL)
                                  FROM  EMP A2
                                 WHERE  A2.DEPTNO = A.DEPTNO
                                 GROUP  BY DEPTNO
                            )
             ORDER  BY  SAL DESC
        ) Z;
       
            
 /*
    서브쿼리 조건연산자
    - ANY    : 서브쿼리에 의해 리턴되는 각각의 값과 조건을 비교하여 하나 이상을 만족하면 참 이다.
    - SOME   : 서브쿼리에 의해 리턴되는 각각의 값과 조건을 비교하여 하나 이상을 만족하면 참 이다.  
    - ALL    : 값을 서브쿼리에 의해 리턴되는 모든 값과 조건값을 비교하여 모든 값이 만족해야만 참이다.
    - EXISTS : 메인 쿼리의 비교 조건이 서브쿼리의 결과 중에서 만족하는 값이 하나라도 존재하면 참이다.
    
    
 */
    
 
 
--문제2) 업무가 MANAGER인 어떤 사원보다 급여를 많이 받는 사원의 사원번호, 사원명, 직급, 급여, 부서번호를 출력하세요.
--      서브 쿼리 사용
SELECT  
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  SAL   > ANY (
                        SELECT
                                SAL
                          FROM  EMP
                         WHERE  JOB     = 'MANAGER'
                    )
   AND  JOB <> 'MANAGER';
                    
                    
   
   
--문제3) 부서번호가 30인 어떤 사원보다도 먼저 입사한 사원의 사원번호, 사원명, 입사일을 출력하세요.
SELECT
        EMPNO,
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  HIREDATE    < SOME  (
                                SELECT
                                        HIREDATE
                                  FROM  EMP
                                 WHERE  DEPTNO = 30
                            )
   AND  DEPTNO <> 30;




--문제4) JOB이 'ANALYST'인 모든 사원보다 급여를 많이 받는 타 업무의 사원의 사원번호, 사원명, 업무, 급여를 출력하라.
SELECT  
        EMPNO,
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  SAL     > ALL   (
                            SELECT
                                    SAL
                              FROM  EMP
                             WHERE  UPPER(JOB) = 'ANALYST'
                        );





--문제5) EMP 테이블에서 ENAME, ROWNUM을 출력하세요. SAL 기준으로 내림차순 정렬을 하고, 1번 부터 5번 까지 조회하세요.
SELECT
        ROWNUM RN,
        Z.*
  FROM  (
            SELECT
                    ENAME
              FROM  EMP
             ORDER  BY SAL DESC
        ) Z
 WHERE  ROWNUM <= 5;
        
 
 
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        COMM
  FROM  EMP;
   
   

SELECT
        DEPTNO,
        LISTAGG(JOB, ', ') WITHIN GROUP ( ORDER BY DEPTNO ) AS JOB
  FROM  EMP
 GROUP  BY  DEPTNO;
  
 
 
/*
    LISTAGG(가져올 칼럼, 구분자) WITHIN GROUP ( ORDER BY 순서컬럼 )

*/

SELECT
        DEPTNO,
        LISTAGG(ENAME, ',  ') WITHIN GROUP (ORDER BY DEPTNO) AS NAME
  FROM  EMP
 GROUP  BY DEPTNO;



SELECT
        DEPTNO,
        LISTAGG(JOB, ',  ') WITHIN GROUP( ORDER BY DEPTNO ) AS JOB
  FROM  EMP
 GROUP  BY DEPTNO;
  