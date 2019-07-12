--1. 아래와 같은(-23-) 결과가 나오도록 EMPFAMILY 테이블의 NICKNAME컬럼을 이용하여 첫글자만 소문자가 되도록 표기하시오.
SELECT
        NAME    AS NICKNAME,
        LOWER(SUBSTR(NAME, 1, 1)) || SUBSTR(NAME, 2, INSTR(NAME, ' ')-1) || LOWER(SUBSTR(NAME, INSTR(NAME, ' '), 2)) || SUBSTR(NAME,  INSTR(NAME, ' ')+2) AS NEW_NIMNAME
  FROM  EMPFAMILY;
  




--2. 부서별 합계금액을 구하려고 한다. 아래와 같은(-23-) 결과가 나오도록 작성하시오. (정렬순서는 부서번호순)






--3. EMPFAMILY 테이블의 TEL컬럼에 숫자로만 구성 되어야 하나 문자(한글, 영문,특수문자포함)가 포함된 비정상 데이터를 추출하려고 한다.
--      아래와 같은 결과가 나오도록 출력하시오.
--      (별칭 TONUMBER 컬럼읜 불특정문자열을 제거한 숫자만 추출 // 별칭 TOCHAR 컬럼은 숫자를 제거한 문자열만 추출)
--SELECT * FROM EMPFAMILY;


SELECT
        PHONE,
        REGEXP_REPLACE(PHONE, '[^0-9]') AS TONUMBER,
        REGEXP_REPLACE(PHONE, '[0-9]')  AS TOCHAR
  FROM  EMPFAMILY
 WHERE  PHONE IS NOT NULL;
 
  
  



--4. 회사에서 연말연시를 맞이하여 급여를 가장 적게받는 사원 4명에게 부양가족당 1000씩을 더해 급여를 지급하려고 한다.
--      아래 형식으로 급여가 낮은순으로 출력하시오.
--      (단, 동일한 SAL을 받는 사원이 존재할 경우 입사일자가 가장 빠른 사원에게만 지급하고 나머지는 제외한다.)
--SELECT * FROM EMPFAMILY;
SELECT
        A.EMPNO           AS EMPNO,
        A.SAL             AS SAL,
        A.SAL + B.PLUS    AS TOTAL_SAL
  FROM  EMP     A
 INNER
  JOIN  (
            SELECT
                    EMPNO               AS EMPNO,
                    COUNT(EMPNO)        AS CNT,
                    COUNT(EMPNO) * 1000 AS PLUS
              FROM  EMPFAMILY
             WHERE  EMPNO   IN  (
                                    SELECT
                                            Z.EMPNO
                                      FROM  (
                                                SELECT
                                                        ROW_NUMBER()    OVER( ORDER BY SAL )    AS RN,
                                                        EMPNO                                   AS EMPNO
                                                  FROM  EMP
                                                 ORDER  BY SAL, HIREDATE
                                            )   Z
                                     WHERE  Z.RN <= 4
                                 ) 
             GROUP  BY EMPNO
        )       B
    ON  A.EMPNO = B.EMPNO
 ORDER  BY  A.SAL;
  
 
 
 
 
--5. EMPFAMILY에서 연령대별 가장 높은 연봉과 가장 낮은 연봉을 구하고 가장 높은 연봉에서는 세금 10,000원을 빼고,
--      가장 낮은 연봉에서는 세금 6,000을 뺀 금액을 아래와 같은 형식으로 출력.
--      (단, 50세 이상은 AGE50대에 포함하며, 각 최대/최소연봉에서 세금을 공제한 금액이 마이너스일 경우는-, 그렇지 않을 경우는 +로 표기할 것)



SELECT 
        TO_CHAR(MAX(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '2%' THEN SAL ELSE NULL END),'999,999')  AS AGE20,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '3%' THEN SAL ELSE NULL END),'999,999')  AS AGE30,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '4%' THEN SAL ELSE NULL END),'999,999')  AS AGE40,
        TO_CHAR(MAX(CASE WHEN AGE LIKE '5%' OR AGE LIKE '6%' OR AGE LIKE '7%' THEN SAL ELSE NULL END),'999,999')|| '/' ||TO_CHAR(MIN(CASE WHEN AGE LIKE '5%' THEN SAL ELSE NULL END),'999,999')  AS AGE50OVER
  FROM  EMPFAMILY;
  
  
  
  

