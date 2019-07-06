/*
    �����Լ�
    1.  ABS      : ���밪�� ���Ѵ�.
    2.  COS      : COSINE���� ���Ѵ�.
    3.  EXP      : e�� n���� ��ȯ�Ѵ�.
    4.  FLOOR    : �Ҽ��� �Ʒ��� �߶󳽴�. (����)
    5.  LOG      : LOG ���� ��ȯ�Ѵ�.
    6.  POWER    : power(m, n) m�� n���� ��ȯ�Ѵ�.
    7.  SIGN     : SIGN(n)  n < 0�̸� -1 ,   n = 0 �̸� -, n > 0 �̸� 1�� ��ȯ�Ѵ�.
    8.  SIN      : SINE���� ��ȯ�Ѵ�.
    9.  TAN      : TANGENT ���� ��ȯ�Ѵ�.
    10. ROUND    : ROUND(����, �ڸ���) Ư�� �ڸ������� �ݿø��Ѵ�.
    11. TRUNC    : TRUNC(����, �ڸ���) Ư�� �ڸ������� �����Ѵ�.
    12. MOD      : MOD(����, ����) �Է¹��� ���� ���� ������ ���� ��ȯ�Ѵ�.
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
        SUBSTR('�ȳ��ϼ���', 3, 2),
        SUBSTRB('�ȳ��ϼ���', 3, 2),
        LENGTH('�ȳ��ϼ���'),
        LENGTHB('�ȳ��ϼ���'),
        INSTR('�ȳ��ϼ���', '��', 1, 1)
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
        'Welcome to Oracle' AS "���� ��",
        UPPER('Welcome to Oracle') AS "���� ��"
  FROM DUAL;
  

SELECT
        INITCAP('WELCOME TO ORACLE') AS "����"
  FROM  DUAL;
  

SELECT
        LENGTH('����Ŭ'),
        LENGTHB('����Ŭ')
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
  
  

  
