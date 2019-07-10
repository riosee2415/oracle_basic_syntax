--문제1) EMP테이블에서 BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자를 출력하세요.
SELECT
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  DEPTNO  = (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME   = 'BLAKE'
                  );
                  
                  
--문제2) EMP테이블에서 평균 급여 이상을 받는 모든 직원에 대해서 직원번호와 이름을 출력하세요.
SELECT
        ENAME,
        EMPNO
  FROM  EMP
 WHERE  SAL >=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                );
                
                
--문제3) EMP 테이블에서 이름에 'T'가 있는 사원이 근무하는 부서에서 근무하는 모든 사원에 대해
--      사원번호, 이름, 급여를 출력하세요.
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  DEPTNO IN  (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME LIKE '%T%'
                    );
                    
                    
                    
--문제4) EMP테이블에서 부서위치가 'dallas'인 모든 사원에 대해 이름, 업무, 급여를 출력하세요.
SELECT
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  DEPTNO  IN   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  LOC = 'DALLAS'
                    );
  


--문제5) EMP테이블에서 KING에게 보고하는 모든 사원의 이름과 급여를 출력하세요.
SELECT
        ENAME,
        SAL
  FROM  EMP
 WHERE  MGR =   (
                SELECT
                        EMPNO
                  FROM  EMP
                 WHERE  ENAME = 'KING'
                );
                
                
                
--문제6) EMP테이블에서 SALES부서 사원의 이름, 업무를 출력하는 SELECT문을 작성하시오.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  DEPTNO  =   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  DNAME   = 'SALES'
                    );
                    
                    

--문제7) EMP테이블에서 월급이 30번 부서의 최저월급보다 높은 사원의 사원번호, 사원명, 업무, 급여, 부서번호를 출력하세요.
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  SAL >=  (
                SELECT
                        MIN(SAL)
                  FROM  EMP
                 WHERE  DEPTNO = 30
                );
  


--문제8) EMP테이블에서 20번 부서의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력하세요.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  JOB IN   (
                SELECT
                        JOB
                  FROM  EMP
                 WHERE  DEPTNO = 20
                );
                
                

--문제9) EMP테이블에서 FORD와 업무, 부서가 같은 사원번호, 사원명, 업무, 급여, 부서번호를 출력하세요.
--        (FORD는 제외)
SELECT
        EMPNO,
        ENAME,
        JOB,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE  DEPTNO  =   (
                    SELECT
                            DEPTNO
                      FROM  EMP
                     WHERE  ENAME = 'FORD'
                    )
   AND  JOB     =   (
                    SELECT
                            JOB
                      FROM  EMP
                     WHERE  ENAME = 'FORD'
                    )
   AND  ENAME   <> 'FORD';
   
   
   

--문제10) EMP테이블에서 업무가 JONES와 같거나 월급이 FORD 이상인 사원의 이름, 업무, 부서번호, 급여를 출력하세요.
--        단, 업무별 월급이 많은 순으로 출력하세요.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        SAL
  FROM  EMP
 WHERE  JOB =   (
                SELECT
                        JOB
                  FROM  EMP
                 WHERE  ENAME   =   'JONES'
                )
   OR   SAL >=  (
                SELECT
                        SAL
                  FROM  EMP
                 WHERE  ENAME   =   'FORD'
                );
                
                

--문제11) EMP테이블에서 SCOTT또는 WARD와 월급이 같은 사원의 이름, 업무, 급여를 출력하세요.
SELECT
        ENAME,
        JOB,
        SAL
  FROM  EMP
 WHERE  SAL IN  (
                SELECT
                        SAL
                  FROM  EMP
                 WHERE  ENAME IN  ('SCOTT', 'WARD')
                );
                
                
                
--문제12) EMP테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력하세요.
SELECT
        ENAME,
        JOB
  FROM  EMP
 WHERE  DEPTNO =   (
                    SELECT
                            DEPTNO
                      FROM  DEPT
                     WHERE  LOC = 'CHICAGO'
                    );
                    
                    
                    
                    
--문제13) EMP테이블에서 부서별로 월급이 평균 월급보다 높은 사원의 부서번호, 이름, 급여, 부서명를 출력하세요.
SELECT
        A.DEPTNO,
        A.ENAME,
        A.SAL,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  SAL >=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                )
 ORDER  BY DEPTNO;
 
 
 
--문제14) EMP테이블에서 업무별로 급여가 평균보다 낮은 사원의 부서번호, 이름, 급여, 부서명을 출력하세요
SELECT
        A.DEPTNO,
        A.ENAME,
        A.SAL,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  SAL <=  (
                SELECT
                        AVG(SAL)
                  FROM  EMP
                )
 ORDER  BY DEPTNO;
 
 
 
 
--문제15) EMP테이블에서 적어도 한명이상으로부터 보고받을 수 있는 사람의 업무, 이름, 사원번호, 부서번호를 출력하세요.
SELECT
        JOB,
        ENAME,
        EMPNO,
        DEPTNO
  FROM  EMP A
 WHERE  exists  (
                SELECT
                        EMPNO
                  FROM  EMP B
                 WHERE  A.EMPNO = B.MGR
                );
                
                

--문제16) EMP테이블에서 업무가 'CLERK'인 사원의 사원번호, 이름, 업무, 부서번호를 출력하세요.
SELECT
        ENAME,
        JOB,
        DEPTNO
  FROM  EMP
 WHERE  JOB = 'CLERK';