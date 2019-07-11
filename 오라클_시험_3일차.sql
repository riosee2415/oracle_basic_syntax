--1. 부서원이 4명보다 많은 부서의 부서번호, 부서명, 부서인원수, 급여의 합, 평균급여를 출력해라.
SELECT
        A.DEPTNO                AS "부서번호",
        B.DNAME                 AS "부서명",
        COUNT(A.EMPNO)          AS "부서인원수",
        SUM(SAL)                AS "급여의 합",
        AVG(SAL)                AS "평균급여"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.DEPTNO    IN  (
                            SELECT
                                    DEPTNO
                              FROM  EMP
                             GROUP  BY DEPTNO
                            HAVING  COUNT(EMPNO)    > 4
                        )
 GROUP  BY  A.DEPTNO, B.DNAME;



--2. DEPT 테이블에 있는 모든 부서를 아래 형식으로 부서번호별로 출력하시오.
--  (참고. 사원이 없는 부서는 없음으로 표기한다)
SELECT
        A.DEPTNO                        AS DEPTNO,
        A.DNAME                         AS DNAME,
        NVL(TO_CHAR(B.EMPNO), '없음')   AS EMPNO,
        NVL(TO_CHAR(B.ENAME), '없음')   AS ENAME
  FROM  DEPT    A
  LEFT  OUTER
  JOIN  EMP     B
    ON  A.DEPTNO    = B.DEPTNO;
    
    
    
--3. 전체 사원의 평균 임금보다 임금이 적은 사원의 사원번호, 이름, 부서명, 급여를 급여가 적은 순으로 출력하시오.
SELECT
        A.EMPNO             AS "사원번호",
        A.ENAME             AS "이름",
        B.DNAME             AS "부서명",
        A.SAL               AS "급여"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  A.SAL       <   (
                            SELECT
                                    AVG(SAL)
                              FROM  EMP
                        )
 ORDER  BY A.SAL ASC;
 
 
 
 
--4. 10번 부서의 사람들 중에서 20번 부서의 사원과 같은 직무를 하는 사원의 사원번호, 이름, 부서명, 입사일, 부서지역을 출력해라.

SELECT
        A.EMPNO	        AS "사원번호",
        A.ENAME         AS "이름",
        B.DNAME         AS "부서명",
        A.HIREDATE      AS "입사일",
        B.LOC           AS "부서지역"
  FROM  EMP     A
 INNER
  JOIN  DEPT    B
    ON  A.DEPTNO    = B.DEPTNO
   AND  JOB         IN  (
                            SELECT
                                    JOB
                              FROM  EMP
                             WHERE  DEPTNO  = '20'
                        );



--5. 사원 테이블에서 각 사원의 사원번호, 사원명, 매니저번호, 매니저명을 출력해라.
SELECT
        A.EMPNO     AS "사원번호",
        A.ENAME     AS "사원명",
        B.EMPNO     AS "매니저번호",
        B.ENAME     AS "매니저명"
  FROM  EMP A
  JOIN  EMP B
    ON  A.MGR   = B.EMPNO
   AND  A.SAL   > B.SAL;

    
    
   
--6. 모든 부서의 부서별 사원의수를 아래와 같은 형식으로 부서번호순으로 출력하시오.
SELECT
        A.DEPTNO                AS DEPNO,
        A.DNAME                 AS DNAME,           
        NVL(COUNT(EMPNO), 0)    AS EMPNO_CNT
  FROM  DEPT    A
  LEFT  OUTER
  JOIN  EMP     B
    ON  A.DEPTNO = B.DEPTNO
 GROUP  BY  A.DEPTNO, A.DNAME;
 
 
 
--7. 입사일부터 지금까지의 근무년수가 25년 이상인 사원의 사원번호, 사원명, 입사일, 근무년수를 출력해라.
--      근무년수가 많은 순으로 출력한다.

SELECT
        Z.EMPNO       AS "사원번호",
        Z.ENAME       AS "사원명",
        Z.HIREDATE    AS "입사일",
        Z.WORKDATE    AS "근무년수"        
  FROM (
        SELECT  
                EMPNO,
                ENAME,
                HIREDATE,
                SUBSTR(TO_CHAR(SYSDATE, 'YYYYMMDD'), 1, 4)-SUBSTR(TO_CHAR(HIREDATE, 'YYYYMMDD'), 1, 4) AS WORKDATE
          FROM  EMP
         WHERE  SUBSTR(TO_CHAR(SYSDATE, 'YYYYMMDD'), 1, 4)-SUBSTR(TO_CHAR(HIREDATE, 'YYYYMMDD'), 1, 4) >= 25
        ) Z
  ORDER BY WORKDATE DESC;
                    
                  
  
