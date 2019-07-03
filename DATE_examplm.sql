--날짜함수--

--예제 1: 각 지원들이 근무한 개월 수를 구하시오. (소숫점 첫째자리에서 반올림)
--      컬럼은 ENAME, TODAY, HIREDATE, 근무개월 수 입니다.
SELECT
        ENAME,
        SYSDATE AS TOODAY,
        HIREDATE,
        ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS "근무개월 수"
  FROM  EMP;
        


--예제 2 : 입사 날짜에서 4개월을 추가하시오.
--      컬럼은 ENAME, JOB, DEPTNO, HIREDATE, 정규직전환 입니다.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        HIREDATE,
        ADD_MONTHS(HIREDATE, 4) AS "정규직 전환"
  FROM  EMP;
  
  
--예제3 : 오늘날짜 기준으로 가증 가까운 '수요일'이 몇 일 인지 구하시오.
SELECT
        NEXT_DAY(SYSDATE, '수요일')
  FROM  DUAL;
  


--예제4 : 사원 별 입사한 달의 마지막 날을 구하시오.
--      컬럼은 ENAME, JOB, DEPTNO, HIREDATE, 마지막 날 입니다.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        HIREDATE,
        LAST_DAY(HIREDATE) AS "마지막 날"
  FROM  EMP;