--6. TMPTBL 테이블을 이용하여 아래와 같은 결과가 나오도록 작성하시오.
/*
    설명) F1, C1 컬럼 그룹별로 VAL 값을 비교하여 서로 다른 종류의 값이 존재할 경우 BOTH로, 한 종류의 값만 존재할 경우 해당 값을 표기한다.
*/


SELECT * FROM TMPTBL;
-- 중복값이 있으면 BOTH






--7. EMPFAMILY 테이블을 이용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.
--      같은 가족별로 COL3 값이 YEAR_SAL의 누적되어 출력되도록 작성하시오.
--      WINDOW함수를 이용하는 방법과, WINDOW함수를 이용하지않는 방법 두가지 방법으로 작성할 것
--SELECT * FROM EMPFAMILY;

-- WINDOW함수 사용
SELECT
        EMPNO,
        SAL     AS  YEAR_SAL,
        SUM(SAL)   OVER( PARTITION BY EMPNO  ORDER BY SAL)  AS COL3
  FROM  EMPFAMILY
 ORDER  BY  EMPNO;
 
 
 
 -- WINDOW함수 미사용










--8. 아래와 같은 데이터 및 IP작은번호 순으로 정렬되도록 IP리스트를 정렬하시오 (IP_TABLE 사용)
    /*
        WINDOW함수를 이용하는 방법과, WINDOW함수를 이용하지않는 방법 두가지 방법으로 작성할 것
    */
 
SELECT * FROM IP_TABLE;


-- WINDOW함수 사용
SELECT
        Z.IP,
        Z.IP01,
        Z.IP02,
        Z.IP03,
        Z.IP04,
        ROW_NUMBER()    OVER( ORDER BY IP )                                     AS TPT_NUM,
        DENSE_RANK()    OVER( PARTITION BY IP01||IP02||IP03 ORDER BY IP )       AS GRP_NUM,
        (
            SELECT
                    COUNT(*)
              FROM  IP_TABLE
             WHERE  IP LIKE Z.IP01||'.'||Z.IP02||'.'||Z.IP03 || '%'
        )   AS IP_CNT,
        (
            SELECT
                    COUNT(*)
              FROM  IP_TABLE
        )   AS IP_TOPCNT
  FROM  (
            SELECT
                    IP,
                    SUBSTR(IP, 1, POINT1_S -1)                          AS IP01,
                    SUBSTR(IP, POINT1_S +1 , POINT2_S-POINT1_S-1)       AS IP02,
                    SUBSTR(IP, POINT2_S +1, POINT3_S-POINT2_S-1)        AS IP03,
                    SUBSTR(IP, POINT3_S +1)                             AS IP04
              FROM  (
                        SELECT
                                IP,
                                INSTR(IP, '.', 1)       AS POINT1_S,
                                INSTR(IP, '.', 1, 2)    AS POINT2_S,
                                INSTR(IP, '.', 1, 3)    AS POINT3_S
                          FROM  IP_TABLE
                    )
        )   Z;
        
        


 -- WINDOW함수 미사용
        
 
 
 
 
 
 
 
--9. 스칼라 서브 쿼리를 이용해서 가족관계(GUBUN_NM)명을 표시하고, 모든 사원의 가족을 아래와 같은 형태로 EMPNO, ENAME처럼 반복되는 것은 첫번째 열에 한번만 나오도록 출력하시오.

SELECT * FROM CODE;

SELECT * FROM EMPFAMILY;


