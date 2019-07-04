/*
    오라클 기본 Exam
    ○ 다음 결과가 출력되도록 QUERY를 작성하시오 (EMP테이블 사용)
*/
--SELECT * FROM EMP;


-- 1. 사원의 번호, 이름 급여, 부서번호를 출력하여라.
SELECT
        EMPNO,              -- 사원번호
        ENAME,              -- 이름
        SAL,                -- 급여
        DEPTNO              -- 부서번호
  FROM  EMP;
  

--2. 입사일자가 1980년 12월 17일 이후에 입사한 사원의 모든 정보를 출력하라.
SELECT
        EMPNO,              -- 사원번호
        ENAME,              -- 이름
        JOB,                -- 직무
        MGR,                -- 상사
        HIREDATE,           -- 입사일
        SAL,                -- 급여
        COMM,               -- 커미션
        DEPTNO              -- 부서번호
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') >= TO_DATE('801217', 'YY/MM/DD');
 
 
-- 3. 급여가 800미만의 사원의 이름,급여,부서 번호를 출력하라.
SELECT
        ENAME,              -- 이름
        SAL,                -- 급여
        DEPTNO              -- 부서번호
  FROM  EMP
 WHERE  SAL < 800;

 
--4. 아래와 같은 결과의 형식으로 나오도록 모든 사원을 출력하라.
--  (아래의 결과는 전체건수의 일부이다)
--  EMP_GB는 MGR이 NULL일 경우 대표로 표시하고, 그 외에는 직원이라 표시하여 직원(사원번호) 형식으로 출력
--  BUSEO_GB는 10번 부서일 경우 ACCOUNTING, 20번 부서일 경우 RESEARCH, 그 외에는 기타부서로 표시하여 부서번호(부서구분) 형식으로 출력
--  정렬조건은 DEPTNO.EMP_GB로 한다.
SELECT
        NVL2(MGR, '직원(' || EMPNO || ')', '대표') AS EMP_GB,            -- 직원구분
        DEPTNO,                                                         -- 부서번호                
        CASE DEPTNO WHEN 10 THEN 'ACCOUNTING'
                    WHEN 20 THEN 'RESEARCH'
                    ELSE '기타부서' 
        END AS BUSEO_GB                                                 -- 부서구분 
  FROM  EMP
 ORDER  BY  DEPTNO, EMP_GB;


--5. 위의 결과에서 직원이면서 BUSEO_GB이 기타부서로 소속된 사람의 모든 사원번호, 부서번호, BUSEO_GB를 출력하라.
SELECT
        NVL2(MGR, '직원(' || EMPNO || ')', '대표') AS EMP_GB,            -- 직원구분
        DEPTNO,                                                         -- 부서번호
        CASE DEPTNO 
            WHEN 10 THEN 'ACCOUNTING'
            WHEN 20 THEN 'RESEARCH'
            ELSE '기타부서' 
        END AS BUSEO_GB                                                 -- 부서구분
  FROM  EMP
 WHERE  DEPTNO  NOT IN (10, 20)
 ORDER  BY  DEPTNO, EMP_GB;
 
 
--6. 입사일자가 1981년 12월 09일 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') < TO_DATE('811209', 'YY/MM/DD');
 

--7. 입사번호가 7521보다 작거나 같은 사람들의 입사번호와 이름을 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME           -- 이름
  FROM  EMP
 WHERE  EMPNO <= 7521;
 
 
--8. 입사일자가 1981년 04월 02월 보다 늦고, 1982년 12월 09일 보다 빠른 사원의 이름, 월급, 부서 번호를 출력하라.
SELECT
        ENAME,          -- 이름
        SAL,            -- 월급
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') > TO_DATE('810402', 'YY/MM/DD')
   AND  TO_DATE('821209', 'YY/MM/DD') > TO_DATE(HIREDATE, 'YY/MM/DD');
   
   
--9. 급여가 1,600보다 크고 3,000보다 작은 사람의 이름, 직무, 급여를 출력하라.
SELECT
        ENAME,          -- 이름
        JOB,            -- 직무
        SAL             -- 급여
  FROM  EMP
 WHERE  SAL > 1600
   AND  SAL < 3000;
   
   
--10. 입사년도 1981년 이외에 입사한 사람의 모든 정보를 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  SUBSTR(HIREDATE, 1, 2) <> 81;
        

--11.입사년월이 1981년 2월에 입사한 사람의 모든 정보를 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  SUBSTR(HIREDATE, 1, 2) = 81
   AND  SUBSTR(HIREDATE, 4, 2) = 02;
   
   
--12. 부서번호가 20, 30번을 제외한 모든 사람의 이름, 사원번호, 부서번호를 출력하라.
SELECT
        ENAME,          -- 이름
        EMPNO,          -- 사원번호
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  DEPTNO <> 20
   AND  DEPTNO <> 30;
   
   
--13. 아래와 같은 결과를 나오도록 등급순, 급여가 높은 순으로 출력하시오.
--  SAL이 2000미만이면 3등급, 2001~3000이면 2등급, 그 외에는 1등급으로 표시
SELECT
        EMPNO,                       -- 사원번호
        SAL,                         -- 급여
        DEGREE                       -- 등급 
  FROM  (
        SELECT
                EMPNO,                                              
                SAL,                                                  
                CASE 
                    WHEN    SAL < 2000 THEN '3등급'
                    WHEN    SAL BETWEEN 2001 AND 3000 THEN '2등급'
                    ELSE    '1등급'                                    
                END AS DEGREE
          FROM  EMP
        )
 ORDER  BY  SAL DESC;
 /**********************************************************************
 ★ 주의 !
  > 2000미만 이라면 3등급, 2001~3000이면 2등급 의 조건을 충족하게 되면
  급여가 2000인 사람의 기준이 없습니다.
  RESULT :: 급여가 2000인 사원이 있다면 DEGREE가 1등급으로 출력됩니다.
 ***********************************************************************/
 
 
