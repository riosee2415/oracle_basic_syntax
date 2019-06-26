--SET 연산자
--독립적인 여러개의 쿼리를 하나로 묶는 역할
--최종결과는 하나의 쿼리가 수행된 것과 같음
--수학의 집합과 같은 개념
-- UNION
-- UNION ALL
-- INTERSECT
-- MINUS

-------------------------------------------------------------
-- 1.UNION 
-- 합집합과 같은 개념
-- select 절에 나열된 모든 컬럼에 대해 두 테이블에 있는 내역 조회
-- DISTINCT 역할 -> 한 테이블 기준 동일한 데이터는 1번만 조회 됨
-- ★ select 리스트의 컬럼의 개수, 순서, 타입이 같아야 함
--------------------------------------------------------------

--------------------------------------------------------------
-- 2. UNION ALL 
-- 합집함과 같은 개념
-- select절에 나열된 모든 컬럼에 대해 두 테이블에 있는 내역 조회
-- ★ select 리스트의 컬럼의 개수, 순서, 타입이 같아야 함
-- (차이점) 한 테이블에 있는 동일 데이터가 모두 조회딤 => DISTINCT 기능 없음
--------------------------------------------------------------

--------------------------------------------------------------
-- INTERSECT
-- 교집합의 개념
-- select 리스트의 컬럼의 개수, 순서, 타입이 같아야 함
--------------------------------------------------------------

--------------------------------------------------------------
-- MINUS
-- 차집합의 개념
-- select 리스트의 컬럼의 개수, 순서, 타입이 같아야 함
--------------------------------------------------------------


-- SET 연산자로 묶여지는 select 절에서 BLOB, CLOB, BFILE, VARRAY, 사용 불가
-- ORDER BY 절은 맨 마지막에서 한번만 사용 가능, 서브쿼리 내에서는 ORDER BY 사용 불가
-- SET 연산자로 연결 될 경우 쿼리 결과는 가장 상위 SELECT문의 컬럼읠 기준으로 연결


insert into test1
values
('kim', 20);

insert into test2
values
('kim', 30);

insert into test1
values
('lee', 40);

insert into test2
values
('park', 50);


select * from test1; -- kim, lee
select * from test2; -- kim, park

select * from test1
union
select * from test2;

insert into test1 values('choi', 60);
insert into test2 values('choi', 60);
-- test1 테이블과 test2 테이블에 같은 내용이 있지만 union set연산자는 DISTINCT 역할이 포함되어 있기 때문에 중복데이터를 하나만 출력한다.


select * from test1
union all
select * from test2;
-- union all 연산자는 disctinct 역할을 포함하지 않기 때문에 중복된 데이터라도 전부 보여주게 된다.


select * from test1
INTERSECT
select * from test2;
-- intersect는 교집합의 기능, 두개의 테이블에 공통으로 존재하는 값을 select한다.


