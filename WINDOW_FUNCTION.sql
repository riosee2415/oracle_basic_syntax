/*
    WINDOW_FUNCTION 개요
    -> 행과 행간의 관계를 쉽게 정의하기 위해 만든 함수
    
    ● WINDOW FUNCTION 종류
        - 순위(RANK) 관련 함수        : RANK, DENSE_RANK, ROW_NUMBER
            
        - 집계(AGGREGATE) 관련 함수   : SUM, MAX, MUN, AVG, COUNT
        
        - 행 순서 관련 함수           : FIRST_VALUE, LAST_VALUE, LAG, LEAD
        
        - 비율 관련 함수              : CUME_DIST, PERCENT_RANK, NTITLE, 
    

    ★ WINDOW함수에는 OVER 구문이 필수이다.
    
    [사용형식]
    WINDOW_FUNCTION(expr) OVER( [PARTITION BY절] [ORDER BY절] [WINDOWING 절] )
        ① expr      : 대상 컬럼
        ② PARTITION : 전체 집합을 기준에 의해 소그룹으로 나눌 수 있다.
        ③ ORDER BY  : 어떤 항목에 대해 순위를 지정할 지 ORDER BY 절을 기술한다.
        ④ WINDOWING : 함수의 대상이 되는 행 기준의 범위를 강력하게 지정할 수 있다.
                        ROWS는 물리적인 결과 행의 수를, RANGE는 논리적인 값에 의해 나타내는데, 둘 중의 하나를 선택해서 사용할 수 있다.
                        
    
*/



/********************************************************************************************************************************************************************************/
/********************************************************************************************************************************************************************************/


/*
    ● RANK 함수 - 특정 항목(칼럼) / 특정범위(PARTITION)/ 전체 데이터에 대한 순위를 구하는 함수
    - 동일한 값에 대해서는 동일한 순위를 부여한다.
*/
--예제1) 사원 데이터에서 급여가 높은 순서와 JOB별로 급여가 높은 순서를 같이 출력한다.
SELECT
        ENAME,
        JOB,
        RANK()  OVER( ORDER BY SAL DESC ) AS ALL_RANK,
        RANK()  OVER( PARTITION BY JOB ORDER BY SAL DESC ) AS JOB_RANK
  FROM  EMP;
  /*
    ORDER BY SAL DESC 조건과 PARTITION BY JOB 조건이 충돌 : JOB별로는 정렬 X, ORDER BY SAL DESC 조건으로 정렬
    ★ 동일 순번일 때, 같은 순위를 부여하고 값을 뛰어넘음 : 1, 2, 2, 4 ... ...
  */

SELECT
        ENAME,
        JOB,
        SAL,
        RANK()  OVER( ORDER BY SAL DESC ) AS ALL_RANK
  FROM  EMP;
  
  
  
  
  
  
/*  
    ● DENSE_RANK() 함수 - RANK와 흡사하지만, 동일한 순서를 하나의 건수로 취급한다.
*/
--예제2) 사원데이터에서 급여가 높은 순서와, 동일한 순서를 하나의 등수로 간주한 결과도 같이 출력한다.
SELECT
        ENAME,
        JOB,
        RANK()          OVER( ORDER BY SAL ) AS RANK,
        DENSE_RANK()    OVER( ORDER BY SAL ) AS DENSE_RANK
  FROM  EMP;
  
  
  
/*
    ● ROW_NUMBER() 함수 - RANK나 DENSE_RANK와 유사하지만, 동일한 값이라도 고유한 순서를 부여한다.
*/
--예제3) 사원데이터에서 급여가 높은 순서와, 동일한 순위를 인정하지 않는 등수도 같이 출력한다.
SELECT  
        ENAME,
        JOB,
        RANK()          OVER( ORDER BY SAL ) AS RANK,
        ROW_NUMBER()    OVER( ORDER BY SAL ) AS ROW_NUMBER
  FROM  EMP;




/*
   ● 일반 집계 함수
*/

--예제4) 사원들의 급여와 같은 매니저를 두고 있는 사원들의 SAL 합을 구한다.

SELECT
        MGR,
        ENAME,
        SAL,
        SUM(SAL) OVER( PARTITION BY MGR ) MGR_SUM
  FROM  EMP;




/*
★★★★★★★
    LAG 함수
    파티션별 윈도우에서 이전 몇 번째 행의 값을 가져올 수 있다.
*/

--예제5) 직원들을 입사일자가 빠른 기준으로 정렬하고, 본인보다 입사일자가 한명 앞선 사원의 급여를 본인의 급여와 함께 출력한다.
SELECT
        ENAME,
        HIREDATE,
        LEAD(SAL)   OVER( ORDER BY HIREDATE ) AS AFTER_SAL,
        SAL,
        LAG(SAL)    OVER( ORDER BY HIREDATE ) AS PREV_SAL
  FROM  EMP;


/*
    LAG 함수는 3개의 ARGUMENT까지 사용할 수 있다.
    두 번째 인자는 몇 번째 앞의 행을 가져올지 결정하는 것이고(DEFAULT : 1), 세 번째 인자는 예를 들어 파티션의 첫 번째 행의 경우 가져올 데이터가 없어 NULL값이 들어오는데, 이 경우 다른 값으로
    바꿀 수 있다. 결과적으로 NVL이나 IS NULL의 기능과 유사하다.
    
    -LAG, LEAD 함수 사용시 ORDER BY 절은 필수 입력사항 이다.
*/

SELECT
        ENAME,
        HIREDATE,
        SAL,
        LAG(SAL, 2, 0)    OVER( ORDER BY HIREDATE ) AS PREV_SAL
  FROM  EMP;























    
 /*
    IN 연산자.
    - WHERE 대상컬럼  IN (조회할 값1, 조회할 값2, 조회할값 3, ... ... )
    
    IN연산자는 복수개의 조회할 값 중, 하나라도 일치하면 True가 되는 연산자 이다.
    아주 빠른 속도로 연산하여 사용빈도가 높고 활용도가 좋다.
    
 */
 
 
 /*
    ORDER BY 정렬
    - 컬럼을 지정하여 오름차순 또는 내림차순으로 정렬할 수 있다.
    
    [사용형식]
    ORDER BY 대상컬럼 {ASC || DESC} 
    
    ★ 생략 시 기본값은 - ASC  [오름차순]
                          DESC [내림차순]
                          
    ***************************************************
    SELECT
            칼럼1,
            칼럼2,
            ...
      FROM  테이블                             <- 여기까지 기본 SELECT 구문
     WHERE  조건식                             <- WHERE 조건절
     ORDER  BY  대상컬럼 {ASC | DESC}          <- ORDER BY 절
    ***************************************************
    
 */
 
 