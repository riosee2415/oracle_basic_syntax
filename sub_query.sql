--서브쿼리의 기본 개념
--SCOTT의 부서명을 알아내기 위한 subQuery

select
    dname
from dept
where deptno = (
                select
                    deptno
                from emp
                where ename='SCOTT'
                );
                
    
    

--SCOTT과 같은 부서에서 근무하는 사원의 이름과 부서 번호를 출력하는 SQL문을 작성해보시오.
select
    ename,
    deptno
from emp
where deptno = ( select
                    deptno
                from emp
                where ename='SCOTT');
                
                
-- SCOTT과 동일한 직급을 가진 사원을 출력하는 SQL문을 작성해보시오.
select
    ename
from emp
where job = (select 
                job
            from emp
            where ename='SCOTT');
            


-- SCOTT의 급여와 동일하거나 더 많이 받는 사원 명과 급여를 출력하시오.
select
    ename,
    sal
from emp
where sal >= (select
                sal
            from emp
            where ename='SCOTT');
            

-- DALLAS에서 근무하는 사원의 이름, 부서 번호를 출력하시오.
select
    ename,
    deptno
from emp
where deptno = (select deptno from dept where loc='DALLAS');


--SALES 부서에서 근무하는 모든 사원의 이름과 급여를 출력하시오.
select
    ename,
    sal
from emp
where deptno = (select deptno from dept where dname='SALES');


-- 다중형 Sub_Query
-- SubQuery에서 그룹함수 사용 법 / 다중 행 SubQuery

-- 10번 부서에 근무하는 사원의 이름과 10번 부서의 부서명을 출력
select
    e.ename,
    d.dname
from emp e, dept d
where e.deptno = d.deptno
and d.deptno = 10;

select 
    e.ename,
    d.dname
from emp e, (select deptno, dname from dept where deptno=10) d
where e.deptno = d.deptno;


-- 평균급여를 구하는 쿼리문을 서브쿼리로 사용하여 평균 급여보다 더 많은 급여를 받는 사원을 검색하는 문장은 다음과 같습니다.
select 
    ename,
    sal
from emp
where sal > (select avg(sal) from emp);

-- 다중행 서브쿼리 : 서브쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용되는 서브쿼리
-- 다중행 서브쿼리는 반드시 다중행 연산자를 사용해야 한다.




-- mgr이 'KING'인 사원의 이름과 급여를 출력하시오.
select
    ename,
    sal
from emp
where mgr = (select empno from emp where ename='KING');



-- 3000이상 받는 사원이 소속된 부서 (10, 20)와 동일한 부서에서 근무하는 사원이기에 서브쿼리 결과중에서 하나라도 일치하면
--참 인 결과를 구하는 IN 연산자와 함께 사용되어야 한다.

select
    ename,
    sal,
    deptno
from emp
where deptno in (select distinct deptno from emp where sal >= 3000);


-- 부서별로 가장 급여를 많이 받는 사원의 정보(사원번호, 사원이름, 급여, 부서번호)를 출력하시오 (IN연산자)
select
    empno,
    ename,
    sal,
    deptno
from emp
where sal IN (select max(sal) from emp group by deptno);


-- 직급이 MANAGER인 사람의 속한 부서의 부서번호와 부서명과 지역을 출력하시오.
select
    deptno,
    dname,
    loc
from dept
where deptno IN (select deptno from emp where job='MANAGER');


-- ALL 연산자
-- ALL 조건은 메인 쿼리의 비교조건이 서브 쿼리의 검색결과와 모든 값이 일치하면 참


--30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름, 급여를 출력하시오.
select
    ename,
    sal
from emp
where sal > all(select sal from emp where deptno=30);


-- 영업 사원들 보다 급여를 많이 받는 사원들의 이름과 급여와 직급을 출력하되, 영업사원을 출력하지 않습니다.
select
    ename,
    sal,
    job
from emp
where sal > all(select sal from emp where job='SALESMAN');



