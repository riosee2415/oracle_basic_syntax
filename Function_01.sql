/*
    숫자함수
    1.  ABS      : 절대값을 구한다.
    2.  COS      : COSINE값을 구한다.
    3.  EXP      : e의 n승을 반환한다.
    4.  FLOOR    : 소수점 아래를 잘라낸다. (버림)
    5.  LOG      : LOG 값을 반환한다.
    6.  POWER    : power(m, n) m의 n승을 반환한다.
    7.  SIGN     : SIGN(n)  n < 0이면 -1 ,   n = 0 이면 -, n > 0 이면 1을 반환한다.
    8.  SIN      : SINE값을 반환한다.
    9.  TAN      : TANGENT 값을 반환한다.
    10. ROUND    : ROUND(숫자, 자릿수) 특정 자릿수에서 반올림한다.
    11. TRUNC    : TRUNC(숫자, 자릿수) 특정 자릿수에서 버림한다.
    12. MOD      : MOD(숫자, 숫자) 입력받은 수를 나눈 나머지 값을 반환한다.
*/

/*

*/

SELECT
    RTRIM('ACCOUNTING', 'ING')
FROM DUAL;

SELECT
    SYSDATE,
    SUBSTR(SYSDATE, -3)
  FROM DUAL;
  
SELECT
        SUBSTR('안녕하세요', 3, 2),
        SUBSTRB('안녕하세요', 3, 2),
        LENGTH('안녕하세요'),
        LENGTHB('안녕하세요'),
        INSTR('안녕하세요', '하', 1, 1)
  FROM  DUAL;
  

SELECT
        TO_CHAR(SYSDATE, 'YYYY-DD-MM-DY')
  FROM  DUAL;
  

SELECT
        ROUND(34.5678, 2)
  FROM DUAL;
  
SELECT
        ROUND(34.5678, -1)
  FROM DUAL;
  
  
  
SELECT
        'Welcome to Oracle' AS "적용 전",
        UPPER('Welcome to Oracle') AS "적용 후"
  FROM DUAL;
  

SELECT
        INITCAP('WELCOME TO ORACLE') AS "적용"
  FROM  DUAL;
  

SELECT
        LENGTH('오라클'),
        LENGTHB('오라클')
  FROM DUAL;
  

SELECT
        INSTR('OracleOracle', 'O', 1, 2)
  FROM DUAL;
  
  
SELECT
        ENAME,
        SUBSTR(HIREDATE, 1,2),
        SUBSTR(HIREDATE, 4,2)
  FROM  EMP;


SELECT
        TRIM('a' FROM 'aaaaaaaOracleaaaaa')
  FROM  DUAL;
  
  

  
