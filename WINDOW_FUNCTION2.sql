/*
    <<WINDOW FUNCTION>>
    행과 행간의 관계를 쉽게 정의하기 위해 만든 함수
    분석함수, 순위함수로 불리기도 함
    
    ★ 중첩해서는 사용이 불가능하나, 서브 쿼리에서 사용 가능
    
        1. WINDOW 함수의 종류
            1) 순위 관련 함수             : RANK, DENSE_RANK, ROW_NUMBER
            2) 집계 관련 함수             : SUM, MAX, MIN, AVG, COUNT
            3) 그룹 내 행 순서 관련 함수  : FIRST_VALUE, LAST_VALUE, LAG, LEAD
            4) 그룹 내 비율 관련 함수     : CUME_DIST, PERCENT_RANK, NTILE, TO_REPORT
            
            
        2. SYSNTAX
            ==========================================================================================
            SELECT
                    WINDOW_FUNCTION(ARGUMENTS) ORVER (PARTITION BY 칼럼 [ORDER BY 절] [WINDOWING 절] )
              FROM  테이블명
            ==========================================================================================
            - WINDOW_FUNCTION       : 기존에 사용하던 함수도 있고, 새롭게 WINDOW 함수용으로 추가된 함수도 있다.
            - ARGUMENTS             : 함수에 따라 0~N개의 인수가 지정될 수 있다.
            - PARTITION BY          : 전체 집합을 기준에 의해 소그룹으로 나눌 수 있다.
            - ORDER BY              : 어떤 항목에 대해 순위를 지정할지 기술한다.
            - WINDOWING             : 함수의 대상이 되는 행 기준의 범위를 강력하게 지정한다.
            
*/


/*
그룹 내 순위 함수
    1. RANK 함수
        - 특정 항목에 대한 순위를 구하는 함수, 특정 범위내에서 순위를 구할수도 있음, 동일값에 대해서는 동일한 순서 부여.     
*/

-- 전체에서 급여에 RANK 부여
SELECT  
        ENAME,
        SAL,
        RANK()  OVER ( ORDER BY SAL DESC )
  FROM  EMP;
  
  
-- 전체에서 직급별 그룹 후 RANK 부여
SELECT
        ENAME,
        JOB,
        SAL,
        RANK()  OVER ( PARTITION BY JOB ORDER BY SAL DESC )
  FROM  EMP;
  
 /*
    2. DENSE_RANK 함수
        - 동일한 건수를 하나의 건수로 취급
        - 동일한 값이 있을 경우 순위는 1,2,2,2,3,4,4,5,5,5,6 ...
 */
 
 
-- 전체에서 급여에 DENSE_RANK()룰 부여
SELECT
        ENAME,
        JOB,
        DENSE_RANK()    OVER ( ORDER BY SAL DESC )
  FROM  EMP;
  
-- 전체에서 직급별 급여에 DENSE_RANK()를 부여
SELECT
        ENAME,
        JOB,
        SAL,
        DENSE_RANK()    OVER( PARTITION BY JOB ORDER BY SAL DESC)
  FROM  EMP;
  
  

/*
    3. ROW_NUMBER 함수
        - 동일한 값이 있더라도 고유의 순서를 부여함 (동일 값이 있을 경우 ROWID가 적은 행)
*/

SELECT
        ROW_NUMBER()    OVER( ORDER BY SAL DESC ) "ROWNUM",
        ENAME,
        JOB,
        SAL,
        RANK()          OVER( ORDER BY SAL DESC ) RANK,
        DENSE_RANK()    OVER( ORDER BY SAL DESC ) DENSERANK
  FROM  EMP;
  
  
  
/*
    <<일반 집계 함수>>
        1. SUM 함수
            - 누적값을 구할 수 있음
*/

-- 매니저별 사원의 급여 누적 합계액
SELECT
        MGR,
        ENAME,
        SAL,
        SUM(SAL) OVER ( PARTITION BY MGR ORDER BY SAL )
  FROM  EMP;
  

/*
    2. MAX함수
        - INLINE VIEW로 파티션별 최대값을 가진 행 추출 가능
*/
SELECT
        MGR,
        ENAME,
        SAL
  FROM  (
            SELECT
                    MGR,
                    ENAME,
                    SAL,
                    MAX(SAL) OVER (PARTITION BY MGR) AS IV_MAX_SAL
              FROM  EMP
        )
 WHERE  SAL = IV_MAX_SAL;
 
 
/*
    3. MIN함수
        - 위 동일
*/



/*
    <<그룹 내 행 함수>>
    
    1. LAG 함수
        - 파티션 별 윈도우에서 이전 몇번째 행의 값을 가져올 수 있음
*/


SELECT
        ENAME,
        HIREDATE,
        SAL,
        LAG(SAL, 2, 0) OVER (ORDER BY HIREDATE)
  FROM  EMP
 WHERE  JOB  = 'SALESMAN';
 
-- LAG(SAL, 2, 0) 는 2번 째 앞의 SAL을 가져오고, 없을 경우 0으로 처리하라는 명령어 이다.



/*
    2. LEAD 함수
        - 파티션 별 윈도우에서 이후 몇 번째 행의 값을 가져올 수 있음
*/
SELECT
        ENAME,
        HIREDATE,
        SAL,
        LEAD(SAL, 2, 0) OVER ( ORDER BY HIREDATE )
  FROM  EMP;
