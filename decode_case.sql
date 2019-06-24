-- 선택읠 위한 DECODE 함수 : switch case문과 유사한 기능을 구현
-- 여러가지 경우에 대하여 선택할 수 있는 함수

--DECODE (표현식,  조건1, 결과1,
--                조건2, 결과2,
--                조건3, 결과3,
--                기본결과n
--        )
        
        

select 
    ename,
    deptno,
    decode(deptno, 10, 'ACCOUNTNIG',
                   20, 'research',
                   30, 'sales',
                   40, 'operations'
            ) as dename
from emp;


select * from emp;
--직급에 따라 급여를 인상하도록 하자.
--직급이 ANAIYST인 사원은 5%, SALESMAN인 사원은 10%, MANAGER인 사원은 15%, CLERK인 사원은 20% 인상한다.

select 
    ename,
    job,
    sal,
    decode(job, 'ANALYST', (sal*1.05),
                'SALESMAN', sal*1.1,
                'MANAGER', sal*1.15,
                'CLERK', sal*1.20
            ) as new_sal
from emp;
                

--CASE 표현식 WHEN 조건1 THEN 결과1,
--            WHEN 조건2 THEN 결과2,
--            WHEN 조건3 THEN 결과3,
--            기본결과n
--END


select
    ename,
    deptno,
    CASE when deptno='10' then upper('accounting')
         when deptno='20' then upper('research')
         when deptno='30' then upper('sales')
         when deptno='40' then upper('operations')
    END as dename
FROM emp;
      

select
    ename,
    sal,
    case    when sal >= 1000 then '1000이상'
            else '1000이하'
    END as salcase
from emp;