--14. 위의 결과에서 1등급만 출력하라.
SELECT
        EMPNO,                       -- 사원번호
        SAL,                         -- 급여
        DEGREE                       -- 등급 
  FROM  (
        SELECT
            EMPNO,                                              
            SAL,                                                  
            CASE 
                WHEN    SAL < 2000 THEN '3등급'
                WHEN    SAL BETWEEN 2001 AND 3000 THEN '2등급'
                ELSE    '1등급'                                    
            END AS DEGREE
          FROM EMP
        )
 WHERE  DEGREE = '1등급';


--15. 이름이 S자로 시작하는 사원의 사원번호, 이름, 입사일자, 부서번호를 출력하라.
SELECT
        EMPNO,              -- 사원번호
        ENAME,              -- 이름
        HIREDATE,           -- 입사일자
        DEPTNO              -- 부서번호
  FROM  EMP
 WHERE  ENAME   LIKE 'S%';
 
 
--16. 이름의 세번째 글자가 'A'이거나 끝자리가 'S'로 끝나는 사원의 이름, 사원번호를 출력하라.
SELECT
        ENAME,              -- 이름
        EMPNO               -- 사원번호
  FROM  EMP
 WHERE  ENAME   LIKE '__A%'
    OR  ENAME   LIKE '%S';
    

--17. 이름 중 S가 포함된 사원의 모든 정보를 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  ENAME   LIKE '%S%';
 
 
--18. 상급자(MGR)가 MGR,SAL순으로 정렬하여 아래 같은 형식으로 출력하시오.
--  (단, MGR이 NULL 사원이 가장 먼저나오도록 정렬)
SELECT
        EMPNO,                      -- 사원번호
        ENAME,                      -- 이름
        JOB,                        -- 직무
        MGRR,                       -- 상사
        HIREDATE,                   -- 입사일
        SAL,                        -- 급여
        COMMM,                       -- 커미션
        DEPTNO                      -- 부서번호
  FROM  (
        SELECT
                EMPNO,                      
                ENAME,                      
                JOB,                        
                NVL2(MGR, TO_CHAR(MGR), ' ') AS MGRR,                 
                HIREDATE,                   
                SAL,                        
                NVL2(COMM, TO_CHAR(COMM), ' ') AS COMMM,                   
                DEPTNO                     
          FROM  EMP
        )
 ORDER  BY  MGRR;


--19. 커미션(COMM)을 받는 사원의 모든 정보를 커미션이 적은 순으로 출력하라.
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  COMM    IS NOT NULL
   AND  COMM    <> 0
 ORDER  BY  COMM;
 
 
--20. 첫 번째 문자에 상관없이 두 번째 문자가 A인 사람의 사원번호, 이름을 출력하라.
SELECT
        EMPNO,           -- 사원번호
        ENAME            -- 이름
  FROM  EMP
 WHERE  ENAME   LIKE '_A%';
        
 
--21. 20, 30번 부서중에 직업이 MANAGER 인 사람의 정보를 출력하라
SELECT
        EMPNO,          -- 사원번호
        ENAME,          -- 이름
        JOB,            -- 직무
        MGR,            -- 상사
        HIREDATE,       -- 입사일
        SAL,            -- 급여
        COMM,           -- 커미션
        DEPTNO          -- 부서번호
  FROM  EMP
 WHERE  DEPTNO  IN (20, 30)
   AND  JOB = 'MANAGER';
   
   
--22. 급여와 커미션의 합계금액이 3000이상인 사람들에게 건강보험료를 월급에서 10% 공제하려고 한다.
--  아래와 같은 형식으로 부서의 모든 직원이 나오도록 출력하라.
--  정렬은 부서번호, 공제대상여부
SELECT
        EMPNO,
        ENAME,
        DEPTNO,
        NOW_AMT,
        CASE 
                WHEN NOW_AMT >= 3000 THEN NOW_AMT * 0.1
                ELSE 0
        END AS JIGEUP_AMT,
        KONGJAE_YN
  FROM  (
        SELECT
                EMPNO,
                ENAME,
                DEPTNO,
                SAL + NVL(COMM, 0) AS NOW_AMT,
                CASE 
                        WHEN SAL + NVL(COMM, 0) >= 3000 THEN '공제대상'
                        ELSE '미대상'
                END AS KONGJAE_YN
          FROM  EMP
        )
 ORDER  BY  DEPTNO, KONGJAE_YN;



/*
    ○ 데이터 가공 시 컬럼 데이터 보다 파라미터 가공을 우선 시 한다.
        -> 파라미터 가공이 컬럼의 가공보다 속도가 빠르다.
        -> 특정한 경우 외에는 파라미터를 가공한다.

    ○ DATE 타입의 비중이 적다.
        -> 사용시엔 시간과 속도를 위해 YYYYMMDDHH2$MISS  형식을 많이 사용
        -> DATE타입의 사용형식은 가공을 최소한으로 사용

    ○ 주의! NUMBER 데이터 타입의 경우 소숫점자리에 주의!
        -> 기준 또는 상급자와 회의
        
    ○ DISTINCT 사용 금지 (속도가 느려지고, 데이터가 정확히 발생하지 않음)
        
        
*/


