-- 사원 테이블을 부서번호로 그룹지어 봅시다.

select 
    deptno
from emp
group by deptno; 


-- 소속 부서별 평균을 구하라.

select
    deptno,
    avg(sal)
from emp
group by deptno;

select 
    deptno,
    min(sal),
    max(sal)
from emp
group by deptno;



-- 각 부서별 사원 수 와 커미션을 받는 사원들의 수를 계산하세요.

select
    deptno,
    count(*),
    count(comm)
from emp
group by deptno; 


select
    job,
    count(job),
    avg(sal)
from emp
group by job;


select
    deptno,
    avg(sal)
from emp
group by deptno
having avg(sal) >= 2000;


-- 부서의 최대값과 최소값을 구하되, 최대 급여가 2900 이상인 부서만 출력
select
    deptno,
    max(sal),
    min(sal)
from emp
group by deptno
having max(sal) >= 2900;


    
    
    
    
    
    
    
    
    
    

