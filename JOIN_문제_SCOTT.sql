--문제1) 모든 사원의 이름, 부서번호, 부서이름을 출력하세요 (EMP, DEPT)
SELECT
        A.ENAME,
        A.DEPTNO,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;
    
    

--문제2) 업무가 MANAGER인 사원의 정보, 이름, 업무, 부서명, 근무지 순으로 출력하시오. (EMP, DEPT)
SELECT
        A.ENAME,
        A.JOB,
        B.DNAME,
        B.LOC
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO;



--문제3) 근무지가 CHICAGO인 사원의 이름, 업무, 부서번호, 부서이름을 출력하세요.
SELECT
        A.ENAME,
        A.JOB,
        B.DEPTNO,
        B.DNAME
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  B.LOC = 'CHICAGO';


--문제4) 근무지별 근무하는 사원수가 5명 이하인 경우,
--      인원이 적은 도시 순으로 정렬하시오.
--      (근무지 0인 곳도 표시)
SELECT
        B.LOC             AS 근무지,
        COUNT(A.EMPNO)    AS 인원
  FROM  DEPT    B
  LEFT  OUTER
  JOIN  EMP    A
    ON  A.DEPTNO     = B.DEPTNO
 GROUP  BY B.LOC
HAVING  COUNT(A.EMPNO) <= 5
 ORDER  BY 1;
 
 
 
 
--문제5) 사원의 이름 및 사원 번호를 관리자의 이름과 관리자 번호와 함께 표시하고, 각각 열 레이블은
--      EMPLOUEE, EMP#, MANAGER, MGR# 으로 지정하세요.
SELECT
        A.ENAME     AS EMPLOYEE,
        A.EMPNO     AS EMP#,
        B.EMPNO     AS MANAGER,
        B.ENAME     AS MGR#
  FROM  EMP     A
 INNER
  JOIN  EMP     B
    ON  B.MGR   = A.EMPNO;
    
    

--문제6) 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 
--      관리자의 이름 및 입사일과 함꼐 표시하고,
--      열 레이블을 각각 employee, emp hired, manager, mgr gired로 지정한다.
SELECT
        A.ENAME     AS employee,
        A.HIREDATE  AS "emp hired",
        B.ENAME     AS manager,
        B.HIREDATE  AS "mgr hired"
  FROM  EMP A
 INNER
  JOIN  EMP B
    ON  A.EMPNO     = B.MGR
   AND  A.HIREDATE  < B.HIREDATE;
   
   
   
--문제7) 사원의 이름 및 사원번호를 관리자의 이름과 관리자 번호와 함께 표시하고
--      각각의 열 레이블은 employee, emp#, manager, mgr#
--      king을 포함하여 관리자가 없는 모든 사원을 표시하도록 하고
--      결과를 사원번호 기준으로 정렬
SELECT
        A.ENAME     AS employee,
        A.EMPNO     AS emp#,
        B.ENAME     AS manager,
        B.EMPNO     AS mgr#
  FROM  EMP A
  LEFT  OUTER
  JOIN  EMP B
    ON  A.EMPNO     = B.MGR
 ORDER  BY 2;
 
 
 
--문제8) 10번 부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하세요.
SELECT
        A.DEPTNO,
        B.DNAME,
        A.ENAME,
        A.SAL,
        C.GRADE
  FROM  EMP         A
  LEFT  OUTER
  JOIN  DEPT        B
    ON  A.DEPTNO    = B.DEPTNO
  JOIN  SALGRADE    C
    ON  SAL >= C.LOSAL
   AND  SAL <= C.HISAL
   AND  A.DEPTNO    = 10
   