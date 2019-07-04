/*
    그룹함수
    ○ 목적        : 계산 및 통계처리를 위한 함수
    ○ 설명
        1. 테이블의 전체에서 통계적인 결과를 구하기 위해 행 집합에 적용하여 하나의 결과를 생산한다.
        2. 하나 이상의 행을 그룹으로 묶어 연산하여 총합, 평균 등 하나의 결과를 구한다.
        
    ○ 실행조건
        1. SELECT 키워드 다음에 쓸 수 없는 컬럼(실행 시 오류)
            ① 사번, 사원이름 등의 컬럼은 보통 한 그룹 안에 여러가지 값이 존재하므로 조회할 수 없다
            ② 특별한 기준이 없으므로 컴퓨터가 어느 레코드 하나만 알아서 가져다 줄 수 없음
        
        2. SELECT 키워드 다음에 쓸 수 있는 컬럼
            ① 어떤 그룹 안의 모든 사원의 부서번호는 항상 같아서 부서번호가 그 그룹을 대표할 수 있으므로 조회 가능
            ② 최대값이나 평균값 등도 그룹별로 하나로 묶어서 가지고 올 수 있으므로 조회가 가능
        
        EX)
        MIN(expr)   : 최소값
        MAX(expr)   : 최대값
        AVG(expr)   : 평균값
        COUNT(expr) : 컬럼에서 expr 행의 개수
        COUNT(*)    : NULL 값을 포함하여 행의 개수
        STDDEV(expr): 표준편차
        
        GOURP BY 절
        ○ 일반적으로 특정 그룹별 데이터를 필요로 할 경우에는 GROUP BY절을 그룹함수와 함꼐 사용한다.
        ○ ★GROUP BY절 사용 시, SELECT절에 지정 된 모든 컬럼을 포함해야 한다.
                
*/

--예제1. 부서별, 업무별로 그룹을 지어서 부서번호, 업무, 인원수, 급여의 평균, 합계 구하기
SELECT  
        DEPTNO,
        JOB,
        COUNT(*) AS RECORD,  
        AVG(SAL) AS AVG_SAL,
        SUM(SAL) AS SUM_SAL
  FROM  EMP
 GROUP  BY DEPTNO, JOB;


/*
    HAVING절
    ○ 그룹함수를 사용해 GROUP BY절을 사용할 때, 그룹들에 대한 제한 조건이 필요하여 사용하는 조건절 이다.
    ○ SELECT의 조건은 WHERE절, GROUP BY의 조건절은 HAVING절 이다.
*/

--예제2. 부서별로 사원의 수가 4명 이상인 사원의 부서번호, 급여의 합계 구하기
SELECT
        DEPTNO,
        SUM(SAL)
  FROM  EMP
 GROUP  BY  DEPTNO
HAVING  COUNT(*) >= 4;


--예제3. EMP테이블에서 직급이 CLERK이 아닌 사원에 대한 부서별로 급여의 함이 4000 이상인 부서의 정보를 출력
SELECT
        DEPTNO,
        SUM(SAL)
  FROM  EMP
 WHERE  JOB <> 'CLERK'
 GROUP  BY  DEPTNO
HAVING  SUM(SAL) >= 4000;


--예제4. EMP테이블에서 전체 급여가 5000을 초과하는 각 업무에 대해서 업무와 월급여의 합계를 출력
--      (업무중에서 MANAGER는 제외, 월급여의 합계로 내림차순)
SELECT
        JOB,
        SUM(SAL)
  FROM  EMP
 WHERE  JOB <> 'MANAGER'
 GROUP  BY  JOB
HAVING  SUM(SAL) > 5000;


--예제4. 부서별 사원수를 조회하라.
SELECT
        DEPTNO           AS "부서번호",
        COUNT(*) || '명' AS "사원 수"
  FROM  EMP
 GROUP  BY  DEPTNO;
 
 
--예제5. 부서별로 그룹하여 부서번호, 인원수, 급여의 평균, 급여의 합을 조회하라.
SELECT
        DEPTNO          AS "부서번호",
        COUNT(*)        AS "인원수",
        ROUND(AVG(SAL)) AS "평균 급여액",
        ROUND(SUM(SAL)) AS "총 금여액"
  FROM  EMP
 GROUP  BY  DEPTNO;
 

--예제6. 업무별로 그룹하여 업무, 인원수, 평균급여액, 최고급여액, 최저급여액 및 합계를 조회하라.
SELECT
        JOB                     AS "업무",
        COUNT(EMPNO) || '명'    AS "인원",
        ROUND(AVG(SAL))         AS "평균급여",
        MAX(SAL)                AS "최고급여",
        MIN(SAL)                AS "최저급여"
  FROM  EMP
 GROUP  BY  JOB;


/*
    GROUP BY 절은 집계함수 없이도 사용이 가능하다.
*/

--예제7. EMP테이블에 있는 부서를 조회하라.
SELECT
        DEPTNO
  FROM  EMP
 GROUP  BY DEPTNO;
 
 
--예제8. 사원수가 다섯 명이 넘는 부서와 사원수를 조회하라.
SELECT
        A.DEPTNO,
        B.DNAME,
        COUNT(A.EMPNO)
  FROM  EMP     A
  LEFT  OUTER
  JOIN  DEPT    B
    ON  A.DEPTNO = B.DEPTNO
 GROUP  BY  A.DEPTNO, B.DNAME
HAVING  COUNT(EMPNO) >= 5;

--예제9. 전체 월급이 5000을 초과하는 JOB에 대해서 JOB과 월급여 합계를 조회하라.
--      단, 판매원(SALES)은 제외하고 월 급여 합계로 내림차순 정렬하라.
SELECT
        JOB             AS "직무",
        SUM(SAL)        AS "월급여 합"
  FROM  EMP
 WHERE  JOB <> 'SALES'
 GROUP  BY JOB
HAVING  SUM(SAL) > 5000;