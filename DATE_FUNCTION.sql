/*
    �����Լ�
    1. ROUND �Լ� => �Ҽ��� Ư�� �ڸ������� �ݿø� �Ѵ�.
    - ������� : ROUND(����, �ڸ���);
*/
-- ����1 : 10.463�� �Ҽ��� ��°�ڸ����� �ݿø� �Ͻÿ�. (DUAL ���)
SELECT
        ROUND(10.463, 2) AS ANSWER
  FROM  DUAL;


-- ����2 : 10.463�� �Ҽ��� ��°���� �ݿø� �Ͻÿ�. (DUAL ���)
SELECT
        ROUND(10.463, 3) AS ANWER
  FROM  DUAL;


/*
    2. TRUNC �Լ� => �Ҽ��� Ư�� �ڸ������� �߶󳽴�.
*/
-- ����3 : 102.332�� �Ҽ��� �ι�° �ڸ����� �߶󳻽ÿ�. (DUAL ���)
SELECT
        TRUNC(102.332, 2) AS ANSWER
  FROM  DUAL;


/*
    ��¥�Լ�
    - SYSDATE�� SYSTIMESTAMP�� �������ڿ� �ð��� ���� DATE, TIMESTAMP ������ ��ȯ�Ѵ�.
*/
SELECT
        SYSDATE,
        SYSTIMESTAMP
  FROM  DUAL;

/*
    �ڡ� ADD_MONTHS(date, integer)
    ADD_MONTHS �Լ��� �Ű�������  ���� date Data�� integer ��ŭ ���� ���� ��¥�� ��ȯ�Ѵ�.
*/
SELECT
        ADD_MONTHS(SYSDATE, 2)
  FROM  DUAL;
  
/*
    MONTHS_BETWEEN(date1, date2)
    �� ��¥ ������ �������� ��ȯ�ϴµ�, date2�� date1���� ���� ��¥�� �´�.
*/
SELECT
        MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 3), SYSDATE) AS "���� ��"
  FROM  DUAL;
  

/*
    ROUND(date, format), TRUNC(date, format)
    �ݿø�, �߶󳻱�
    ROUND :    format�� 'month'�� ������ ���, �� �� 16���� �������� �ݿø��� �����Ͽ� ��ȯ�Ѵ�.
    TRUNC :    format�� 'month'�� ������ ���, ������ ���� �߶󳻱� �ϱ� ������ �ش� ���� 1���� ��ȯ�Ѵ�.
*/
SELECT
        ROUND(SYSDATE, 'month')
  FROM  DUAL;
  
SELECT
        TRUNC(SYSDATE, 'month')
  FROM  DUAL;

--����4 : ���� ��¥�� �������� 16~20�� ���̷� ���� ��, ROUND�� ����Ͽ� �ݿø��Ͻÿ�.
SELECT
        ROUND(SYSDATE + 15, 'month')
  FROM  DUAL;
  
  
/*
    NEXT_DAY(SYSATE, '�ݿ���')
    char�� �� �� �ִ� ���� '�Ͽ���'���� '�����'���� �ε�, �� ���� NLS_LANG�̶� ����Ŭ ȯ�溯���� ���� �ѱ��� �� �� ��,
    'SUNAY', 'MONDAY'ó�� ������ �� ���� �ִ�.
    ���� ����� �ش� ������ ��ȯ�Ѵ�.
*/

SELECT
        NEXT_DAY(SYSDATE, '�����')
  FROM  DUAL;
  
/*
    LAST_DAY(date)
    �ش� ���� ������ ��¥�� ��ȯ�Ѵ�.
 */
SELECT
        LAST_DAY(SYSDATE)
  FROM  DUAL;
  
SELECT
        LAST_DAY(ADD_MONTHS(SYSDATE, 3))
  FROM DUAL;

