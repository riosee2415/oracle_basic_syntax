
create table dept01
(
deptno number(2),
dename varchar2(14),
loc varchar(13)
);

desc dept01;

insert into dept01 
values
(10, 'ACCOUNTING', 'NEW YORK');

insert into dept01 
values
(20, 'REASERCH', 'DALLAS');

select * from dept01;

insert into dept01 (deptno, dname)
values (30, 'SALAES');

insert into dept01 
values
(40, 'OPERATIONS', NULL);

insert into dept01 
values
(50, '', 'CHICAGO');

select * from dept;
select * from dept01;


-- 서브쿼리를 사용하여 dept안에 있는 내용을 dept01 테이블 안으로 한꺼번에 insert
-- where절을 사용하여 원하는 데이터만 추출하여 insert할 수 있다.
insert into dept01
select * from dept;



select * from dept01;


--INSERT ALL문을 사용하면 서브쿼리의 결과를 조건없이 여러 테이블에 동시입력 가능

-- 사원번호, 사원명, 입사일자로 구성된 EMP_HIR 테이블과,
-- 사원번호, 사원명, 해당관리자로 구성된 EMP_MGR테이블이 빈 테이블로 존재

-- 사원테이블(EMP)에서 부서번호가 20인 사원들을 검색하여 EMP_HIR테이블에는
-- 사원번호, 사원명, 입사일 // EMP_MGR 테이블에서는 사원번호, 사원명, 관리자를
-- 입력하라.

-- insert all 명령문은 서브쿼리의 결과 집합을 조건없이 여러 테이블에 동시에 입력하기 위한 명령문 입니다.

-- ★ 이때 주의할 점은, 서브쿼리의 컬럼명과 데이터가 입력되는 테이블의 컬럼명이 동일해야 한다.


