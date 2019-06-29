--UPATE문은 테이블에 저장된 데이터를 수정하기 위해 사용한다.
/*
    UPDATE table_name
    SET column_name1 = value1,
        column_name2 = value2,
        ... ,
        ... ,
    WHERE conditions;
    
    ★ WHERE절을 생략할 경우, table의 전체 행이 수정되므로 신중한 판단 필요
    
*/

--1. 모든 사원의 부서번호를 30으로 수정합시다.

-- emp 테이블의 내용을 emp01로 복사한다.
create table emp01
as ( select * from emp);

select * from emp01;

update emp01
set deptno=30;

select * from emp01;

-- 모든 사원의 급여를 10% 인상시키시오.
update emp01
set sal = sal*1.1;

select * from emp01;


-- 모든 사원의 입사일을 오늘날짜로 수정하시오.
update emp01
set hiredate = sysdate;

select * from emp01;

-- update문에 where절을 추가하게 되면 테이블의 특정 행이 변경된다.
drop table emp01;

create table emp01
as ( select * from emp);


-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정하시오.
update emp01
set deptno = 30
where deptno = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상하시오.
update emp01
set sal = sal * 1.1
where sal >= 3000;


-- 1987년에 입사한 사원의 입사일을 오늘로 수정하시오.
update emp01
set hiredate = sysdate
where substr(hiredate,1,2) = '87';

select * from emp01;


-- 테이블에서 2개 이상의 칼럼의 값을 변경 : set 절 + ,


-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경
select * from dept01 where deptno=20;

update dept01
set loc = 'BOSTON'
where deptno = 40;

update dept01
set loc = (select DISTINCT loc from dept01 where deptno=40)
where deptno = 20;



/* 서브쿼리를이요한 두개 이상의 칼럼에 대한 값 변경*/

-- 부서번호가20인 부서의 부서명과 지역명을
-- 부서번호가 40번인 부서와 동일하게 변경합시다.

update dept01
set (dname, loc) = (select distinct dname, loc from dept01 where deptno=40)
where deptno = 20;


-- 데이터만 날리는 쿼리
delete from dept01;