--8. 각 부서 별로 입사일자가 가장 늦은 사원을 한 명씩 선발해서 사원번호, 사원명, 부서번호, 입사일을 출력해라.
--  입사일자가 빠른 순서로 출력한다.
SELECT
        EMPNO           AS "사원번호",
        ENAME           AS "사원명",
        DEPTNO          AS "부서번호",
        HIREDATE        AS "입사일"
  FROM  EMP
 WHERE  (DEPTNO, HIREDATE)    IN   (
                                        SELECT
                                                DEPTNO,
                                                MIN(HIREDATE)
                                          FROM  EMP
                                         GROUP  BY DEPTNO
                                    )
 ORDER  BY  HIREDATE ASC;
 
 
 
                                    
--9. 자신의 상급자가 누구인지 상급자명을 아래와 같은 형식으로 출력하시오.
SELECT
        A.EMPNO     AS "EMPNO",
        A.ENAME     AS "ENAME",
        B.EMPNO     AS "MGR",
        B.ENAME     AS "MGR_NIM"
  FROM  EMP A
  JOIN  EMP B
    ON  A.MGR   = B.EMPNO
   AND  A.SAL   > B.SAL;    
/*
    !. 5번이랑 동일한 문제로 확인
*/



--10. 사원이 있는 부서중에서 같은 직무를 하는 사람의 인원수를 구하여 부서번호, 부서명, 직무명, 인원수를 부서번호, 직무명 순으로 출력하시오.

SELECT
        Z.DEPTNO,
        Z.DNAME,
        Z.JOB,
        Z.CNT
  FROM (
            SELECT
                    A.DEPTNO,                                                  
                    B.DNAME,
                    A.JOB,
                    COUNT(A.EMPNO) OVER( PARTITION BY A.JOB, B.DNAME ) AS CNT
              FROM  EMP     A
             INNER
              JOIN  DEPT    B
                ON  A.DEPTNO    = B.DEPTNO
             ORDER  BY DEPTNO, JOB
        ) Z
 GROUP  BY  Z.DEPTNO, Z.DNAME, Z.JOB, Z.CNT
 ORDER  BY DEPTNO, JOB;
        
        
        
      

--11. 사원 중 형제가 2명 이상 되는 사원의 EMPNO, ENAME, DNAME, JUMIN_NO를 출력하시오.
--SELECT * FROM EMPFAMILY;
--SELECT * FROM CODE;


SELECT
        A.EMPNO     AS EMPNO,
        A.ENAME     AS ENAME,
        B.DNAME     AS DNAME,
        C.EXT       AS JUMIN_NO
  FROM  EMP         A
 INNER
  JOIN  DEPT        B
    ON  A.DEPTNO    = B.DEPTNO
       AND  EMPNO   IN     (
                                SELECT
                                        EMPNO
                                  FROM  EMPFAMILY
                                 WHERE  FM_CD   IN (1, 2)
                                HAVING  COUNT(EMPNO) >= 2
                                 GROUP  BY  EMPNO
                            )
 INNER 
  JOIN  EMPDETAIL   C
    ON  C.EMPNO     = A.EMPNO;
    
    

--12. EMP 테이블의 사원의 연봉이 가족의 연봉의 합보다 많은 사원의 사원번호, 사원명, 사원의 연봉, 가족의연봉의 합을 아래 포멧으로 출력하시오
--  [공백이 포함되지않게 주의]
--  [출력형식 : 7844    TURNER      $108,000    $10,000 ]
--  [           7369    SMITH       $13,200     $6,000  ]
--  가종의 연봉 (SAL) // 직원의 연봉 (SAL + COMM)

