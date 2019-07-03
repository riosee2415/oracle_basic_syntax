-- NVL 문제--

-- 예제 1 : 모든 사원의 연봉을 구하시오.
--      연봉은 커미션(COMM을 포함하여 계산하시오)
--      칼럼은 ENAME, JOB, DEPTNO, SAL, COMM, A_SAL 입니다.
SELECT
        ENAME,
        JOB,
        DEPTNO,
        SAL,
        NVL(COMM, 0),
        TO_CHAR(SAL * 12 + NVL(COMM, 0), '999,999,999') AS A_SAL
  FROM  EMP;
  
  
