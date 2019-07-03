--문제1) 직급이 중복되지 않고, 한 번씩 나열되도록 쿼리문을 작성하세요. (EMP 테이블 사용, 직급출력)
SELECT 
        DISTINCT(JOB)
  FROM  EMP
 WHERE  JOB IS NOT NULL;


 
--문제2) 급여가 1500이하인 사원의 사원번호, 사원명, 급여를 출력하는 SQL문을 작성하세요.
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  SAL < 1500;


--문제3) 사원번호가 7521이거나 7654이거나 7844인 사원의 급여를 검색하는 쿼리문을 비교연산자와 OR 논리연산자를 사용하여 작성하세요.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  EMPNO = 7521
    OR  EMPNO = 7654
    OR  EMPNO = 7844;
    
    
--문제4) BETWEEN 문을 사용해서 1987년 입사자를 출력하시오.
SELECT 
        TO_DATE('870101', 'YY/MM/DD'),
        TO_DATE('871231', 'YY/MM/DD')
  FROM  DUAL;

SELECT
        EMPNO,
        ENAME,
        HIREDATE
  FROM  EMP
 WHERE  TO_DATE(HIREDATE, 'YY/MM/DD') BETWEEN TO_DATE('870101', 'YY/MM/DD') AND TO_DATE('871231', 'YY/MM/DD');
 
 
 
/*
    LIKE 연산자와 와일드카드, NOT LIKE
    ○ 형식 : 컬럼 LIKE 비교값
    ○ LIKE연산자 사용 시 NULL허용 컬럼인 경우 NVL(컬럼, CHR(32))을 사용해 비교하도록 한다.
    ○ 와일드카드
        1) % :  문자가 없거나, 하나 이상의 문자에 어떤 값이 와도 상관없다.
        2) _ :  하나의 문자에 어떤 값이 와도 상관없다.
*/

--문제5) 와일드카드를 사용하여 사원 중에서 이름이 K로 시작하는 사원의 사원번호와 이름을 출력하는 쿼리를 작성하세요.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE 'K%';
 
 
--문제6) 와일드 카드를 사용하여, 사원 중에서 이름에 K를 포함하는 사원의 사원번호와 이름을 출력하는 쿼리를 작성하세요.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE '%K%';
 

--문제7) 와일드 카드를 사용하여, 사원 중에서 이름이 K로 끝나는 사원의 번호와 이름을 출력하는 쿼리를 작성하세요.
SELECT
        EMPNO,
        ENAME
  FROM  EMP
 WHERE  ENAME   LIKE '%K';
 
 
--문제8) 상관이 없는 사원을 검색하기 위한 SQL문을 작성하세요. (사원번호, 이름, 급여 출력)
SELECT
        EMPNO,
        ENAME,
        SAL
  FROM  EMP
 WHERE  MGR IS NULL;



