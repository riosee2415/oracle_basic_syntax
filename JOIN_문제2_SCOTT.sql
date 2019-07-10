--문제1) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명을 출력하세요.
SELECT
        A.ENAME,
        B.DNAME
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;
    
    
    
--문제2) 직급이 MANAGER인 사원의 이름, 직급, 부서명을 출력하세요.
SELECT
        A.ENAME,
        A.JOB,
        B.DNAME
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.JOB       = 'MANAGER';
    
   
   
--문제3) ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하세요.
SELECT
        A.ENAME,
        A.HIREDATE
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.DNAME     = 'ACCOUNTING';
   
   
   
--문제4) 커미션을 받는 사원의 이름과 그가 속한 부서명을 출력하세요.
