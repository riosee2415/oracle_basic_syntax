select 
    ename,
    deptno
from emp;


select 
    deptno,
    dname
from dept;


-- Equi Join :  동일 컬럼을 기준으로 조인
-- Non-Equi-Join : 동일컬럼 없이 다른 조건을 사용하여 조인
-- Outer Join : 조인 조건에 만족하지 않는 행도 출력
-- Self Join :  한 테이블 내에서 조인


--Equi Join
-- 조인대상이 되어지는 두 테이블에서 공통적으로 존재하는 컬럼의 값이 일치되는 행을 연결

select 
    *
from emp, dept
where emp.deptno = dept.deptno;



select
    emp.ename,
    dept.dname,
    dept.deptno
from emp, dept
where emp.deptno = dept.deptno
AND ename = 'SCOTT';



-- 뉴욕에서 근무하는 사원의 이름과 급여를 출력하시오.
select * from emp;
select * from dept;

select
    e.ename,
    e.sal
from emp e, dept d
where e.deptno = d.deptno
AND lower(d.loc) = 'new york';


select
    e.ename,
    e.hiredate
from emp e, dept d
where e.deptno = d.deptno
and d.dname = 'ACCOUNTING';



--Non Equi Join
--조인 조건에 특정 범위 내에 있는지를 조사하기 위해서 WHERE 절에 조인조건을 = 연산자 이외의
--비교연산자를 사용합니다.

select * from salgrade;

select
    ename,
    sal,
    grade
from emp, salgrade
where sal between losal and hisal;



--Self Join
--조인은 두 개 이상의 서로 다은 테이블을 서로 연결하는 것 뿐만 아니라
--하나의 테이블 내에서 조인을 해야만 원하는 자료를 얻는 경우
--자기 자신과 조인을 맺는 것

--Example -> emp table
select
    e1.ename,
    e2.sal
from emp e1, emp e2
where e1.empno = e2.empno;

--SMITH의 매니저 이름이 무엇인지 알아내세요.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno
and lower(e1.ename) = 'smith';


-- MANAGER가 KING인 사람들의 이름과 직급을 출력하시오.
select * from emp;

select
    e1.ename,
    e1.job
from emp e1, emp e2
where e1.mgr = e2.empno
and e2.ename = 'KING';



-- SCOTT과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.deptno = e2.deptno
and  e1.ename = 'SCOTT';

--OUTER JOING // ANSI JOING


select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;
-- 위 QUERY에서 KING이 제외 됨 -> MGR이 없기 때문에 값에서 배제
-- 위와 같이 JOIN 조건을 만족하지 못하더라도 로우를 나타내고 싶을 때
-- OUTER 조인을 사용합니다.
select
    e1.ename,
    e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+); 


-- 사원테이블과 부서테이블을 조인하여 사원이름과 부서번호와 부서명을 출력하도록 합시다.
-- 부서 에티블의 40번 부서와 조인할 사원 테이블의 부서번호가 없지만, 아래 그림과 같이 40번 부서도
-- 출력하세요.
select * from dept;

select
    e.ename,
    d.deptno,
    d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- ANSI Cross Join
select 
    *   
from emp inner join dept on emp.deptno = dept.deptno
where emp.ename = 'SCOTT';





