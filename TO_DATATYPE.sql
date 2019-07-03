/*
    TO_CHAR(integer or date, format)
    숫자나 날짜를 문자로 변환해주는 함수.
    매개변수로 숫자나 날짜가 올 수 있고, 반환 결과를 특정 형식에 맞게 출력할 수 있다.
*/

SELECT
        TO_CHAR(123456789, '999,999,999')
  FROM  DUAL;
  
SELECT
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
  FROM  DUAL;


/*
    TO_NUMBER
    문자나 다른 유형의 숫자를 NUMBER형으로 변환하는 함수
*/
SELECT
        TO_NUMBER('123456')
  FROM  DUAL;
  
/*
    TO_DATE(char, format)
    문자를 날짜형으로 변환하는 함수.
*/

SELECT
        TO_DATE('20190703', 'YYYY-MM-DD')
  FROM  DUAL;
  
/*
    NVL(expr1, expr2)
    NVL2(expr1, expr2, expr3)
        - NVL  : expr1이 NULL일 경우 expr2를 반환한다.
        - NVL2 : expr1이 NULL이 아니면 expr2를 반환하고 NULL이면 expr3를 반환한다.
*/








