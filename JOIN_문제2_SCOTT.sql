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
   
   
   
--문제4) 커미션을 받는 사원의 이름과 그가 속한 부서명, 커미션을 출력하세요.
--      단, 0원의 커미션을 받는 사원은 제외합니다.
SELECT
        A.ENAME,
        B.DNAME,
        A.COMM
  FROM  EMP     A
 INNER 
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.COMM IS NOT NULL
   AND  A.COMM <> 0;
   
   
   
--문제5) 뉴욕에 근무하는 사원의 사원번호, 이름, 급여, 근무지를 출력하세요.
SELECT * FROM DEPT;

SELECT
        A.EMPNO,
        A.ENAME,
        A.SAL,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.LOC       = 'NEW YORK';
   
   
   
--문제6) 급여가 1200이하인 사원들의 사원번호, 이름, 급여, 근무지를 출력하세요.
SELECT
        A.EMPNO,
        A.ENAME,
        A.SAL,
        B.LOC
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       <= 1200;
   
   
   
