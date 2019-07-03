-- 형변환 문제 --

-- 예제 1 : 현재 날짜를 문자형으로 변환하여 출력하시오. 
--      문자형식은 ex) 2019-12-31 이다.
SELECT
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
  FROM  DUAL;
  
  
-- 예제 2 : 사원들의 입사일을 출력하되, 요일까지 출력하시오.
--      칼럼은 ENAME, JOB, DEPTNO, 입사일 입니다. 
--      날짜출력형식은 ex) 2019.12.31.일요일 입니다.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        TO_CHAR(HIREDATE, 'YYYY.MM.DD.DAY')
  FROM  EMP;
  

-- 예제 3 : 각 지역별 통화를 붙이고 천 단위마다 콤마를 붙여서 출력하시오.
--      칼럼은 ENAME, SAL, SAL2 이다.
SELECT
        ENAME,
        SAL,
        TO_CHAR(SAL, 'L999,999,999')
  FROM  EMP;