SELECT
--        A.EMPNO||'  '||A.ENAME||'   '||Z.SAL||' '||Z.FM_SAL,
        A.EMPNO,
        A.ENAME,
        Z.SAL,
        Z.FM_SAL
  FROM  EMP     A
 INNER
  JOIN  (
            SELECT
                    FM_NO,
                    TO_CHAR((A.SAL + NVL(A.COMM, 0)), '$999,999,999') AS SAL,
                    TO_CHAR(Z.FM_SAL, '$999,999,999') AS FM_SAL
              FROM  EMP     A
             INNER
              JOIN  (
                        SELECT  
                                EMPNO           AS FM_NO,
                                SUM(SAL)        AS FM_SAL
                          FROM  EMPFAMILY  
                         GROUP  BY EMPNO
                     )      Z
                ON  A.EMPNO     = Z.FM_NO
               AND  A.SAL + NVL(A.COMM, 0) > Z.FM_SAL
        ) Z
    ON  A.EMPNO     = Z.FM_NO;



--13. EMP 테이블의 SAL 급여등급이 SALGRADE테이블에서 어느 등급에 속하는지 아래 형식으로 출력하시오.
SELECT
        A.EMPNO,
        A.SAL,               
        B.GRADE||'등급'       AS GRADE
  FROM  EMP         A
 INNER
  JOIN  SALGRADE    B
    ON  A.SAL   >= B.LOSAL
   AND  A.SAL   <= B.HISAL;
   
   
   

--14. 가족이 있는 사원중에 가족 구성원이 어떻게 되는지 아래와 같은 형식으로 출력하시오.
--SELECT * FROM CODE;


SELECT
        A.EMPNO,
        C.DNAME,
        A.ENAME,
        COUNT(CASE WHEN (B.FM_CD = '1' OR B.FM_CD = '2') THEN 1 END)||'명' AS "형제",
        COUNT(CASE B.FM_CD WHEN '5' THEN 1 END)||'명' AS "자녀",
        COUNT(CASE B.FM_CD WHEN '3' THEN 1 END)||'명' AS "아버지",
        COUNT(CASE B.FM_CD WHEN '4' THEN 1 END)||'명' AS "어머니"
  FROM  EMP         A
 INNER
  JOIN  EMPFAMILY   B
    ON  A.EMPNO = B.EMPNO
 INNER
  JOIN  DEPT        C
    ON  A.DEPTNO = C.DEPTNO
 GROUP  BY  A.EMPNO, A.ENAME, C.DNAME;



--15. 스칼라 서브쿼리를 이용해서 가족관계(GUBUN_NM)명을 표시하고 모든사원의 가족을 아래와 같은 형태로 EMPNO, ENAME,처럼 반복되는 것은 첫번째 로우에 한번만 나오도록 출력하시오.
--SELECT * FROM EMPFAMILY;
-- ★ 수정 중
--SELECT * FROM EMP;
/*
SELECT  
        CASE    WHEN A.EMPNO = LAG(A.EMPNO) OVER( ORDER BY A.EMPNO)     THEN '' ELSE TO_CHAR(A.EMPNO)   END AS EMPNO,
        CASE    WHEN A.ENAME = LAG(A.ENAME) OVER( ORDER BY A.ENAME)     THEN '' ELSE A.ENAME            END AS ENAME,
        CASE B.FM_CD
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
    ON  A.EMPNO     = B.EMPNO;
*/


   
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
        ON  B.FM_CD = C.CODE
     ORDER  BY  A.EMPNO, A.ENAME;


    
/*
    CASE문에 TRIM 함수를 사용한 이유는
    SMITH(7369)의 'SANTI CAZORLA' 이름을 가진 가족의 FM_CD가 '4'가 아닌 '4 ' 라서 NULL로 출력 되기 때문에 데이터 수정이 아닌
    함수로 데이터 전처리 후 CASE문에 진입하였습니다.
*/








--16. 회사에서 연말연시를 맞이하여 급여를 가장 적게받는 사원 4명에게 부양가족당 1000씩을 더해 급여를 지급하려고 한다.
--  (급여가 높은순으로 출력할 것)

SELECT
        Z.EMPNO,
        Z.ENAME,
        Z.SAL,
        Z.SAL + 1000 *  (
                            SELECT
                                    COUNT(EMPNO)
                              FROM  EMPFAMILY
                             WHERE  Z.EMPNO = EMPNO
                        ) AS TOTAL_SAL,
        Z.DNAME
  FROM  (
            SELECT
                    A.EMPNO,
                    A.ENAME,
                    A.SAL,
                    B.DNAME
              FROM  EMP     A
             INNER 
              JOIN  DEPT    B
                ON  A.DEPTNO    = B.DEPTNO
             ORDER  BY SAL ASC
        ) Z
 WHERE  ROWNUM < 5
 ORDER  BY  TOTAL_SAL DESC;
 
        
        
        


 