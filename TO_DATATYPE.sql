/*
    TO_CHAR(integer or date, format)
    ���ڳ� ��¥�� ���ڷ� ��ȯ���ִ� �Լ�.
    �Ű������� ���ڳ� ��¥�� �� �� �ְ�, ��ȯ ����� Ư�� ���Ŀ� �°� ����� �� �ִ�.
*/

SELECT
        TO_CHAR(123456789, '999,999,999')
  FROM  DUAL;
  
SELECT
        TO_CHAR(SYSDATE, 'YYYY-MM-DD')
  FROM  DUAL;


/*
    TO_NUMBER
    ���ڳ� �ٸ� ������ ���ڸ� NUMBER������ ��ȯ�ϴ� �Լ�
*/
SELECT
        TO_NUMBER('123456')
  FROM  DUAL;
  
/*
    TO_DATE(char, format)
    ���ڸ� ��¥������ ��ȯ�ϴ� �Լ�.
*/

SELECT
        TO_DATE('20190703', 'YYYY-MM-DD')
  FROM  DUAL;
  
/*
    NVL(expr1, expr2)
    NVL2(expr1, expr2, expr3)
        - NVL  : expr1�� NULL�� ��� expr2�� ��ȯ�Ѵ�.
        - NVL2 : expr1�� NULL�� �ƴϸ� expr2�� ��ȯ�ϰ� NULL�̸� expr3�� ��ȯ�Ѵ�.
*/








