--그룹함수
--하나 이상의 행을 그룹으로 묶어 연산하여 총합, 평균 등 하나의 결과로 나타냅니다.

select
    to_char(sum(sal), '999,999')
from emp;

select
    to_char(sum(comm), '999,999')
from emp;


select 
    ename,
    max(sal)
from emp;
-- 에러, 그룹핑 안됨


-- 가장 최근에 입사한 사원의 입사일과, 입사한지 가장 오래된 입사원의 입사일을 출력하세요.

select 
    hiredate
from emp;


select
    min(hiredate) as "가장 오래된 사원",
    max(hiredate) as "가장 최근의 사원"
from emp;



