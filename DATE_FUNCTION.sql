/*
    숫자함수
    1. ROUND 함수 => 소숫점 특정 자릿수에서 반올림 한다.
    - 사용형식 : ROUND(숫자, 자릿수);
*/
-- 예제1 : 10.463을 소숫점 둘째자리에서 반올림 하시오. (DUAL 사용)
SELECT
        ROUND(10.463, 2) AS ANSWER
  FROM  DUAL;


-- 예제2 : 10.463을 소숫점 셋째에서 반올림 하시오. (DUAL 사용)
SELECT
        ROUND(10.463, 3) AS ANWER
  FROM  DUAL;


/*
    2. TRUNC 함수 => 소숫점 특정 자릿수에서 잘라낸다.
*/
-- 예제3 : 102.332을 소숫점 두번째 자리에서 잘라내시오. (DUAL 사용)
SELECT
        TRUNC(102.332, 2) AS ANSWER
  FROM  DUAL;


/*
    날짜함수
    - SYSDATE와 SYSTIMESTAMP는 현재일자와 시간을 각각 DATE, TIMESTAMP 형으로 반환한다.
*/
SELECT
        SYSDATE,
        SYSTIMESTAMP
  FROM  DUAL;

/*
    ★★ ADD_MONTHS(date, integer)
    ADD_MONTHS 함수는 매개변수로  들어온 date Data에 integer 만큼 월을 더한 날짜를 반환한다.
*/
SELECT
        ADD_MONTHS(SYSDATE, 2)
  FROM  DUAL;
  
/*
    MONTHS_BETWEEN(date1, date2)
    두 날짜 사이의 개월수를 만환하는데, date2가 date1보다 빠른 날짜가 온다.
*/
SELECT
        MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 3), SYSDATE) AS "개월 수"
  FROM  DUAL;
  

/*
    ROUND(date, format), TRUNC(date, format)
    반올림, 잘라내기
    ROUND :    format이 'month'가 기준일 경우, 매 월 16일을 기준으로 반올림을 시행하여 반환한다.
    TRUNC :    format이 'month'가 기준일 경우, 무조건 월을 잘라내기 하기 때문에 해당 월의 1일을 반환한다.
*/
SELECT
        ROUND(SYSDATE, 'month')
  FROM  DUAL;
  
SELECT
        TRUNC(SYSDATE, 'month')
  FROM  DUAL;

--예제4 : 현재 날짜를 기준으로 16~20일 사이로 연산 후, ROUND를 사용하여 반올림하시오.
SELECT
        ROUND(SYSDATE + 15, 'month')
  FROM  DUAL;
  
  
/*
    NEXT_DAY(SYSATE, '금요일')
    char로 올 수 있는 값은 '일요일'에서 '토요일'까지 인데, 이 값은 NLS_LANG이란 오라클 환경변수에 따라 한글이 올 수 도,
    'SUNAY', 'MONDAY'처럼 영문이 올 수도 있다.
    가장 가까운 해당 요일을 반환한다.
*/

SELECT
        NEXT_DAY(SYSDATE, '토요일')
  FROM  DUAL;
  
/*
    LAST_DAY(date)
    해당 월의 마지막 날짜를 반환한다.
 */
SELECT
        LAST_DAY(SYSDATE)
  FROM  DUAL;
  
SELECT
        LAST_DAY(ADD_MONTHS(SYSDATE, 3))
  FROM DUAL;