SELECT
        CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN TO_CHAR(A.EMPNO) 
                                                                                 WHEN '2' THEN ' '
                                                                                 WHEN '3' THEN ' '
                                                                                 WHEN '4' THEN ' '
        END AS EMPNO,
        CASE TRIM((ROW_NUMBER()  OVER( PARTITION BY A.EMPNO ORDER BY A.EMPNO ))) WHEN '1' THEN A.ENAME          
                                                                                 WHEN '2' THEN ' '
                                                                                 WHEN '3' THEN ' '
                                                                                 WHEN '4' THEN ' '
        END AS ENAME,
        CASE TRIM(B.FM_CD)
                    WHEN '1' THEN '형제'
                    WHEN '2' THEN '형제'
                    WHEN '3' THEN '부'
                    WHEN '4' THEN '모'
                    WHEN '5' THEN '자'
        END AS RELATION,
        B.NAME
  FROM  EMP         A
 INNER
  JOIN  EMPFAMILY   B
    ON  A.EMPNO = B.EMPNO
 INNER  
  JOIN  CODE   C
    ON  B.FM_CD = C.CODE;









--10. 2016년 상반기 직원들의 출근일자를 추출하려고 한다.
--      아래와 같이 월별 직원의 상반기 출근일수가 표시되도록 작성하시오.
/*
    1. EMP_CHULGYEOL 테이블은 결근, 지각, 조퇴시 기록됨.
    2. 조퇴 3회당 결근 1회
    3. 지각 3회당 결근 1회
    
    STATE   : 1 - 결근
            : 2 - 지각
            : 3 - 조퇴
*/

SELECT * FROM EMP_CHULGYEOL;


SELECT
        A.EMPNO,
        C.DNAME,
        SUBSTR(LAST_DAY(TO_DATE('20160101', 'YYYYMMDD')), -2, 2) AS JAU,        -- 마이너스 출결
        SUBSTR(LAST_DAY(TO_DATE('20160201', 'YYYYMMDD')), -2, 2) AS FEB,
        SUBSTR(LAST_DAY(TO_DATE('20160301', 'YYYYMMDD')), -2, 2) AS MAR,
        SUBSTR(LAST_DAY(TO_DATE('20160401', 'YYYYMMDD')), -2, 2) AS APR,
        SUBSTR(LAST_DAY(TO_DATE('20160501', 'YYYYMMDD')), -2, 2) AS MAY,
        SUBSTR(LAST_DAY(TO_DATE('20160601', 'YYYYMMDD')), -2, 2) AS JUN
  FROM  EMP_CHULGYEOL   A
 INNER
  JOIN  EMP             B
    ON  A.EMPNO     = B.EMPNO
 INNER
  JOIN  DEPT            C
    ON  B.DEPTNO    = C.DEPTNO
 GROUP  BY  A.EMPNO, C.DNAME;
    
/*출결 구하기************************************************************/

--SELECT
--        EMPNO,
--        CHULGEUN_DT,
--        CASE STATE 
--                    WHEN '1' THEN '결근'
--                    WHEN '2' THEN '지각'
--                    WHEN '3' THEN '조퇴'
--        END AS STATE,
--        COUNT(*)    OVER( PARTITION BY STATE ORDER BY EMPNO )   AS CNT
--  FROM  EMP_CHULGYEOL
-- ORDER  BY EMPNO;
--        
-- 
 
 
 
 
 
 
--11. 설문소제목별로 아래와 같은 형태가 나오도록 쿼리를 작성하시오.
/*
    설명) SQL_GB (4:설문소제목, 1:설문문항제목)
    사용테이블 : SEOLMUM_M
*/














--12. 부서별 그룹에 대한 번호를 아래와 같이 나오도록 쿼리를 작성하시오.
--      단 window함수를 이용하지 않고, 부서번호, ename이 오름차순으로 정렬하여 번호 부여














--13. 인사테이블, 연가테이블을 이용해 입사기준일로부터 2년 동안의 연차사용 갯수를 구하세요.
--  INSA table / YEONGA table
--SELECT * FROM INSA;
--SELECT * FROM YEONGA;